import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import '/phase2/ui/rating_bar/rating_bar_widget.dart';
import '/index.dart';
import 'designer_active_widget.dart' show DesignerActiveWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DesignerActiveModel extends FlutterFlowModel<DesignerActiveWidget> {
  ///  Local state fields for this page.

  String permissionKey = 'designer';

  String permissionKeyEdit = 'designer_edit';

  String permissionKeyDelete = 'designer_delete';

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
  // State field(s) for PersonalInformation widget.
  late ExpandableController personalInformationExpandableController;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Model for empty component.
  late EmptyModel emptyModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // Model for RatingBar component.
  late RatingBarModel ratingBarModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<OrdersRecord>();
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController7;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController8;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController9;

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  Map<CreatorPromotionsStruct, bool> checkboxValueMap2 = {};
  List<CreatorPromotionsStruct> get checkboxCheckedItems2 =>
      checkboxValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    emptyModel = createModel(context, () => EmptyModel());
    ratingBarModel = createModel(context, () => RatingBarModel());
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    personalInformationExpandableController.dispose();
    expandableExpandableController1.dispose();
    emptyModel.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
    ratingBarModel.dispose();
    expandableExpandableController6.dispose();
    paginatedDataTableController.dispose();
    expandableExpandableController7.dispose();
    expandableExpandableController8.dispose();
    expandableExpandableController9.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
