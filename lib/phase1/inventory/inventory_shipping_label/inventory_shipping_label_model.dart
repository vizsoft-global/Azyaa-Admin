import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'inventory_shipping_label_widget.dart' show InventoryShippingLabelWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class InventoryShippingLabelModel
    extends FlutterFlowModel<InventoryShippingLabelWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in InventoryShippingLabel widget.
  List<BrandsRecord>? brandsDocs;
  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for unit_hieght widget.
  String? unitHieghtValue;
  FormFieldController<String>? unitHieghtValueController;
  // State field(s) for package widget.
  FocusNode? packageFocusNode;
  TextEditingController? packageTextController;
  String? Function(BuildContext, String?)? packageTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResult;
  // Stores action output result for [Backend Call - API (Get access token)] action in Button widget.
  ApiCallResponse? getAccessKeyInventory;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SettingsRecord? settingsDocInventory;
  // Stores action output result for [Backend Call - API (Create Delivery)] action in Button widget.
  ApiCallResponse? apiResultrestockCreate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeliveryRecord? deliveryRestockResult;
  // Stores action output result for [Backend Call - API (Create Delivery)] action in Button widget.
  ApiCallResponse? apiResultenquiryCreate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeliveryRecord? deliveryEnquiryResult;
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
    notificatioAlertModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    expandableExpandableController.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    packageFocusNode?.dispose();
    packageTextController?.dispose();

    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
