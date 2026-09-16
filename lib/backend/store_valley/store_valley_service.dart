import 'package:cloud_functions/cloud_functions.dart';
import 'package:store_valley_sdk/store_valley_sdk.dart';

import '/backend/api_requests/api_manager.dart';
import 'store_valley_address.dart';
import 'store_valley_config.dart';

class StoreValleyException implements Exception {
  StoreValleyException(this.message, {this.statusCode = 500});

  final String message;
  final int statusCode;

  @override
  String toString() => message;
}

class StoreValleyService {
  StoreValleyService._();

  static final StoreValleyService instance = StoreValleyService._();

  Future<Map<String, dynamic>> _proxy({
    required String method,
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? notifyCustomer,
  }) async {
    try {
      final result = await FirebaseFunctions.instance
          .httpsCallable(StoreValleyConfig.proxyCallableName)
          .call({
        'method': method,
        'path': path,
        if (body != null) 'body': _stripNulls(body),
        if (query != null) 'query': query,
        if (notifyCustomer != null) 'notifyCustomer': notifyCustomer,
      });
      final data = Map<String, dynamic>.from(result.data as Map);
      final status = (data['status'] as num?)?.toInt() ?? 500;
      final upstream = data['body'];
      final parsed = upstream is Map
          ? _stripNulls(Map<String, dynamic>.from(upstream))
          : <String, dynamic>{'data': upstream};
      if (status < 200 || status >= 300) {
        throw StoreValleyException(
          parsed['message']?.toString() ?? 'Store Valley request failed',
          statusCode: status,
        );
      }
      final pickupOtp = data['pickup_otp']?.toString();
      if (pickupOtp != null && pickupOtp.isNotEmpty) {
        parsed['pickup_otp'] = pickupOtp;
      }
      return parsed;
    } on StoreValleyException {
      rethrow;
    } on FirebaseFunctionsException catch (error) {
      throw StoreValleyException(
        error.message ?? 'Store Valley proxy failed',
        statusCode: 500,
      );
    }
  }

  Future<DeliveryOrderResponse> createDelivery(
    DeliveryRequest request, {
    Map<String, dynamic>? notifyCustomer,
    bool generateDeliveryOtp = true,
  }) async {
    final body = request.toJson();
    if (generateDeliveryOtp) {
      body['requires_otp_proof'] = true;
      body.remove('delivery_otp');
    }
    final json = await _proxy(
      method: 'POST',
      path: '/orders',
      body: body,
      notifyCustomer: notifyCustomer,
    );
    return DeliveryOrderResponse.fromJson(_withDeliveryDefaults(json));
  }

  Future<DeliveryOrderResponse> getDelivery(String id) async {
    final json = await _proxy(method: 'GET', path: '/orders/$id');
    return DeliveryOrderResponse.fromJson(_withDeliveryDefaults(json));
  }

  Future<Map<String, dynamic>> listDeliveries({
    int limit = 50,
    String? status,
    String? startingAfter,
  }) {
    return _proxy(
      method: 'GET',
      path: '/orders',
      query: {
        'limit': limit,
        if (status != null) 'status': status,
        if (startingAfter != null) 'starting_after': startingAfter,
      },
    );
  }

  Future<Map<String, dynamic>> cancelDelivery(String id) {
    return _proxy(method: 'DELETE', path: '/orders/$id');
  }

  Future<LogisticsRequestResponse> createIntake(
    WarehouseIntakeRequest request, {
    Map<String, dynamic>? notifyCustomer,
    bool generatePickupOtp = true,
  }) async {
    return LogisticsRequestResponse.fromJson(
      await createIntakeMap(
        request,
        notifyCustomer: notifyCustomer,
        generatePickupOtp: generatePickupOtp,
      ),
    );
  }

  Future<Map<String, dynamic>> createIntakeMap(
    WarehouseIntakeRequest request, {
    Map<String, dynamic>? notifyCustomer,
    bool generatePickupOtp = true,
  }) async {
    final body = StoreValleyAddress.prepareWarehouseIntakeBody(
      Map<String, dynamic>.from(request.toJson()),
      generatePickupOtp: generatePickupOtp,
    );
    final json = await _proxy(
      method: 'POST',
      path: '/warehouse-intake-requests',
      body: body,
      notifyCustomer: {
        'otpType': 'designer_pickup',
        ...?notifyCustomer,
      },
    );
    return _withLogisticsDefaults(json);
  }

  Future<LogisticsRequestResponse> getIntake(String id) async {
    final json = await _proxy(
      method: 'GET',
      path: '/warehouse-intake-requests/$id',
    );
    return LogisticsRequestResponse.fromJson(_withLogisticsDefaults(json));
  }

