import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'product_settings_widget.dart' show ProductSettingsWidget;
import 'package:flutter/material.dart';

class ProductSettingsModel extends FlutterFlowModel<ProductSettingsWidget> {
  ///  Local state fields for this page.

  String customerFilters = 'All Customers';

  String searchStatus = 'Hide';

  String permissionKey = 'role_edit';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for EstimateShippingDays widget.
  bool? estimateShippingDaysValue;
  // State field(s) for ShortDescription widget.
  bool? shortDescriptionValue;
  // State field(s) for Description widget.
  bool? descriptionValue;
  // State field(s) for SKU widget.
  bool? skuValue;
  // State field(s) for EstimateShippingNoDaysIfOrdered widget.
  bool? estimateShippingNoDaysIfOrderedValue;
  // State field(s) for ProductPrice widget.
  bool? productPriceValue;
  // State field(s) for CompareatPriceOptional widget.
  bool? compareatPriceOptionalValue;
  // State field(s) for Weightgm widget.
  bool? weightgmValue;
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
