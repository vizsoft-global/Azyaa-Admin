import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema/delivery_record.dart';
import 'schema/orders_record.dart';
import 'schema/users_record.dart';

const int _batchLookupChunkSize = 30;

Future<Map<String, UsersRecord>> batchFetchUsersByRef(
  List<DocumentReference> refs,
) async {
  if (refs.isEmpty) {
    return {};
  }
  final uniqueIds = {for (final ref in refs) ref.id};
  final result = <String, UsersRecord>{};
  final ids = uniqueIds.toList();

  for (var i = 0; i < ids.length; i += _batchLookupChunkSize) {
    final chunk = ids.sublist(i, min(i + _batchLookupChunkSize, ids.length));
    final snapshot = await UsersRecord.collection
        .where(FieldPath.documentId, whereIn: chunk)
        .get();
    for (final doc in snapshot.docs) {
      result[doc.id] = UsersRecord.fromSnapshot(doc);
    }
  }
  return result;
}

Future<Map<String, UsersRecord>> batchFetchUsersByUid(
  List<String> uids,
) async {
  if (uids.isEmpty) {
    return {};
  }
  final uniqueUids = uids.where((uid) => uid.isNotEmpty).toSet().toList();
  if (uniqueUids.isEmpty) {
    return {};
  }
  final result = <String, UsersRecord>{};

  for (var i = 0; i < uniqueUids.length; i += _batchLookupChunkSize) {
    final chunk =
        uniqueUids.sublist(i, min(i + _batchLookupChunkSize, uniqueUids.length));
    final snapshot = await UsersRecord.collection
        .where('uid', whereIn: chunk)
        .get();
    for (final doc in snapshot.docs) {
      final user = UsersRecord.fromSnapshot(doc);
      if (user.uid.isNotEmpty) {
        result[user.uid] = user;
      }
    }
  }
  return result;
}

Future<Map<String, DeliveryRecord>> batchFetchDeliveriesByRef(
  List<DocumentReference> refs,
) async {
  if (refs.isEmpty) {
    return {};
  }
  final uniqueIds = {for (final ref in refs) ref.id};
  final result = <String, DeliveryRecord>{};
  final ids = uniqueIds.toList();

  for (var i = 0; i < ids.length; i += _batchLookupChunkSize) {
    final chunk = ids.sublist(i, min(i + _batchLookupChunkSize, ids.length));
    final snapshot = await DeliveryRecord.collection
        .where(FieldPath.documentId, whereIn: chunk)
        .get();
    for (final doc in snapshot.docs) {
      result[doc.id] = DeliveryRecord.fromSnapshot(doc);
    }
  }
  return result;
}

class OrdersRowLookups {
  const OrdersRowLookups({
    required this.customers,
    required this.deliveries,
  });

  final Map<String, UsersRecord> customers;
  final Map<String, DeliveryRecord> deliveries;
}

Future<OrdersRowLookups> loadOrdersRowLookups(
  List<OrdersRecord> orders,
  String choice,
) async {
  final customerRefs = <DocumentReference>{};
  final deliveryRefs = <DocumentReference>{};

  for (final order in orders) {
    if (order.customerRef != null) {
      customerRefs.add(order.customerRef!);
    }
    if (choice == 'Delivery Ongoing') {
      for (final item in order.orderItems.cartItems) {
        final deliveryInfo = order.deliveryInfoList
            .where((e) => e.productIds.contains(item.productId))
            .firstOrNull;
        if (deliveryInfo?.deliveryRef != null &&
            deliveryInfo!.deliveryTrackingId != '') {
          deliveryRefs.add(deliveryInfo.deliveryRef!);
        }
      }
    }
  }

  final results = await Future.wait([
    batchFetchUsersByRef(customerRefs.toList()),
    batchFetchDeliveriesByRef(deliveryRefs.toList()),
  ]);

  return OrdersRowLookups(
    customers: results[0] as Map<String, UsersRecord>,
    deliveries: results[1] as Map<String, DeliveryRecord>,
  );
}
