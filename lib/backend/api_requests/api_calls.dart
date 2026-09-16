import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/backend/store_valley/store_valley_legacy.dart';
import '/backend/store_valley/store_valley_service.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OTPless Group Code

class OTPlessGroup {
  static String getBaseUrl({
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) =>
      '${url}';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'x-requested-with': 'https://proxy.vizsoft.in',
  };
  static SendCall sendCall = SendCall();
  static ResendCall resendCall = ResendCall();
  static VerifyCall verifyCall = VerifyCall();
  static SendSMSCall sendSMSCall = SendSMSCall();
  static VerifySMSCall verifySMSCall = VerifySMSCall();
  static EmailSendCall emailSendCall = EmailSendCall();
}

class SendCall {
  Future<ApiCallResponse> call({
    String? phoneno = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "phoneNumber": "${phoneno}",
  "otpLength": 6,
  "channel": "WHATSAPP",
  "expiry": 300
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send',
      apiUrl: '${baseUrl}send_opt_whatsapp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic orderId(dynamic response) => getJsonField(
        response,
        r'''$.orderId''',
      );
}

class ResendCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "orderId": "${orderId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Resend',
      apiUrl: '${baseUrl}resend_opt_whatsapp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic orderid(dynamic response) => getJsonField(
        response,
        r'''$.orderId''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class VerifyCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    int? otp,
    String? phoneno = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "orderId": "${orderId}",
  "otp": "${otp}",
  "phoneNumber": "${phoneno}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify',
      apiUrl: '${baseUrl}verify_opt_whatsapp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? result(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isOTPVerified''',
      ));
}

