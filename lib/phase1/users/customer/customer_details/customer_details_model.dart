import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'customer_details_widget.dart' show CustomerDetailsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomerDetailsModel extends FlutterFlowModel<CustomerDetailsWidget> {
  ///  Local state fields for this page.

  String permissionKey = 'customer_edit';

  List<String> userIds = [
    '7iXYj2mJM0SeQCft75l0a467WEC2',
    'nlvynSeJfuWdTYfpOVNDGqzZT1K2'
  ];
  void addToUserIds(String item) => userIds.add(item);
  void removeFromUserIds(String item) => userIds.remove(item);
  void removeAtIndexFromUserIds(int index) => userIds.removeAt(index);
  void insertAtIndexInUserIds(int index, String item) =>
      userIds.insert(index, item);
  void updateUserIdsAtIndex(int index, Function(String) updateFn) =>
      userIds[index] = updateFn(userIds[index]);

  int? count;

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Stores action output result for [Cloud Function - sendPushNotificationToUser] action in Button widget.
  SendPushNotificationToUserCloudFunctionCallResponse? cloudFunction9dy;
  // Stores action output result for [Cloud Function - sendPushNotificationToUser] action in Button widget.
  SendPushNotificationToUserCloudFunctionCallResponse? multipleUsers;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for PersonalInfo widget.
  late ExpandableController personalInfoExpandableController;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<OrdersRecord>();
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
    personalInfoExpandableController.dispose();
    expandableExpandableController.dispose();
    paginatedDataTableController.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
