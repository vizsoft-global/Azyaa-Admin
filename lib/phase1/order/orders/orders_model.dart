import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'orders_widget.dart' show OrdersWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class OrdersModel extends FlutterFlowModel<OrdersWidget> {
  ///  Local state fields for this page.

  String choice = 'All';

  String permissionKey = 'order';

  List<String> adminChoicechips = [
    'All',
    'Paid',
    'Unpaid',
    'Create Shipping',
    'Delivery Ongoing',
    'Delivered',
    'Pickup request'
  ];
  void addToAdminChoicechips(String item) => adminChoicechips.add(item);
  void removeFromAdminChoicechips(String item) => adminChoicechips.remove(item);
  void removeAtIndexFromAdminChoicechips(int index) =>
      adminChoicechips.removeAt(index);
  void insertAtIndexInAdminChoicechips(int index, String item) =>
      adminChoicechips.insert(index, item);
  void updateAdminChoicechipsAtIndex(int index, Function(String) updateFn) =>
      adminChoicechips[index] = updateFn(adminChoicechips[index]);

  List<String> designerCChoicechips = [
    'All',
    'Paid',
    'Tailoring',
    'Ready to Pickup',
    'Picked Up'
  ];
  void addToDesignerCChoicechips(String item) => designerCChoicechips.add(item);
  void removeFromDesignerCChoicechips(String item) =>
      designerCChoicechips.remove(item);
  void removeAtIndexFromDesignerCChoicechips(int index) =>
      designerCChoicechips.removeAt(index);
  void insertAtIndexInDesignerCChoicechips(int index, String item) =>
      designerCChoicechips.insert(index, item);
  void updateDesignerCChoicechipsAtIndex(
          int index, Function(String) updateFn) =>
      designerCChoicechips[index] = updateFn(designerCChoicechips[index]);

  List<String> adminChoicechipsAR = [
    'الجميع',
    'مدفوع',
    'غير مدفوعة الأجر',
    'إنشاء الشحن',
    'التسليم مستمر',
    'تم التوصيل',
    'طلب بيك اب'
  ];
  void addToAdminChoicechipsAR(String item) => adminChoicechipsAR.add(item);
  void removeFromAdminChoicechipsAR(String item) =>
      adminChoicechipsAR.remove(item);
  void removeAtIndexFromAdminChoicechipsAR(int index) =>
      adminChoicechipsAR.removeAt(index);
  void insertAtIndexInAdminChoicechipsAR(int index, String item) =>
      adminChoicechipsAR.insert(index, item);
  void updateAdminChoicechipsARAtIndex(int index, Function(String) updateFn) =>
      adminChoicechipsAR[index] = updateFn(adminChoicechipsAR[index]);

  List<String> designerChoicechipsAR = [
    'الجميع',
    'مدفوع',
    'قائد التنفيس',
    'جاهز للاستلام',
    'تام الاستلام'
  ];
  void addToDesignerChoicechipsAR(String item) =>
      designerChoicechipsAR.add(item);
  void removeFromDesignerChoicechipsAR(String item) =>
      designerChoicechipsAR.remove(item);
  void removeAtIndexFromDesignerChoicechipsAR(int index) =>
      designerChoicechipsAR.removeAt(index);
  void insertAtIndexInDesignerChoicechipsAR(int index, String item) =>
      designerChoicechipsAR.insert(index, item);
  void updateDesignerChoicechipsARAtIndex(
          int index, Function(String) updateFn) =>
      designerChoicechipsAR[index] = updateFn(designerChoicechipsAR[index]);

  bool searchStatus = false;

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;
  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for ChoiceChipsFilter widget.
  FormFieldController<List<String>>? choiceChipsFilterValueController;
  String? get choiceChipsFilterValue =>
      choiceChipsFilterValueController?.value?.firstOrNull;
  set choiceChipsFilterValue(String? val) =>
      choiceChipsFilterValueController?.value = val != null ? [val] : [];
  // State field(s) for serach widget.
  FocusNode? serachFocusNode;
  TextEditingController? serachTextController;
  String? Function(BuildContext, String?)? serachTextControllerValidator;
  // Algolia Search Results from action on serach
  List<OrdersRecord>? algoliaSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<OrdersRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<OrdersRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  LogisticsResponseRecord? logisticsResponseDoc;

  @override
  void initState(BuildContext context) {
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
  }

  @override
  void dispose() {
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    serachFocusNode?.dispose();
    serachTextController?.dispose();

    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
  }
}
