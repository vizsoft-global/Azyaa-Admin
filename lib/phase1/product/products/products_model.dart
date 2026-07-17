import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'products_widget.dart' show ProductsWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ProductsModel extends FlutterFlowModel<ProductsWidget> {
  ///  Local state fields for this page.

  String productFilters = 'all';

  String searchStatus = 'Hide';

  String styleName = 'List';

  String permissionKey = 'product';

  String permissionKeyEdit = 'product_edit';

  String permissionKeyAdd = 'product_add';

  int loop = 1;

  // Designer filter (from the top dropdown). Empty/null = All Designers.
  String? designerFilterId;
  FormFieldController<String>? designerFilterController;

  // Date range filter for the products table.
  // One of: All, Today, Yesterday, This Week, This Month, Custom.
  String dateFilter = 'All';
  DateTime? customRangeStart;
  DateTime? customRangeEnd;
  FormFieldController<String>? dateFilterController;

  // Column sorting for price / stock / sales headers.
  // sortField: '' (default created_at desc), 'price', 'stock', or 'sales'.
  String sortField = '';
  bool sortAscending = true;

  // Infinite-scroll windowing (matches orders page).
  int visibleCount = 50;
  static const int initialVisibleCount = 50;
  static const int loadMoreStep = 100;

  FormFieldController<String>? statusFilterController;

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? skuCount;
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
  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Algolia Search Results from action on Search
  List<ProductsRecord>? algoliaSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ProductsRecord>();
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  ProductsRecord? presentProductResult1;
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

    paginatedDataTableController.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
