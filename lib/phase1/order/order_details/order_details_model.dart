import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'order_details_widget.dart' show OrderDetailsWidget;
import 'package:flutter/material.dart';

class OrderDetailsModel extends FlutterFlowModel<OrderDetailsWidget> {
  ///  Local state fields for this page.

  String customerFilters = 'All Customers';

  String searchStatus = 'Hide';

  String permissionKey = 'order';

  List<UserCartItemsStruct> cartItems = [];
  void addToCartItems(UserCartItemsStruct item) => cartItems.add(item);
  void removeFromCartItems(UserCartItemsStruct item) => cartItems.remove(item);
  void removeAtIndexFromCartItems(int index) => cartItems.removeAt(index);
  void insertAtIndexInCartItems(int index, UserCartItemsStruct item) =>
      cartItems.insert(index, item);
  void updateCartItemsAtIndex(
          int index, Function(UserCartItemsStruct) updateFn) =>
      cartItems[index] = updateFn(cartItems[index]);

  int? count;

  List<DeliveryInfoStruct> orderDeliveryInfoList = [];
  void addToOrderDeliveryInfoList(DeliveryInfoStruct item) =>
      orderDeliveryInfoList.add(item);
  void removeFromOrderDeliveryInfoList(DeliveryInfoStruct item) =>
      orderDeliveryInfoList.remove(item);
  void removeAtIndexFromOrderDeliveryInfoList(int index) =>
      orderDeliveryInfoList.removeAt(index);
  void insertAtIndexInOrderDeliveryInfoList(
          int index, DeliveryInfoStruct item) =>
      orderDeliveryInfoList.insert(index, item);
  void updateOrderDeliveryInfoListAtIndex(
          int index, Function(DeliveryInfoStruct) updateFn) =>
      orderDeliveryInfoList[index] = updateFn(orderDeliveryInfoList[index]);

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for SC-Checkbox widget.
  Map<UserCartItemsStruct, bool> sCCheckboxValueMap = {};
  List<UserCartItemsStruct> get sCCheckboxCheckedItems =>
      sCCheckboxValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Cancel widget.
  SettingsRecord? settingShippingCancelDoc;
  // Stores action output result for [Backend Call - API (Get access token)] action in Cancel widget.
  ApiCallResponse? getAccessKeyShippingCan;
  // Stores action output result for [Firestore Query - Query a collection] action in Cancel widget.
  SettingsRecord? settingsupdatedCanShipping;
  // Stores action output result for [Backend Call - API (Cancel Delivery)] action in Cancel widget.
  ApiCallResponse? apiResultShippingCancel;
  // Stores action output result for [Firestore Query - Query a collection] action in Cancel widget.
  SettingsRecord? settingPickupCancelDoc;
  // Stores action output result for [Backend Call - API (Get access token)] action in Cancel widget.
  ApiCallResponse? getAccessKeyCanPickup;
  // Stores action output result for [Firestore Query - Query a collection] action in Cancel widget.
  SettingsRecord? settingsupdatedCanPickup;
  // Stores action output result for [Backend Call - API (Cancel Delivery)] action in Cancel widget.
  ApiCallResponse? apiResultPickupCancel;
  // State field(s) for LeaveComment widget.
  FocusNode? leaveCommentFocusNode;
  TextEditingController? leaveCommentTextController;
  String? Function(BuildContext, String?)? leaveCommentTextControllerValidator;
  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    notificatioAlertModel.dispose();
    leaveCommentFocusNode?.dispose();
    leaveCommentTextController?.dispose();

    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
