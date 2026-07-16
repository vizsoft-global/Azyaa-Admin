import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'creator_rejected_widget.dart' show CreatorRejectedWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CreatorRejectedModel extends FlutterFlowModel<CreatorRejectedWidget> {
  ///  Local state fields for this page.

  String permissionKeyEdit = 'creator_edit';

  String permissionKeyDelete = 'creator_delete';

  String permissionKey = 'creator';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

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
    expandableExpandableController.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
