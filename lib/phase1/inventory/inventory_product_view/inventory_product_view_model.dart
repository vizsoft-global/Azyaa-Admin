import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import 'inventory_product_view_widget.dart' show InventoryProductViewWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class InventoryProductViewModel
    extends FlutterFlowModel<InventoryProductViewWidget> {
  ///  Local state fields for this page.

  String permissionKey = 'creator';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Pending widget.
  final pendingController1 =
      FlutterFlowDataTableController<InventorymovementlogRecord>();
  // State field(s) for Pending widget.
  final pendingController2 =
      FlutterFlowDataTableController<InventorymovementlogRecord>();
  // State field(s) for Pending widget.
  final pendingController3 = FlutterFlowDataTableController<String>();
  // Model for empty component.
  late EmptyModel emptyModel;
  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    emptyModel = createModel(context, () => EmptyModel());
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    pendingController1.dispose();
    pendingController2.dispose();
    pendingController3.dispose();
    emptyModel.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
