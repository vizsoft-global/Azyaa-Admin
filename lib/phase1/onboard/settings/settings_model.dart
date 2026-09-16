import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
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

  int? orderCount;

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for ProductType widget.
  String? productTypeValue;
  FormFieldController<String>? productTypeValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for title widget.
  FocusNode? titleFocusNode1;
  TextEditingController? titleTextController1;
  String? Function(BuildContext, String?)? titleTextController1Validator;
  // State field(s) for sku widget.
  FocusNode? skuFocusNode1;
  TextEditingController? skuTextController1;
  String? Function(BuildContext, String?)? skuTextController1Validator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode2;
  TextEditingController? titleTextController2;
  String? Function(BuildContext, String?)? titleTextController2Validator;
  // State field(s) for sku widget.
  FocusNode? skuFocusNode2;
  TextEditingController? skuTextController2;
  String? Function(BuildContext, String?)? skuTextController2Validator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode3;
  TextEditingController? titleTextController3;
  String? Function(BuildContext, String?)? titleTextController3Validator;
  // State field(s) for form-url widget.
  FocusNode? formUrlFocusNode;
  TextEditingController? formUrlTextController;
  String? Function(BuildContext, String?)? formUrlTextControllerValidator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode4;
  TextEditingController? titleTextController4;
  String? Function(BuildContext, String?)? titleTextController4Validator;
  // State field(s) for sku widget.
  FocusNode? skuFocusNode3;
  TextEditingController? skuTextController3;
  String? Function(BuildContext, String?)? skuTextController3Validator;
  // State field(s) for privacy widget.
  FocusNode? privacyFocusNode;
  TextEditingController? privacyTextController;
  String? Function(BuildContext, String?)? privacyTextControllerValidator;
  // State field(s) for terms widget.
  FocusNode? termsFocusNode;
  TextEditingController? termsTextController;
  String? Function(BuildContext, String?)? termsTextControllerValidator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode5;
  TextEditingController? titleTextController5;
  String? Function(BuildContext, String?)? titleTextController5Validator;
  // State field(s) for disclaimer widget.
  FocusNode? disclaimerFocusNode;
  TextEditingController? disclaimerTextController;
  String? Function(BuildContext, String?)? disclaimerTextControllerValidator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode6;
  TextEditingController? titleTextController6;
  String? Function(BuildContext, String?)? titleTextController6Validator;
  // State field(s) for sku widget.
  FocusNode? skuFocusNode4;
  TextEditingController? skuTextController4;
  String? Function(BuildContext, String?)? skuTextController4Validator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode7;
  TextEditingController? titleTextController7;
  String? Function(BuildContext, String?)? titleTextController7Validator;
  // State field(s) for sku widget.
  FocusNode? skuFocusNode5;
  TextEditingController? skuTextController5;
  String? Function(BuildContext, String?)? skuTextController5Validator;
  // State field(s) for whatsapp widget.
  FocusNode? whatsappFocusNode1;
  TextEditingController? whatsappTextController1;
  String? Function(BuildContext, String?)? whatsappTextController1Validator;
  // State field(s) for whatsapp widget.
  FocusNode? whatsappFocusNode2;
  TextEditingController? whatsappTextController2;
  String? Function(BuildContext, String?)? whatsappTextController2Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contact name is required';
    }
    return null;
  }

  // State field(s) for title widget.
  FocusNode? titleFocusNode8;
  TextEditingController? titleTextController8;
  String? Function(BuildContext, String?)? titleTextController8Validator;
  String? _titleTextController8Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contact phone is required';
    }
    if (!RegExp(
            '^(?:\\+?(?:965|966|971|968|974|973)|0)?(5\\d{8}|[569]\\d{7}|9[1-9]\\d{6}|3\\d{7}|[3-7]\\d{7}|5[024568]\\d{7})\$')
        .hasMatch(val)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Street is required';
    }
    return null;
  }

  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'City is required';
    }
    return null;
  }

  // State field(s) for Region widget.
  FocusNode? regionFocusNode;
  TextEditingController? regionTextController;
  String? Function(BuildContext, String?)? regionTextControllerValidator;
  // State field(s) for Country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  // Stores action output result for [Backend Call - API (CountryISO)] action in Country widget.
  ApiCallResponse? apiResultCountryISO;
  // State field(s) for Building widget.
  FocusNode? buildingFocusNode;
  TextEditingController? buildingTextController;
  String? Function(BuildContext, String?)? buildingTextControllerValidator;
  // State field(s) for Block widget.
  FocusNode? blockFocusNode;
  TextEditingController? blockTextController;
  String? Function(BuildContext, String?)? blockTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for ProductionKey widget.
  FocusNode? productionKeyFocusNode;
  TextEditingController? productionKeyTextController;
  String? Function(BuildContext, String?)? productionKeyTextControllerValidator;
  // State field(s) for TestKey widget.
  FocusNode? testKeyFocusNode1;
  TextEditingController? testKeyTextController1;
  String? Function(BuildContext, String?)? testKeyTextController1Validator;
  // State field(s) for ShippngChargesinKuwait widget.
  FocusNode? shippngChargesinKuwaitFocusNode1;
  TextEditingController? shippngChargesinKuwaitTextController1;
  String? Function(BuildContext, String?)?
      shippngChargesinKuwaitTextController1Validator;
  // State field(s) for TestKey widget.
  FocusNode? testKeyFocusNode2;
  TextEditingController? testKeyTextController2;
  String? Function(BuildContext, String?)? testKeyTextController2Validator;
  // State field(s) for ShippngChargesinKuwait widget.
  FocusNode? shippngChargesinKuwaitFocusNode2;
  TextEditingController? shippngChargesinKuwaitTextController2;
  String? Function(BuildContext, String?)?
      shippngChargesinKuwaitTextController2Validator;
  // State field(s) for TestKey widget.
  FocusNode? testKeyFocusNode3;
  TextEditingController? testKeyTextController3;
  String? Function(BuildContext, String?)? testKeyTextController3Validator;
  // State field(s) for ShippngChargesinKuwait widget.
  FocusNode? shippngChargesinKuwaitFocusNode3;
  TextEditingController? shippngChargesinKuwaitTextController3;
  String? Function(BuildContext, String?)?
      shippngChargesinKuwaitTextController3Validator;
  // State field(s) for ShippngChargesinGCC1 widget.
  FocusNode? shippngChargesinGCC1FocusNode;
  TextEditingController? shippngChargesinGCC1TextController;
  String? Function(BuildContext, String?)?
      shippngChargesinGCC1TextControllerValidator;
  // State field(s) for ShippngChargesinGCC2 widget.
  FocusNode? shippngChargesinGCC2FocusNode;
  TextEditingController? shippngChargesinGCC2TextController;
  String? Function(BuildContext, String?)?
      shippngChargesinGCC2TextControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for title widget.
  FocusNode? titleFocusNode9;
  TextEditingController? titleTextController9;
  String? Function(BuildContext, String?)? titleTextController9Validator;
  // State field(s) for sku widget.
  FocusNode? skuFocusNode6;
  TextEditingController? skuTextController6;
  String? Function(BuildContext, String?)? skuTextController6Validator;
  // State field(s) for loyaltySwitch widget.
  bool? loyaltySwitchValue;
  // State field(s) for loyaltyRupee widget.
  FocusNode? loyaltyRupeeFocusNode;
  TextEditingController? loyaltyRupeeTextController;
  String? Function(BuildContext, String?)? loyaltyRupeeTextControllerValidator;
  // State field(s) for loyaltyPointNor widget.
  FocusNode? loyaltyPointNorFocusNode;
  TextEditingController? loyaltyPointNorTextController;
  String? Function(BuildContext, String?)?
      loyaltyPointNorTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OrdersRecord>? orderCaptureResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SettingsRecord? settingsResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResult;
  // State field(s) for SwitchWaiter widget.
  bool? switchWaiterValue;
  // State field(s) for SwitchSecreat widget.
  bool? switchSecreatValue;
  // State field(s) for promotionDays widget.
  FocusNode? promotionDaysFocusNode;
  TextEditingController? promotionDaysTextController;
  String? Function(BuildContext, String?)? promotionDaysTextControllerValidator;
  // State field(s) for OTP widget.
  String? otpValue;
  FormFieldController<String>? otpValueController;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
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
    nameTextControllerValidator = _nameTextControllerValidator;
    titleTextController8Validator = _titleTextController8Validator;
    addressTextControllerValidator = _addressTextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    titleFocusNode1?.dispose();
    titleTextController1?.dispose();

    skuFocusNode1?.dispose();
    skuTextController1?.dispose();

    titleFocusNode2?.dispose();
    titleTextController2?.dispose();

    skuFocusNode2?.dispose();
    skuTextController2?.dispose();

    titleFocusNode3?.dispose();
    titleTextController3?.dispose();

    formUrlFocusNode?.dispose();
    formUrlTextController?.dispose();

    titleFocusNode4?.dispose();
    titleTextController4?.dispose();

    skuFocusNode3?.dispose();
    skuTextController3?.dispose();

    privacyFocusNode?.dispose();
    privacyTextController?.dispose();

    termsFocusNode?.dispose();
    termsTextController?.dispose();

    titleFocusNode5?.dispose();
    titleTextController5?.dispose();

    disclaimerFocusNode?.dispose();
    disclaimerTextController?.dispose();

    titleFocusNode6?.dispose();
    titleTextController6?.dispose();

    skuFocusNode4?.dispose();
    skuTextController4?.dispose();

    titleFocusNode7?.dispose();
    titleTextController7?.dispose();

    skuFocusNode5?.dispose();
    skuTextController5?.dispose();

    whatsappFocusNode1?.dispose();
    whatsappTextController1?.dispose();

    whatsappFocusNode2?.dispose();
    whatsappTextController2?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    titleFocusNode8?.dispose();
    titleTextController8?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    regionFocusNode?.dispose();
    regionTextController?.dispose();

    buildingFocusNode?.dispose();
    buildingTextController?.dispose();

    blockFocusNode?.dispose();
    blockTextController?.dispose();

    productionKeyFocusNode?.dispose();
    productionKeyTextController?.dispose();

    testKeyFocusNode1?.dispose();
    testKeyTextController1?.dispose();

    shippngChargesinKuwaitFocusNode1?.dispose();
    shippngChargesinKuwaitTextController1?.dispose();

    testKeyFocusNode2?.dispose();
    testKeyTextController2?.dispose();

    shippngChargesinKuwaitFocusNode2?.dispose();
    shippngChargesinKuwaitTextController2?.dispose();

    testKeyFocusNode3?.dispose();
    testKeyTextController3?.dispose();

    shippngChargesinKuwaitFocusNode3?.dispose();
    shippngChargesinKuwaitTextController3?.dispose();

    shippngChargesinGCC1FocusNode?.dispose();
    shippngChargesinGCC1TextController?.dispose();

    shippngChargesinGCC2FocusNode?.dispose();
    shippngChargesinGCC2TextController?.dispose();

    titleFocusNode9?.dispose();
    titleTextController9?.dispose();

    skuFocusNode6?.dispose();
    skuTextController6?.dispose();

    loyaltyRupeeFocusNode?.dispose();
    loyaltyRupeeTextController?.dispose();

    loyaltyPointNorFocusNode?.dispose();
    loyaltyPointNorTextController?.dispose();

    promotionDaysFocusNode?.dispose();
    promotionDaysTextController?.dispose();

    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
