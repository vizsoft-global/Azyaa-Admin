import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'filterorders_widget.dart' show FilterordersWidget;
import 'package:flutter/material.dart';

class FilterordersModel extends FlutterFlowModel<FilterordersWidget> {
  ///  Local state fields for this page.

  String choice = 'All';

  String permissionKey = 'order';

  List<String> adminChoicechips = [
    'All',
    'Paid',
    'Unpaid',
    'Assign Delivery Partner',
    'Pickup request '
  ];
  void addToAdminChoicechips(String item) => adminChoicechips.add(item);
  void removeFromAdminChoicechips(String item) => adminChoicechips.remove(item);
  void removeAtIndexFromAdminChoicechips(int index) =>
      adminChoicechips.removeAt(index);
  void insertAtIndexInAdminChoicechips(int index, String item) =>
      adminChoicechips.insert(index, item);
  void updateAdminChoicechipsAtIndex(int index, Function(String) updateFn) =>
      adminChoicechips[index] = updateFn(adminChoicechips[index]);

  List<String> designerCChoicechips = ['All', 'Paid', 'Unpaid'];
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
    'تعيين شريك التسليم',
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

  List<String> designerChoicechipsAR = ['الجميع', 'مدفوع', 'غير مدفوعة الأجر'];
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

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for serach widget.
  FocusNode? serachFocusNode;
  TextEditingController? serachTextController;
  String? Function(BuildContext, String?)? serachTextControllerValidator;
  // Algolia Search Results from action on serach
  List<OrdersRecord>? algoliaSearchResults = [];
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
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
    serachFocusNode?.dispose();
    serachTextController?.dispose();

    notificatioAlertModel.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
