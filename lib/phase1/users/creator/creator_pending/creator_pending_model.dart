import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'creator_pending_widget.dart' show CreatorPendingWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CreatorPendingModel extends FlutterFlowModel<CreatorPendingWidget> {
  ///  Local state fields for this page.

  String permissionKey = 'creator';

  String permissionKeyEdit = 'creator_edit';

  String permissionKeyDelete = 'creator_delete';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SalesHistoryRecord? salesDoc;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    expandableExpandableController.dispose();
    azyaaResponsiveModel.dispose();
  }
}