class SendSMSCall {
  Future<ApiCallResponse> call({
    String? phoneno = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "phoneNumber": "${phoneno}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendSMS',
      apiUrl: '${baseUrl}send_opt_sms',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic requestId(dynamic response) => getJsonField(
        response,
        r'''$.requestId''',
      );
}

class VerifySMSCall {
  Future<ApiCallResponse> call({
    String? requestId = '',
    String? otp = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
    "requestId": "${requestId}",
    "otp": "${otp}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VerifySMS',
      apiUrl: '${baseUrl}verify_opt_sms',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.isOTPVerified''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic requestID(dynamic response) => getJsonField(
        response,
        r'''$.requestId''',
      );
}

class EmailSendCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "expiry": "86400"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Email Send',
      apiUrl: '${baseUrl}send_opt_email',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? requestID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.requestId''',
      ));
}

/// End OTPless Group Code

/// Start Upayment Group Code

class UpaymentGroup {
  static String getBaseUrl({
    String? url = 'sandboxapi',
    String? aPIkey = 'jtest123',
  }) =>
      'https://proxy.vizsoft.in/https://${url}.upayments.com/api/v1/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [APIkey]',
    'accept': 'application/json',
    'content-type': 'application/json',
    'x-requested-with': 'https://proxy.vizsoft.in',
  };
  static ChargeCall chargeCall = ChargeCall();
  static StatusCall statusCall = StatusCall();
}

class ChargeCall {
  Future<ApiCallResponse> call({
    String? orderId = '202210101202210123',
    String? programRef = '202210101202210123',
    String? programTitle = '',
    String? programPrice = '',
    String? customerId = '',
    String? customerName = '',
    String? customerEmail = '',
    String? customerPhone = '',
    String? returnURL = '',
    String? cancelURL = '',
    String? notificationURL = '',
    String? url = 'sandboxapi',
    String? aPIkey = 'jtest123',
  }) async {
    final baseUrl = UpaymentGroup.getBaseUrl(
      url: url,
      aPIkey: aPIkey,
    );

    final ffApiRequestBody = '''
{
  "order": {
    "id": "${orderId}",
    "reference": "${programRef}",
    "description": "${programTitle}",
    "currency": "KWD",
    "amount": "${programPrice}"
  },
  "language": "en",
  "paymentGateway": {
    "src": "knet"
  },
  "reference": {
    "id": "${orderId}"
  },
  "customer": {
    "uniqueId": "${customerId}",
    "name": "${customerName}",
    "email": "${customerEmail}",
    "mobile": "${customerPhone}"
  },
  "returnUrl": "${returnURL}",
  "cancelUrl": "${cancelURL}",
  "notificationUrl": "${notificationURL}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Charge',
      apiUrl: '${baseUrl}charge',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${aPIkey}',
        'accept': 'application/json',
        'content-type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? chargeLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.link''',
      ));
  String? chargeMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class StatusCall {
  Future<ApiCallResponse> call({
    String? trackId = '',
    String? url = 'sandboxapi',
    String? aPIkey = 'jtest123',
  }) async {
    final baseUrl = UpaymentGroup.getBaseUrl(
      url: url,
      aPIkey: aPIkey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Status',
      apiUrl: '${baseUrl}get-payment-status/${trackId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${aPIkey}',
        'accept': 'application/json',
        'content-type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {
        'trackId': trackId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? paymentID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.transaction.payment_id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.transaction.result''',
      ));
  String? paymentTYPE(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.transaction.payment_type''',
      ));
  String? paymentMETHOD(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.transaction.payment_method''',
      ));
}

/// End Upayment Group Code

/// Start TAP Group Code

class TapGroup {
  static String getBaseUrl({
    String? secreatKey = '',
    String? url = 'https://proxy.vizsoft.in/https://api.tap.company/',
  }) =>
      '${url}v2/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [secreatKey]',
    'x-requested-with': 'https://proxy.vizsoft.in',
  };
  static ChargeAPICall chargeAPICall = ChargeAPICall();
  static StatusAPICall statusAPICall = StatusAPICall();
}

class ChargeAPICall {
  Future<ApiCallResponse> call({
    double? amount,
    String? productList = '',
    String? clientname = '',
    String? orderID = '',
    String? clientemail = '',
    String? clientphone = '',
    int? merchantid,
    String? postURL = '',
    String? redirectURL = '',
    String? secreatKey = '',
    String? url = 'https://proxy.vizsoft.in/https://api.tap.company/',
  }) async {
    final baseUrl = TapGroup.getBaseUrl(
      secreatKey: secreatKey,
      url: url,
    );

    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "currency": "KWD",
  "threeDSecure": true,
  "save_card": false,
  "description": "${productList}",
  "statement_descriptor": "${clientname}",
  "metadata": {},
  "reference": {
    "transaction": "txn_0001",
    "order": "${orderID}"
  },
  "receipt": {
    "email": false,
    "sms": true
  },
  "customer": {
    "first_name": "${clientname}",
    "middle_name": "",
    "last_name": "",
    "email": "${clientemail}",
    "phone": {
      "country_code": "",
      "number": "${clientphone}"
    }
  },
  "merchant": {
    "id": "${merchantid}"
  },
  "source": {
    "id": "src_all"
  },
  "post": {
    "url": "${postURL}"
  },
  "redirect": {
    "url": "${redirectURL}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChargeAPI',
      apiUrl: '${baseUrl}charges',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${secreatKey}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? chargeId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? chargeUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.transaction.url''',
      ));
  String? changeRedirect(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.redirect.url''',
      ));
  String? changePost(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.post.url''',
      ));
}

class StatusAPICall {
  Future<ApiCallResponse> call({
    String? chargeid = '',
    String? secreatKey = '',
    String? url = 'https://proxy.vizsoft.in/https://api.tap.company/',
  }) async {
    final baseUrl = TapGroup.getBaseUrl(
      secreatKey: secreatKey,
      url: url,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StatusAPI',
      apiUrl: '${baseUrl}charges/${chargeid}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${secreatKey}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {
        'chargeid': chargeid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? chargeId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amount''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? merchantId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.merchant.id''',
      ));
  String? gatewayRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reference.gateway''',
      ));
  String? paymentRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reference.payment''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.transaction.created''',
      ));
  String? paymentMethod(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.source.payment_method''',
      ));
  String? paymentType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.source.payment_type''',
      ));
}

/// End TAP Group Code

/// Start Upload files or Images Group Code

class UploadFilesOrImagesGroup {
  static String getBaseUrl() =>
      'https://proxy.vizsoft.in/https://standalone-5vgm.onrender.com/';
  static Map<String, String> headers = {
    'x-requested-with': 'https://proxy.vizsoft.in',
    'origin': 'https://proxy.vizsoft.in',
  };
  static UploadFileOrImageCall uploadFileOrImageCall = UploadFileOrImageCall();
}

class UploadFileOrImageCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) async {
    final baseUrl = UploadFilesOrImagesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'upload file or image',
      apiUrl: '${baseUrl}process_file',
      callType: ApiCallType.POST,
      headers: {
        'x-requested-with': 'https://proxy.vizsoft.in',
        'origin': 'https://proxy.vizsoft.in',
      },
      params: {
        'file': file,
        'process': 2,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Upload files or Images Group Code

/// Start Myfatoorah Group Code

class MyfatoorahGroup {
  static String getBaseUrl({
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) =>
      'https://proxy.vizsoft.in/https://${url}.myfatoorah.com/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer [token]',
    'x-requested-with': 'https://proxy.vizsoft.in',
  };
  static InvoiceCall invoiceCall = InvoiceCall();
  static InvoiceStatusCall invoiceStatusCall = InvoiceStatusCall();
  static ExecuteCall executeCall = ExecuteCall();
  static MakeRefundCall makeRefundCall = MakeRefundCall();
  static GetRefundStatusCall getRefundStatusCall = GetRefundStatusCall();
}

class InvoiceCall {
  Future<ApiCallResponse> call({
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) async {
    final baseUrl = MyfatoorahGroup.getBaseUrl(
      token: token,
      url: url,
    );

    final ffApiRequestBody = '''
{
  "CustomerName": "name",
  "NotificationOption": "ALL",
  "MobileCountryCode": "965",
  "CustomerMobile": "12345678",
  "CustomerEmail": "rohit@vizsoft.in",
  "InvoiceValue": 100,
  "DisplayCurrencyIso": "kwd",
  "CallBackUrl": "https://yoursite.com/success",
  "ErrorUrl": "https://yoursite.com/error",
  "WebhookUrl": "https://hook.us1.make.com/p7og7qm3g9v7amn2rdx6odh24brwvypj?project=azyaa&&paymenttype=myfatoorah",
  "Language": "en",
  "CustomerReference": "ORDAZYA10087",
  "CustomerAddress": {
    "Block": "string",
    "Street": "string",
    "HouseBuildingNo": "string",
    "Address": "address",
    "AddressInstructions": "string"
  },
  "InvoiceItems": [
    {
      "ItemName": "string",
      "Quantity": 20,
      "UnitPrice": 5
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Invoice',
      apiUrl: '${baseUrl}v2/SendPayment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? invoiceID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Data.InvoiceId''',
      ));
  String? invoiceURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceURL''',
      ));
}

class InvoiceStatusCall {
  Future<ApiCallResponse> call({
    String? invoiceId = '',
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) async {
    final baseUrl = MyfatoorahGroup.getBaseUrl(
      token: token,
      url: url,
    );

    final ffApiRequestBody = '''
{
  "Key": "${invoiceId}",
  "KeyType": "Invoiceid"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Invoice Status',
      apiUrl: '${baseUrl}v2/GetPaymentStatus',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceStatus''',
      ));
  int? invoiceID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Data.InvoiceId''',
      ));
  double? invoiceAmount(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Data.InvoiceValue''',
      ));
  String? invoiceMethod(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceTransactions[1].PaymentGateway''',
      ));
  String? paymentID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceTransactions[1].PaymentId''',
      ));
  String? referenceID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceTransactions[1].ReferenceId''',
      ));
  String? invoiceRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceReference''',
      ));
  String? transactionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceTransactions[1].TransactionId''',
      ));
}

