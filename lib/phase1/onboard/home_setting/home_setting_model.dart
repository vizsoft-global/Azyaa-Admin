import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'home_setting_widget.dart' show HomeSettingWidget;
import 'package:flutter/material.dart';

class HomeSettingModel extends FlutterFlowModel<HomeSettingWidget> {
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
  // State field(s) for ProductType widget.
  String? productTypeValue1;
  FormFieldController<String>? productTypeValueController1;
  // State field(s) for SearchSwitchStatus widget.
  bool? searchSwitchStatusValue;
  // State field(s) for BarSwitchStatus widget.
  bool? barSwitchStatusValue;
  // State field(s) for ProductType widget.
  String? productTypeValue2;
  FormFieldController<String>? productTypeValueController2;
  // State field(s) for categorySwitchStatus widget.
  bool? categorySwitchStatusValue;
  // State field(s) for ProductType widget.
  String? productTypeValue3;
  FormFieldController<String>? productTypeValueController3;
  // State field(s) for BannerSwitchStatus widget.
  bool? bannerSwitchStatusValue1;
  // State field(s) for BannerSwitchStatus widget.
  bool? bannerSwitchStatusValue2;
  // State field(s) for ProductType widget.
  String? productTypeValue4;
  FormFieldController<String>? productTypeValueController4;
  // State field(s) for RecentSwitchStatus widget.
  bool? recentSwitchStatusValue;
  // State field(s) for RecommendedSwitchStatus widget.
  bool? recommendedSwitchStatusValue;
  // State field(s) for NewSwitchStatus widget.
  bool? newSwitchStatusValue;
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
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
