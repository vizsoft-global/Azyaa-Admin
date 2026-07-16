import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'return_orders_widget.dart' show ReturnOrdersWidget;
import 'package:flutter/material.dart';

class ReturnOrdersModel extends FlutterFlowModel<ReturnOrdersWidget> {
  ///  Local state fields for this page.

  String choice = 'Pending';

  String permissionKey = 'return';

  List<String> adminChoicechips = ['Pending', 'Accepted', 'Rejected'];
  void addToAdminChoicechips(String item) => adminChoicechips.add(item);
  void removeFromAdminChoicechips(String item) => adminChoicechips.remove(item);
  void removeAtIndexFromAdminChoicechips(int index) =>
      adminChoicechips.removeAt(index);
  void insertAtIndexInAdminChoicechips(int index, String item) =>
      adminChoicechips.insert(index, item);
  void updateAdminChoicechipsAtIndex(int index, Function(String) updateFn) =>
      adminChoicechips[index] = updateFn(adminChoicechips[index]);

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for serach widget.
  FocusNode? serachFocusNode;
  TextEditingController? serachTextController;
  String? Function(BuildContext, String?)? serachTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ReturnRequestsRecord>();
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
    serachFocusNode?.dispose();
    serachTextController?.dispose();

    paginatedDataTableController.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