class ExecuteCall {
  Future<ApiCallResponse> call({
    String? customerName = '',
    String? customerDailCode = '',
    String? customerPhone = '',
    String? customerEmail = '',
    double? programPrice,
    String? returnURL = '',
    String? orderId = '',
    String? cartInfo = '',
    String? paymentMethodID = '',
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) async {
    final baseUrl = MyfatoorahGroup.getBaseUrl(
      token: token,
      url: url,
    );

    final ffApiRequestBody = '''
{
   "PaymentMethodId":${paymentMethodID},
   "CustomerName":"${customerName}",
   "DisplayCurrencyIso":"KWD",
   "MobileCountryCode":"${customerDailCode}",
   "CustomerMobile":"${customerPhone}",
   "CustomerEmail":"${customerEmail}",
   "InvoiceValue": ${programPrice},
   "CallBackUrl": "${returnURL}",
   "ErrorUrl": "${returnURL}",
   "WebhookUrl": "https://hook.us1.make.com/p7og7qm3g9v7amn2rdx6odh24brwvypj?project=azyaa&&paymenttype=myfatoorah",
   "Language":"en",
   "CustomerReference":"${orderId}",
   "UserDefinedField": "${cartInfo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Execute',
      apiUrl: '${baseUrl}v2/ExecutePayment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? invoiceID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Data.InvoiceId''',
      ));
  String? paymentURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.PaymentURL''',
      ));
}

class MakeRefundCall {
  Future<ApiCallResponse> call({
    String? key = '',
    String? keyType = '',
    bool? serviceChargeOnCustomer,
    double? amount,
    String? comment = '',
    double? amountDeductedFromSupplier,
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) async {
    final baseUrl = MyfatoorahGroup.getBaseUrl(
      token: token,
      url: url,
    );

    final ffApiRequestBody = '''
{
  "Key": "${escapeStringForJson(key)}",
  "KeyType": "${escapeStringForJson(keyType)}",
  "ServiceChargeOnCustomer": ${serviceChargeOnCustomer},
  "Amount": ${amount},
  "Comment": "${escapeStringForJson(comment)}",
  "AmountDeductedFromSupplier": ${amountDeductedFromSupplier}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MakeRefund',
      apiUrl: '${baseUrl}/v2/MakeRefund',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.IsSuccess''',
      ));
  int? refundID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Data.RefundId''',
      ));
  String? refundRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.RefundReference''',
      ));
  double? amount(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Data.Amount''',
      ));
  String? comment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.Comment''',
      ));
  int? refundInvoiceID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Data.RefundInvoiceId''',
      ));
}

