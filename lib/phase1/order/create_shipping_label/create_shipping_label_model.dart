import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'create_shipping_label_widget.dart' show CreateShippingLabelWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CreateShippingLabelModel
    extends FlutterFlowModel<CreateShippingLabelWidget> {
  ///  Local state fields for this page.

  int? count;

  List<String> productIds = [];
  void addToProductIds(String item) => productIds.add(item);
  void removeFromProductIds(String item) => productIds.remove(item);
  void removeAtIndexFromProductIds(int index) => productIds.removeAt(index);
  void insertAtIndexInProductIds(int index, String item) =>
      productIds.insert(index, item);
  void updateProductIdsAtIndex(int index, Function(String) updateFn) =>
      productIds[index] = updateFn(productIds[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for totalWeight widget.
  FocusNode? totalWeightFocusNode;
  TextEditingController? totalWeightTextController;
  String? Function(BuildContext, String?)? totalWeightTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for PackageCount widget.
  FocusNode? packageCountFocusNode;
  TextEditingController? packageCountTextController;
  String? Function(BuildContext, String?)? packageCountTextControllerValidator;
  String? _packageCountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '07ygomi4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResult;
  // Stores action output result for [Backend Call - API (Get access token)] action in Button widget.
  ApiCallResponse? getAccessKey;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SettingsRecord? settingsDoc;
  // Stores action output result for [Backend Call - API (Create Delivery)] action in Button widget.
  ApiCallResponse? apiResultShippingCreate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeliveryRecord? deliveryDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResultpickup;
  // Stores action output result for [Backend Call - API (Get access token)] action in Button widget.
  ApiCallResponse? getAccessKeyPickup;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SettingsRecord? settingsDocPickup;
  // Stores action output result for [Backend Call - API (Create Delivery)] action in Button widget.
  ApiCallResponse? apiResultShippingCreatepickup;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeliveryRecord? deliveryDocPickup;
  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    packageCountTextControllerValidator = _packageCountTextControllerValidator;
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    expandableExpandableController1.dispose();
    totalWeightFocusNode?.dispose();
    totalWeightTextController?.dispose();

    packageCountFocusNode?.dispose();
    packageCountTextController?.dispose();

    expandableExpandableController2.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
