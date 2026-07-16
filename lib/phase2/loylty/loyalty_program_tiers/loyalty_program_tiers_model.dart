import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'loyalty_program_tiers_widget.dart' show LoyaltyProgramTiersWidget;
import 'package:flutter/material.dart';

class LoyaltyProgramTiersModel
    extends FlutterFlowModel<LoyaltyProgramTiersWidget> {
  ///  Local state fields for this page.

  String? paymentName;

  List<SettingsPaymentInfoStruct> allPaymentInfo = [];
  void addToAllPaymentInfo(SettingsPaymentInfoStruct item) =>
      allPaymentInfo.add(item);
  void removeFromAllPaymentInfo(SettingsPaymentInfoStruct item) =>
      allPaymentInfo.remove(item);
  void removeAtIndexFromAllPaymentInfo(int index) =>
      allPaymentInfo.removeAt(index);
  void insertAtIndexInAllPaymentInfo(
          int index, SettingsPaymentInfoStruct item) =>
      allPaymentInfo.insert(index, item);
  void updateAllPaymentInfoAtIndex(
          int index, Function(SettingsPaymentInfoStruct) updateFn) =>
      allPaymentInfo[index] = updateFn(allPaymentInfo[index]);

  int? count;

  String permissionKey = 'settings';

  String permissionKeyAppSecert = 'settings_app_secret_key';

  String permissionKeyAppUpdater = 'settings_app_updater';

  String permissionKeyCatalog = 'settings_catalog_mode';

  String permissionKeyinApp = 'settings_inapp_purchase';

  String permissionKe = 'settings_category_status';

  String permissionKeyCompany = 'settings_company_settings';

  String permissionKeyPayment = 'settings_payment';

  String permissionKeySociallogin = 'settings_social_login';

  String permissionKeyappmenu = 'settings_userapp_settings';

  String permissionKeyWaiter = 'settings_userapp_waiter';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode1;
  TextEditingController? couponTextController1;
  String? Function(BuildContext, String?)? couponTextController1Validator;
  // State field(s) for EnterValue widget.
  String? enterValueValue1;
  FormFieldController<String>? enterValueValueController1;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode2;
  TextEditingController? couponTextController2;
  String? Function(BuildContext, String?)? couponTextController2Validator;
  // State field(s) for EnterValue widget.
  String? enterValueValue2;
  FormFieldController<String>? enterValueValueController2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode3;
  TextEditingController? couponTextController3;
  String? Function(BuildContext, String?)? couponTextController3Validator;
  // State field(s) for EnterValue widget.
  String? enterValueValue3;
  FormFieldController<String>? enterValueValueController3;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode4;
  TextEditingController? couponTextController4;
  String? Function(BuildContext, String?)? couponTextController4Validator;
  // State field(s) for EnterValue widget.
  String? enterValueValue4;
  FormFieldController<String>? enterValueValueController4;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode5;
  TextEditingController? couponTextController5;
  String? Function(BuildContext, String?)? couponTextController5Validator;
  // State field(s) for EnterValue widget.
  String? enterValueValue5;
  FormFieldController<String>? enterValueValueController5;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode6;
  TextEditingController? couponTextController6;
  String? Function(BuildContext, String?)? couponTextController6Validator;
  // State field(s) for EnterValue widget.
  String? enterValueValue6;
  FormFieldController<String>? enterValueValueController6;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for EnterValue widget.
  String? enterValueValue7;
  FormFieldController<String>? enterValueValueController7;
  // State field(s) for EnterValue widget.
  String? enterValueValue8;
  FormFieldController<String>? enterValueValueController8;
  // State field(s) for InputField widget.
  FocusNode? inputFieldFocusNode1;
  TextEditingController? inputFieldTextController1;
  String? Function(BuildContext, String?)? inputFieldTextController1Validator;
  // State field(s) for InputField widget.
  FocusNode? inputFieldFocusNode2;
  TextEditingController? inputFieldTextController2;
  String? Function(BuildContext, String?)? inputFieldTextController2Validator;
  // State field(s) for featureCheckbox widget.
  bool? featureCheckboxValue;
  // State field(s) for popularCheckbox widget.
  bool? popularCheckboxValue;
  // State field(s) for recommendedCheckbox widget.
  bool? recommendedCheckboxValue;
  // State field(s) for ProductStatus widget.
  String? productStatusValue1;
  FormFieldController<String>? productStatusValueController1;
  // State field(s) for InputField widget.
  FocusNode? inputFieldFocusNode3;
  TextEditingController? inputFieldTextController3;
  String? Function(BuildContext, String?)? inputFieldTextController3Validator;
  // State field(s) for InputField widget.
  FocusNode? inputFieldFocusNode4;
  TextEditingController? inputFieldTextController4;
  String? Function(BuildContext, String?)? inputFieldTextController4Validator;
  // State field(s) for InputField widget.
  FocusNode? inputFieldFocusNode5;
  TextEditingController? inputFieldTextController5;
  String? Function(BuildContext, String?)? inputFieldTextController5Validator;
  // State field(s) for ProductStatus widget.
  String? productStatusValue2;
  FormFieldController<String>? productStatusValueController2;
  // State field(s) for ProductStatus widget.
  String? productStatusValue3;
  FormFieldController<String>? productStatusValueController3;
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
    couponFocusNode1?.dispose();
    couponTextController1?.dispose();

    couponFocusNode2?.dispose();
    couponTextController2?.dispose();

    couponFocusNode3?.dispose();
    couponTextController3?.dispose();

    couponFocusNode4?.dispose();
    couponTextController4?.dispose();

    couponFocusNode5?.dispose();
    couponTextController5?.dispose();

    couponFocusNode6?.dispose();
    couponTextController6?.dispose();

    inputFieldFocusNode1?.dispose();
    inputFieldTextController1?.dispose();

    inputFieldFocusNode2?.dispose();
    inputFieldTextController2?.dispose();

    inputFieldFocusNode3?.dispose();
    inputFieldTextController3?.dispose();

    inputFieldFocusNode4?.dispose();
    inputFieldTextController4?.dispose();

    inputFieldFocusNode5?.dispose();
    inputFieldTextController5?.dispose();

    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
