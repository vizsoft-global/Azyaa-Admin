import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import '/index.dart';
import 'designer_pending_widget.dart' show DesignerPendingWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DesignerPendingModel extends FlutterFlowModel<DesignerPendingWidget> {
  ///  Local state fields for this page.

  String permissionKey = 'designer';

  String permissionKeyEdit = 'designer_edit';

  String permissionKeyDelete = 'designer_delete';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Approve widget.
  IdMapRecord? idmapResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in Approve widget.
  IdMapRecord? idmapResult;
  // Stores action output result for [Backend Call - Create Document] action in Approve widget.
  SalesHistoryRecord? salesDoc;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

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
    expandableExpandableController.dispose();
    emptyModel.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