class GetRefundStatusCall {
  Future<ApiCallResponse> call({
    String? key = '',
    String? keyType = '',
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) async {
    final baseUrl = MyfatoorahGroup.getBaseUrl(
      token: token,
      url: url,
    );

    final ffApiRequestBody = '''
{
  "Key": "${key}",
  "KeyType": "${keyType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetRefundStatus',
      apiUrl: '${baseUrl}/v2/GetRefundStatus',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? refundStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.RefundStatusResult[:].RefundStatus''',
      ));
  int? refundID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Data.RefundStatusResult[:].RefundId''',
      ));
  double? amount(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Data.RefundStatusResult[:].Amount''',
      ));
  double? refundAmount(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Data.RefundStatusResult[:].RefundAmount''',
      ));
}

/// End Myfatoorah Group Code

/// Start Prime Express Delivery Group Code

class PrimeExpressDeliveryGroup {
  static String getBaseUrl({
    String? url = 'https://backend.vizsoft.in/',
    String? key = '',
  }) =>
      '${url}';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetAccessTokenCall getAccessTokenCall = GetAccessTokenCall();
  static CreateDeliveryCall createDeliveryCall = CreateDeliveryCall();
  static TrackDeliveryCall trackDeliveryCall = TrackDeliveryCall();
  static CancelDeliveryCall cancelDeliveryCall = CancelDeliveryCall();
}

class GetAccessTokenCall {
  Future<ApiCallResponse> call({
    String? env = 'test',
    String? clientId = '',
    String? clientSecret = '',
    String? url = '',
    String? key = '',
  }) async {
    return ApiCallResponse(
      {'accessToken': 'store-valley'},
      const {},
      200,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.accessToken''',
      ));
}

