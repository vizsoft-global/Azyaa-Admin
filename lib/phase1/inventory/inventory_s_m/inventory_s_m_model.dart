import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'inventory_s_m_widget.dart' show InventorySMWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class InventorySMModel extends FlutterFlowModel<InventorySMWidget> {
  ///  Local state fields for this page.

  List<String> adminChoicechips = [
    'All',
    'Stock Managed by Designer',
    'Stock Managed by Azyaa',
    'Low Stock Alert'
  ];
  void addToAdminChoicechips(String item) => adminChoicechips.add(item);
  void removeFromAdminChoicechips(String item) => adminChoicechips.remove(item);
  void removeAtIndexFromAdminChoicechips(int index) =>
      adminChoicechips.removeAt(index);
  void insertAtIndexInAdminChoicechips(int index, String item) =>
      adminChoicechips.insert(index, item);
  void updateAdminChoicechipsAtIndex(int index, Function(String) updateFn) =>
      adminChoicechips[index] = updateFn(adminChoicechips[index]);

  List<String> designerChoicehips = [
    'All',
    'Stock Managed by Designer',
    'Low Stock Alert'
  ];
  void addToDesignerChoicehips(String item) => designerChoicehips.add(item);
  void removeFromDesignerChoicehips(String item) =>
      designerChoicehips.remove(item);
  void removeAtIndexFromDesignerChoicehips(int index) =>
      designerChoicehips.removeAt(index);
  void insertAtIndexInDesignerChoicehips(int index, String item) =>
      designerChoicehips.insert(index, item);
  void updateDesignerChoicehipsAtIndex(int index, Function(String) updateFn) =>
      designerChoicehips[index] = updateFn(designerChoicehips[index]);

  String styleName = 'List';

  String permissionKey = 'inventory';

  List<dynamic> itemList = [];
  void addToItemList(dynamic item) => itemList.add(item);
  void removeFromItemList(dynamic item) => itemList.remove(item);
  void removeAtIndexFromItemList(int index) => itemList.removeAt(index);
  void insertAtIndexInItemList(int index, dynamic item) =>
      itemList.insert(index, item);
  void updateItemListAtIndex(int index, Function(dynamic) updateFn) =>
      itemList[index] = updateFn(itemList[index]);

  InvitemListStruct? itemsList;
  void updateItemsListStruct(Function(InvitemListStruct) updateFn) {
    updateFn(itemsList ??= InvitemListStruct());
  }

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
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<InventorymovementlogRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<InventorymovementlogRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  LogisticsResponseRecord? logisticsResponseDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  LogisticsResponseRecord? logisticsResponseenquiryDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in R-Cancel widget.
  SettingsRecord? settingRCancelDoc;
  // Stores action output result for [Backend Call - API (Get access token)] action in R-Cancel widget.
  ApiCallResponse? getAccessKeyCanReq;
  // Stores action output result for [Firestore Query - Query a collection] action in R-Cancel widget.
  SettingsRecord? settingsupdatedCanReq;
  // Stores action output result for [Backend Call - API (Cancel Delivery)] action in R-Cancel widget.
  ApiCallResponse? apiResultRCancel;
  // Stores action output result for [Backend Call - Read Document] action in EnquiryB widget.
  ProductsRecord? productDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in E-Cancel widget.
  SettingsRecord? settingEnqCancelDoc;
  // Stores action output result for [Backend Call - API (Get access token)] action in E-Cancel widget.
  ApiCallResponse? getAccessKeyCanEnq;
  // Stores action output result for [Firestore Query - Query a collection] action in E-Cancel widget.
  SettingsRecord? settingsupdatedCanEnq;
  // Stores action output result for [Backend Call - API (Cancel Delivery)] action in E-Cancel widget.
  ApiCallResponse? apiResultEnqCancel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController3 =
      FlutterFlowDataTableController<InventorymovementlogRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController4 =
      FlutterFlowDataTableController<InventorymovementlogRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController5 =
      FlutterFlowDataTableController<InventorymovementlogRecord>();
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
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    paginatedDataTableController3.dispose();
    paginatedDataTableController4.dispose();
    paginatedDataTableController5.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