  Future<LogisticsRequestResponse> createPickup(
    PickupRequest request, {
    Map<String, dynamic>? notifyCustomer,
    bool generateDeliveryOtp = true,
  }) async {
    final body = request.toJson();
    if (generateDeliveryOtp) {
      body['requires_otp_proof'] = true;
      body.remove('delivery_otp');
    }
    final json = await _proxy(
      method: 'POST',
      path: '/pickup-requests',
      body: body,
      notifyCustomer: notifyCustomer,
    );
    return LogisticsRequestResponse.fromJson(_withLogisticsDefaults(json));
  }

  Future<LogisticsRequestResponse> getPickup(String id) async {
    final json = await _proxy(method: 'GET', path: '/pickup-requests/$id');
    return LogisticsRequestResponse.fromJson(_withLogisticsDefaults(json));
  }

  Future<LogisticsRequestResponse> createReturn(
    ReturnRequest request, {
    Map<String, dynamic>? notifyCustomer,
    bool generatePickupOtp = true,
  }) async {
    final body = request.toJson();
    if (generatePickupOtp) {
      body['requires_otp_proof'] = true;
      body.remove('delivery_otp');
    }
    final json = await _proxy(
      method: 'POST',
      path: '/return-requests',
      body: body,
      notifyCustomer: {
        'otpType': 'return_pickup',
        ...?notifyCustomer,
      },
    );
    return LogisticsRequestResponse.fromJson(_withLogisticsDefaults(json));
  }

  Future<LogisticsRequestResponse> getReturn(String id) async {
    final json = await _proxy(method: 'GET', path: '/return-requests/$id');
    return LogisticsRequestResponse.fromJson(_withLogisticsDefaults(json));
  }

  Future<InventorySnapshotResponse> getInventory({
    required String designerId,
    required String warehouseId,
    int limit = 50,
    String? startingAfter,
  }) async {
    final json = await _proxy(
      method: 'GET',
      path: '/inventory',
      query: {
        'designer_id': designerId,
        'warehouse_id': warehouseId,
        'limit': limit,
        if (startingAfter != null) 'starting_after': startingAfter,
      },
    );
    return InventorySnapshotResponse.fromJson(json);
  }

  ApiCallResponse toApiCallResponse(Map<String, dynamic> json) {
    final trackingId = json['order_id'] ??
        json['request_id'] ??
        json['delivery_order_id'] ??
        '';
    return ApiCallResponse(
      {
        ...json,
        'data': [
          {
            'reference': json['client_order_id'] ?? json['external_request_id'],
            'swftboxTracking': trackingId,
            'original_source_location_id': json['original_source_location_id'],
            'delivery_order_id': json['delivery_order_id'] ?? json['order_id'],
            'status': json['status'],
            'state': json['status'],
            'updatedAt': json['updated_at'],
            'stage': json['status'],
            if (json['pickup_otp'] != null) 'pickup_otp': json['pickup_otp'],
          }
        ],
        if (json['pickup_otp'] != null) 'pickup_otp': json['pickup_otp'],
      },
      const {},
      200,
    );
  }

  ApiCallResponse toTrackResponse(Map<String, dynamic> json) {
    final status = json['status']?.toString() ?? '';
    final otp = json['otp_verification'];
    final otpStatus = json['otp_verification_status'] ??
        (otp is Map ? otp['status'] : null);
    return ApiCallResponse(
      {
        ...json,
        'data': {
          'stage': status,
          'state': status,
          'status': status,
          'request_id': json['request_id'],
          'external_request_id': json['external_request_id'],
          'delivery_order_id': json['delivery_order_id'],
          if (otpStatus != null) 'otp_verification_status': otpStatus,
        },
      },
      const {},
      200,
    );
  }

  ApiCallResponse errorResponse(StoreValleyException error) {
    return ApiCallResponse(
      {'message': error.message, 'error': error.message},
      const {},
      error.statusCode,
      exception: error,
    );
  }

  Map<String, dynamic> _stripNulls(Map<String, dynamic> input) {
    final out = <String, dynamic>{};
    input.forEach((key, value) {
      if (value == null) {
        return;
      }
      if (value is Map) {
        out[key] = _stripNulls(Map<String, dynamic>.from(value));
      } else if (value is List) {
        out[key] = value
            .where((item) => item != null)
            .map((item) => item is Map
                ? _stripNulls(Map<String, dynamic>.from(item))
                : item)
            .toList();
      } else {
        out[key] = value;
      }
    });
    return out;
  }

  Map<String, dynamic> _withDeliveryDefaults(Map<String, dynamic> json) {
    return {
      ...json,
      'order_id': json['order_id'] ?? json['request_id'] ?? '',
      'original_source_location_id':
          json['original_source_location_id'] ?? StoreValleyConfig.pickupLocationId,
      'status': json['status'] ?? '',
    };
  }

  Map<String, dynamic> _withLogisticsDefaults(Map<String, dynamic> json) {
    return {
      ...json,
      'request_id': json['request_id'] ?? json['order_id'] ?? '',
      'external_request_id': json['external_request_id'] ??
          json['client_order_id'] ??
          '',
      'status': json['status'] ?? '',
    };
  }
}
