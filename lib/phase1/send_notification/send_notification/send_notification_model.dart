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
import 'send_notification_widget.dart' show SendNotificationWidget;
import 'package:flutter/material.dart';

class SendNotificationModel extends FlutterFlowModel<SendNotificationWidget> {
  ///  Local state fields for this page.

  List<String> selectedUsers = [];
  void addToSelectedUsers(String item) => selectedUsers.add(item);
  void removeFromSelectedUsers(String item) => selectedUsers.remove(item);
  void removeAtIndexFromSelectedUsers(int index) =>
      selectedUsers.removeAt(index);
  void insertAtIndexInSelectedUsers(int index, String item) =>
      selectedUsers.insert(index, item);
  void updateSelectedUsersAtIndex(int index, Function(String) updateFn) =>
      selectedUsers[index] = updateFn(selectedUsers[index]);

  int? count;

  List<String> notsentUserID = [];
  void addToNotsentUserID(String item) => notsentUserID.add(item);
  void removeFromNotsentUserID(String item) => notsentUserID.remove(item);
  void removeAtIndexFromNotsentUserID(int index) =>
      notsentUserID.removeAt(index);
  void insertAtIndexInNotsentUserID(int index, String item) =>
      notsentUserID.insert(index, item);
  void updateNotsentUserIDAtIndex(int index, Function(String) updateFn) =>
      notsentUserID[index] = updateFn(notsentUserID[index]);

  String alluserList = 'show';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  // State field(s) for TextFieldsearch widget.
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<UsersRecord>();
  // State field(s) for Checkbox50 widget.
  bool? checkbox50Value1;
  // State field(s) for Checkboxall widget.
  Map<UsersRecord, bool> checkboxallValueMap = {};
  List<UsersRecord> get checkboxallCheckedItems => checkboxallValueMap.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<UsersRecord>();
  // State field(s) for Checkbox50 widget.
  bool? checkbox50Value2;
  // State field(s) for Checkboxfilter widget.
  Map<UsersRecord, bool> checkboxfilterValueMap = {};
  List<UsersRecord> get checkboxfilterCheckedItems =>
      checkboxfilterValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sk70ibjb' /* Notification Title is required */,
      );
    }

    return null;
  }

  // State field(s) for body widget.
  FocusNode? bodyFocusNode;
  TextEditingController? bodyTextController;
  String? Function(BuildContext, String?)? bodyTextControllerValidator;
  String? _bodyTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gfsgx2x8' /* Message is required */,
      );
    }

    return null;
  }

  // State field(s) for redirect widget.
  FocusNode? redirectFocusNode;
  TextEditingController? redirectTextController;
  String? Function(BuildContext, String?)? redirectTextControllerValidator;
  // State field(s) for page-parameters widget.
  FocusNode? pageParametersFocusNode;
  TextEditingController? pageParametersTextController;
  String? Function(BuildContext, String?)?
      pageParametersTextControllerValidator;
  // Stores action output result for [Cloud Function - sendPushNotificationToUser] action in Button widget.
  SendPushNotificationToUserCloudFunctionCallResponse? multipleUsers;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? notificationformValidation;
  // Stores action output result for [Cloud Function - sendPushNotificationToUsers] action in Button widget.
  SendPushNotificationToUsersCloudFunctionCallResponse? cloudFunction3ar;
  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    titleTextControllerValidator = _titleTextControllerValidator;
    bodyTextControllerValidator = _bodyTextControllerValidator;
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();

    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    bodyFocusNode?.dispose();
    bodyTextController?.dispose();

    redirectFocusNode?.dispose();
    redirectTextController?.dispose();

    pageParametersFocusNode?.dispose();
    pageParametersTextController?.dispose();

    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
