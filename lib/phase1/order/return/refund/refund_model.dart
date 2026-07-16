import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'refund_widget.dart' show RefundWidget;
import 'package:flutter/material.dart';

class RefundModel extends FlutterFlowModel<RefundWidget> {
  ///  Local state fields for this page.

  String customerFilters = 'All Customers';

  String searchStatus = 'Hide';

  String permissionKey = 'order';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for LeaveComment widget.
  FocusNode? leaveCommentFocusNode1;
  TextEditingController? leaveCommentTextController1;
  String? Function(BuildContext, String?)? leaveCommentTextController1Validator;
  // State field(s) for LeaveComment widget.
  FocusNode? leaveCommentFocusNode2;
  TextEditingController? leaveCommentTextController2;
  String? Function(BuildContext, String?)? leaveCommentTextController2Validator;
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
    leaveCommentFocusNode1?.dispose();
    leaveCommentTextController1?.dispose();

    leaveCommentFocusNode2?.dispose();
    leaveCommentTextController2?.dispose();

    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