class CreateDeliveryCall {
  Future<ApiCallResponse> call({
    String? env = '',
    String? orderID = '',
    String? fromName = '',
    String? fromPhone = '',
    String? fromAddress = '',
    String? fromCity = '',
    String? fromCountry = '',
    double? fromlatitude,
    double? fromlongitude,
    String? toName = '',
    String? toPhone = '',
    String? toAddress = '',
    String? toCity = '',
    String? toCountry = '',
    double? tolatitude,
    double? tolongitude,
    double? amount,
    dynamic itemsListJson,
    bool? otpOnDelivery,
    bool? b2bHandling,
    bool? oversized,
    bool? returnStatus,
    int? packageCount,
    String? invtrackID = '',
    String? toCountryCode = '',
    String? fromCountryCode = '',
    String? toEmail = '',
    String? deliveryInstructions = '',
    String? url = '',
    String? key = '',
    String? designerId,
    String? warehouseId,
    String? pickupLocationId,
    String? packagingProfile,
    String? originalSourceLocationId,
    String? pickupPurpose,
    String? customerUserId,
    String? orderKind,
    String? fromBuilding,
    String? fromBlock,
    String? fromGovernorate,
    String? toBuilding,
    String? toBlock,
    String? toGovernorate,
  }) async {
    final customerFacing = b2bHandling != true && returnStatus != true;
    return StoreValleyLegacyMapper.create(
      orderID: orderID ?? '',
      invtrackID: invtrackID ?? '',
      fromName: fromName ?? '',
      fromPhone: fromPhone ?? '',
      fromAddress: fromAddress ?? '',
      fromCity: fromCity ?? '',
      fromCountry: fromCountry ?? '',
      fromlatitude: fromlatitude,
      fromlongitude: fromlongitude,
      toName: toName ?? '',
      toPhone: toPhone ?? '',
      toAddress: toAddress ?? '',
      toCity: toCity ?? '',
      toCountry: toCountry ?? '',
      tolatitude: tolatitude,
      tolongitude: tolongitude,
      itemsListJson: itemsListJson,
      otpOnDelivery: otpOnDelivery ?? customerFacing,
      b2bHandling: b2bHandling ?? false,
      returnStatus: returnStatus ?? false,
      deliveryInstructions: deliveryInstructions,
      toEmail: toEmail,
      designerId: designerId,
      warehouseId: warehouseId,
      pickupLocationId: pickupLocationId,
      packagingProfile: packagingProfile,
      originalSourceLocationId: originalSourceLocationId,
      pickupPurpose: pickupPurpose,
      customerUserId: customerUserId,
      orderKind: orderKind,
      fromBuilding: fromBuilding,
      fromBlock: fromBlock,
      fromGovernorate: fromGovernorate,
      toBuilding: toBuilding,
      toBlock: toBlock,
      toGovernorate: toGovernorate,
    );
  }

  String? orderID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].reference''',
      ));
  String? swftboxID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].swftboxTracking''',
      ));
  String? shippinUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].shippingLabelUrl''',
      ));
  String? trackingUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].trackingUrl''',
      ));
}

class TrackDeliveryCall {
  Future<ApiCallResponse> call({
    String? env = '',
    String? trackID = '',
    String? url = '',
    String? key = '',
  }) async {
    final service = StoreValleyService.instance;
    final id = trackID ?? '';
    try {
      final order = await service.getDelivery(id);
      return service.toTrackResponse(order.toJson());
    } on StoreValleyException {
      try {
        final intake = await service.getIntake(id);
        return service.toTrackResponse(intake.toJson());
      } on StoreValleyException {
        try {
          final pickup = await service.getPickup(id);
          return service.toTrackResponse(pickup.toJson());
        } on StoreValleyException {
          try {
            final ret = await service.getReturn(id);
            return service.toTrackResponse(ret.toJson());
          } on StoreValleyException catch (error) {
            return service.errorResponse(error);
          }
        }
      }
    }
  }

  String? deliveryStage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.stage''',
      ));
  String? deliveryState(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.state''',
      ));
  String? deliveryStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status''',
      ));
  String? pickupFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.to.pickupFee''',
      ));
}

class CancelDeliveryCall {
  Future<ApiCallResponse> call({
    String? env = '',
    String? trackID = '',
    String? url = '',
    String? key = '',
  }) async {
    final service = StoreValleyService.instance;
    try {
      final json = await service.cancelDelivery(trackID ?? '');
      return service.toApiCallResponse({
        ...json,
        'status': json['status'] ?? 'cancelled',
      });
    } on StoreValleyException catch (error) {
      return service.errorResponse(error);
    }
  }

  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].state''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].status''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].updatedAt''',
      ));
}

/// End Prime Express Delivery Group Code

class CountryISOCall {
  static Future<ApiCallResponse> call({
    String? name = 'Kuwait',
    String? url = 'https://restcountries.com/v3.1/name',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CountryISO',
      apiUrl: '${url}/${name}?fields=name,cca2,cca3',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'origin': 'https://proxy.vizsoft.in',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? iso(dynamic response) => (getJsonField(
        response,
        r'''$[:].cca2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
