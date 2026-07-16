import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'creator_promotions_widget.dart' show CreatorPromotionsWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CreatorPromotionsModel extends FlutterFlowModel<CreatorPromotionsWidget> {
  ///  Local state fields for this page.

  String customerFilters = 'All Customers';

  String searchStatus = 'Hide';

  String permissionKey = 'creator';

  String permissionKeyEdit = 'creator_edit';

  List<String> mainChoicechips = ['Custom Promotions', 'Auto Approved'];
  void addToMainChoicechips(String item) => mainChoicechips.add(item);
  void removeFromMainChoicechips(String item) => mainChoicechips.remove(item);
  void removeAtIndexFromMainChoicechips(int index) =>
      mainChoicechips.removeAt(index);
  void insertAtIndexInMainChoicechips(int index, String item) =>
      mainChoicechips.insert(index, item);
  void updateMainChoicechipsAtIndex(int index, Function(String) updateFn) =>
      mainChoicechips[index] = updateFn(mainChoicechips[index]);

  String mainChoice = 'Custom Promotions';

  List<String> autoChoicechips = ['Active', 'Archived'];
  void addToAutoChoicechips(String item) => autoChoicechips.add(item);
  void removeFromAutoChoicechips(String item) => autoChoicechips.remove(item);
  void removeAtIndexFromAutoChoicechips(int index) =>
      autoChoicechips.removeAt(index);
  void insertAtIndexInAutoChoicechips(int index, String item) =>
      autoChoicechips.insert(index, item);
  void updateAutoChoicechipsAtIndex(int index, Function(String) updateFn) =>
      autoChoicechips[index] = updateFn(autoChoicechips[index]);

  List<String> customChoicechips = ['Pending', 'Active', 'Archived'];
  void addToCustomChoicechips(String item) => customChoicechips.add(item);
  void removeFromCustomChoicechips(String item) =>
      customChoicechips.remove(item);
  void removeAtIndexFromCustomChoicechips(int index) =>
      customChoicechips.removeAt(index);
  void insertAtIndexInCustomChoicechips(int index, String item) =>
      customChoicechips.insert(index, item);
  void updateCustomChoicechipsAtIndex(int index, Function(String) updateFn) =>
      customChoicechips[index] = updateFn(customChoicechips[index]);

  String choice = 'Pending';

  List<CreatorPromotionsStruct> promotionsList = [];
  void addToPromotionsList(CreatorPromotionsStruct item) =>
      promotionsList.add(item);
  void removeFromPromotionsList(CreatorPromotionsStruct item) =>
      promotionsList.remove(item);
  void removeAtIndexFromPromotionsList(int index) =>
      promotionsList.removeAt(index);
  void insertAtIndexInPromotionsList(int index, CreatorPromotionsStruct item) =>
      promotionsList.insert(index, item);
  void updatePromotionsListAtIndex(
          int index, Function(CreatorPromotionsStruct) updateFn) =>
      promotionsList[index] = updateFn(promotionsList[index]);

  int? count;

  List<UsersRecord> promotedUserList = [];
  void addToPromotedUserList(UsersRecord item) => promotedUserList.add(item);
  void removeFromPromotedUserList(UsersRecord item) =>
      promotedUserList.remove(item);
  void removeAtIndexFromPromotedUserList(int index) =>
      promotedUserList.removeAt(index);
  void insertAtIndexInPromotedUserList(int index, UsersRecord item) =>
      promotedUserList.insert(index, item);
  void updatePromotedUserListAtIndex(
          int index, Function(UsersRecord) updateFn) =>
      promotedUserList[index] = updateFn(promotedUserList[index]);

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
  // State field(s) for Auto-ChoiceChips widget.
  FormFieldController<List<String>>? autoChoiceChipsValueController;
  String? get autoChoiceChipsValue =>
      autoChoiceChipsValueController?.value?.firstOrNull;
  set autoChoiceChipsValue(String? val) =>
      autoChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<UserWaitlistRecord> simpleSearchResults1 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<CreatorPromotionsStruct>();
  // State field(s) for custom-ChoiceChips widget.
  FormFieldController<List<String>>? customChoiceChipsValueController;
  String? get customChoiceChipsValue =>
      customChoiceChipsValueController?.value?.firstOrNull;
  set customChoiceChipsValue(String? val) =>
      customChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<UserWaitlistRecord> simpleSearchResults2 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<CreatorPromotionsStruct>();
  // Stores action output result for [Backend Call - Read Document] action in confirm widget.
  UsersRecord? creatorResult;
  // Stores action output result for [Firestore Query - Query a collection] action in confirm widget.
  SettingsRecord? settingsResult;
  // Stores action output result for [Backend Call - Read Document] action in cancel widget.
  UsersRecord? creatorResultCopy;
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

    paginatedDataTableController1.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    paginatedDataTableController2.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
