import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/batch_lookup_util.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import '/phase1/order/orders/orders_widget.dart' show AzyaaDateRangePickerDialog;
import '/phase1/product/product_preview/product_preview_widget.dart';
import '/phase1/product/product_quick_edit/product_quick_edit_widget.dart';
import '/phase1/product/products_grid/products_grid_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/custom_code/widgets/index.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dart:convert';
import 'dart:js_interop';
import 'package:web/web.dart' as web;
import 'package:syncfusion_flutter_xlsio/xlsio.dart'
    hide Column, Row, Border, Stack;
import 'products_model.dart';
export 'products_model.dart';

/// Returns true if [when] falls inside the range described by [filter].
/// [filter] is one of: All, Today, Yesterday, This Week, This Month, Custom.
bool productMatchesDateFilter(
  DateTime? when,
  String filter,
  DateTime? customStart,
  DateTime? customEnd,
) {
  if (filter == 'All' || filter.isEmpty) {
    return true;
  }
  if (when == null) {
    return false;
  }
  final now = DateTime.now();
  final startOfToday = DateTime(now.year, now.month, now.day);
  switch (filter) {
    case 'Today':
      final end = startOfToday.add(const Duration(days: 1));
      return !when.isBefore(startOfToday) && when.isBefore(end);
    case 'Yesterday':
      final start = startOfToday.subtract(const Duration(days: 1));
      return !when.isBefore(start) && when.isBefore(startOfToday);
    case 'This Week':
      final start =
          startOfToday.subtract(Duration(days: startOfToday.weekday - 1));
      final end = start.add(const Duration(days: 7));
      return !when.isBefore(start) && when.isBefore(end);
    case 'This Month':
      final start = DateTime(now.year, now.month, 1);
      final end = DateTime(now.year, now.month + 1, 1);
      return !when.isBefore(start) && when.isBefore(end);
    case 'Custom':
      if (customStart == null || customEnd == null) {
        return true;
      }
      final start =
          DateTime(customStart.year, customStart.month, customStart.day);
      final end = DateTime(customEnd.year, customEnd.month, customEnd.day)
          .add(const Duration(days: 1));
      return !when.isBefore(start) && when.isBefore(end);
    default:
      return true;
  }
}

/// Stock for a product resolved from the active inventory list.
int productStock(ProductsRecord p, List<InventoryRecord> inventory) {
  final match = inventory
      .where((e) => e.reference == p.product.inventoryRef)
      .toList()
      .firstOrNull;
  return (match?.stock ?? 0).toInt();
}

/// Status-chip predicate mirroring the products table filtering, reused for
/// the table and the export so both stay in sync.
bool productMatchesStatusFilter(ProductsRecord e, String productFilters) {
  final filter = productFilters.toLowerCase();
  final isDesigner = FFAppState().currentUserRoleKey == 'designer';
  final ownScope = e.productAuthorizer.productDesignerId == currentUserUid;
  if (filter == 'archived') {
    return isDesigner
        ? (e.status == 'archived' && ownScope)
        : e.status == 'archived';
  } else if (filter == 'all') {
    return isDesigner ? ownScope : true;
  } else if (filter == 'request') {
    return e.status == 'request';
  } else if (filter != 'all') {
    return isDesigner
        ? (e.status == filter && ownScope)
        : e.status == filter;
  } else {
    return isDesigner
        ? (ownScope && e.status != 'archived')
        : e.status != 'archived';
  }
}

/// Wraps a sortable column header so a persistent up-arrow is always shown,
/// signalling to the user that the column can be sorted.
Widget sortableColumnHeader(Widget label) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(child: label),
      const SizedBox(width: 6.0),
      const Icon(
        Icons.arrow_upward_rounded,
        size: 14.0,
        color: Color(0xFF616161),
      ),
    ],
  );
}

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  static String routeName = 'Products';
  static String routePath = '/azyaa-products';

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  late ProductsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentUserPermission.contains(_model.permissionKey) !=
          true) {
        context.goNamed(Error404Widget.routeName);
      }
    });

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    _designersFuture = queryUsersRecordOnce(
      queryBuilder: (usersRecord) =>
          usersRecord.where('user_role', isEqualTo: 'Designer'),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  late Future<List<UsersRecord>> _designersFuture;
  bool _isExporting = false;
  bool _isLoadingMore = false;
  String? _productDesignerLookupKey;
  Future<Map<String, UsersRecord>>? _productDesignerLookupFuture;

  Future<Map<String, UsersRecord>> _productDesignersLookupFuture(
    List<ProductsRecord> products,
  ) {
    final key = products.map((p) => p.reference.id).join(',');
    if (_productDesignerLookupKey != key ||
        _productDesignerLookupFuture == null) {
      _productDesignerLookupKey = key;
      final uids = products
          .map((p) => p.productAuthorizer.productDesignerId)
          .where((uid) => uid.isNotEmpty)
          .toList();
      _productDesignerLookupFuture = batchFetchUsersByUid(uids);
    }
    return _productDesignerLookupFuture!;
  }

  void _resetProductsWindow() {
    _model.visibleCount = ProductsModel.initialVisibleCount;
  }

  String _productsStatusLabel(String filter) {
    switch (filter.toLowerCase()) {
      case 'active':
        return FFLocalizations.of(context).getText('1o6znrc0' /* Active */);
      case 'inactive':
        return FFLocalizations.of(context).getText('b974f0q8' /* Inactive */);
      case 'draft':
        return FFLocalizations.of(context).getText('b7gsdgle' /* Draft */);
      case 'archived':
        return FFLocalizations.of(context).getText('3dm26jhd' /* Archived */);
      case 'request':
        return FFAppState().currentUserRoleKey == 'designer'
            ? ''
            : FFLocalizations.of(context).getVariableText(
                enText: 'Request',
                arText: 'طلب',
              );
      default:
        return FFLocalizations.of(context).getText('2p0kruhq' /* All */);
    }
  }

  String _productsFilterFromLabel(String? label) {
    if (label == null || label.isEmpty) {
      return 'all';
    }
    final active = FFLocalizations.of(context).getText('1o6znrc0');
    final inactive = FFLocalizations.of(context).getText('b974f0q8');
    final draft = FFLocalizations.of(context).getText('b7gsdgle');
    final archived = FFLocalizations.of(context).getText('3dm26jhd');
    final request = FFLocalizations.of(context).getVariableText(
      enText: 'Request',
      arText: 'طلب',
    );
    final all = FFLocalizations.of(context).getText('2p0kruhq');
    if (label == active) return 'active';
    if (label == inactive) return 'inactive';
    if (label == draft) return 'draft';
    if (label == archived) return 'archived';
    if (label == request) return 'request';
    if (label == all) return 'all';
    return 'all';
  }

  List<String> get _productStatusOptions {
    final options = <String>[
      FFLocalizations.of(context).getText('2p0kruhq' /* All */),
      FFLocalizations.of(context).getText('1o6znrc0' /* Active */),
      FFLocalizations.of(context).getText('b974f0q0' /* Inactive */),
      FFLocalizations.of(context).getText('b7gsdgle' /* Draft */),
      FFLocalizations.of(context).getText('3dm26jhd' /* Archived */),
    ];
    if (FFAppState().currentUserRoleKey != 'designer') {
      options.add(FFLocalizations.of(context).getVariableText(
        enText: 'Request',
        arText: 'طلب',
      ));
    }
    return options;
  }

  Widget _buildProductsStatusDropdown() {
    return AzyaaToolbarBox(
      width: 190.0,
      height: 40.0,
      child: FlutterFlowDropDown<String>(
        controller: _model.statusFilterController ??=
            FormFieldController<String>(_productsStatusLabel(_model.productFilters)),
        options: _productStatusOptions,
        onChanged: (val) {
          safeSetState(() {
            _model.productFilters = _productsFilterFromLabel(val);
            _model.choiceChipsValue = val;
            _resetProductsWindow();
          });
        },
        width: 190.0,
        height: 40.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w500),
              fontSize: 13.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        hintText: 'Status',
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 22.0,
        ),
        elevation: 2.0,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
        borderRadius: 8.0,
        margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
        hidesUnderline: true,
        isOverButton: false,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }

  Widget _buildProductsSortDropdown() {
    return AzyaaToolbarBox(
      width: 120.0,
      height: 40.0,
      child: FlutterFlowDropDown<String>(
        controller: _model.dateFilterController ??=
            FormFieldController<String>(
          _model.dateFilter == 'All' ? null : _model.dateFilter,
        ),
        options: const [
          'Today',
          'Yesterday',
          'This Week',
          'This Month',
          'Custom',
        ],
        onChanged: (val) async {
          if (val == null) {
            return;
          }
          if (val == 'Custom') {
            await _pickProductDateRange();
          } else {
            safeSetState(() {
              _model.dateFilter = val;
              _resetProductsWindow();
            });
          }
        },
        width: 120.0,
        height: 40.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w500),
              fontSize: 13.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        hintText: 'Sort',
        icon: Icon(
          Icons.calendar_today_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 18.0,
        ),
        elevation: 2.0,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
        borderRadius: 8.0,
        margin: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        hidesUnderline: true,
        isOverButton: false,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }

  Widget _buildProductsDesignerDropdown() {
    return AzyaaToolbarBox(
      width: 200.0,
      height: 40.0,
      child: FutureBuilder<List<UsersRecord>>(
        future: _designersFuture,
        builder: (context, snapshot) {
          final designers = snapshot.data ?? <UsersRecord>[];
          final sorted = designers.where((u) => u.uid.isNotEmpty).toList()
            ..sort((a, b) => (a.designerMainInfo.designerInfo.name.isNotEmpty
                    ? a.designerMainInfo.designerInfo.name
                    : a.displayName)
                .toLowerCase()
                .compareTo((b.designerMainInfo.designerInfo.name.isNotEmpty
                        ? b.designerMainInfo.designerInfo.name
                        : b.displayName)
                    .toLowerCase()));
          final options = ['', ...sorted.map((u) => u.uid)];
          final optionLabels = [
            'All Designers',
            ...sorted.map((u) => u.designerMainInfo.designerInfo.name.isNotEmpty
                ? u.designerMainInfo.designerInfo.name
                : (u.displayName.isNotEmpty ? u.displayName : u.uid)),
          ];
          return FlutterFlowDropDown<String>(
            controller: _model.designerFilterController ??=
                FormFieldController<String>(_model.designerFilterId ?? ''),
            options: options,
            optionLabels: optionLabels,
            onChanged: (val) {
              safeSetState(() {
                _model.designerFilterId =
                    (val == null || val.isEmpty) ? null : val;
                _resetProductsWindow();
              });
            },
            width: 200.0,
            height: 40.0,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
            hintText: 'All Designers',
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 22.0,
            ),
            elevation: 2.0,
            borderColor: Colors.transparent,
            borderWidth: 0.0,
            borderRadius: 8.0,
            margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
            hidesUnderline: true,
            isOverButton: false,
            isSearchable: true,
            isMultiSelect: false,
          );
        },
      ),
    );
  }

  Future<void> _pickProductDateRange() async {
    final picked = await showDialog<DateTimeRange>(
      context: context,
      builder: (dialogContext) => AzyaaDateRangePickerDialog(
        initialStart: _model.customRangeStart,
        initialEnd: _model.customRangeEnd,
      ),
    );
    if (picked != null) {
      safeSetState(() {
        _model.customRangeStart = picked.start;
        _model.customRangeEnd = picked.end;
        _model.dateFilter = 'Custom';
        _model.dateFilterController?.value = 'Custom';
        _resetProductsWindow();
      });
    } else if (_model.customRangeStart == null) {
      safeSetState(() {
        _model.dateFilter = 'All';
        _model.dateFilterController?.value = null;
        _resetProductsWindow();
      });
    }
  }

  bool get _hasActiveProductFilters =>
      (_model.productFilters != 'all' && _model.productFilters != 'All') ||
      (_model.designerFilterId != null &&
          _model.designerFilterId!.isNotEmpty) ||
      _model.dateFilter != 'All' ||
      _model.sortField.isNotEmpty ||
      _model.searchStatus == 'Show' ||
      (_model.searchTextController?.text.isNotEmpty ?? false);

  void _resetAllProductFilters() {
    safeSetState(() {
      _model.productFilters = 'all';
      _model.choiceChipsValue = FFLocalizations.of(context).getText(
        '2p0kruhq' /* All */,
      );
      _model.designerFilterId = null;
      _model.designerFilterController?.value = '';
      _model.dateFilter = 'All';
      _model.dateFilterController?.value = null;
      _model.customRangeStart = null;
      _model.customRangeEnd = null;
      _model.sortField = '';
      _model.sortAscending = true;
      _model.searchStatus = 'Hide';
      _model.searchTextController?.clear();
      _model.algoliaSearchResults = null;
      _resetProductsWindow();
    });
  }

  Widget _buildProductsSearchField() {
    return TextFormField(
        controller: _model.searchTextController,
        focusNode: _model.searchFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.searchTextController',
          Duration(milliseconds: 2000),
          () async {
            if (_model.searchTextController.text != '') {
              safeSetState(() => _model.algoliaSearchResults = null);
              await ProductsRecord.search(
                term: _model.searchTextController.text,
                maxResults: 10,
              )
                  .then((r) => _model.algoliaSearchResults = r)
                  .onError((_, __) => _model.algoliaSearchResults = [])
                  .whenComplete(() => safeSetState(() {}));

              _model.searchStatus = 'Show';
              _resetProductsWindow();
              safeSetState(() {});
            } else {
              _model.searchStatus = 'Hide';
              _resetProductsWindow();
              safeSetState(() {});
            }
          },
        ),
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          isDense: true,
          hintText: FFLocalizations.of(context).getText(
            '09k6sb6f' /* Search... */,
          ),
          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(),
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 12.0,
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).border,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          hoverColor: FlutterFlowTheme.of(context).secondaryBackground,
          suffixIcon: Icon(
            FFIcons.ksearch,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 18.0,
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(),
              fontSize: 12.0,
              letterSpacing: 0.0,
            ),
        cursorColor: FFAppState().theme.themeMain.primary,
        validator:
            _model.searchTextControllerValidator.asValidator(context),
    );
  }

  List<ProductsRecord> _filteredProductsForExport(
    List<ProductsRecord> source,
  ) {
    return source
        .where((e) => productMatchesStatusFilter(e, _model.productFilters))
        .where((e) =>
            _model.designerFilterId == null ||
            _model.designerFilterId!.isEmpty ||
            e.productAuthorizer.productDesignerId == _model.designerFilterId)
        .where((e) => productMatchesDateFilter(
              e.createdAt,
              _model.dateFilter,
              _model.customRangeStart,
              _model.customRangeEnd,
            ))
        .toList();
  }

  List<List<String>> _productExportRows(
    List<ProductsRecord> products,
    List<InventoryRecord> inventory,
    Map<String, String> designerNames,
  ) {
    final rows = <List<String>>[
      ['ID', 'Name', 'Price (KD)', 'Stock', 'Total Sales', 'Designer', 'Status'],
    ];
    for (final p in products) {
      rows.add([
        p.productId,
        p.productInfo.name,
        p.product.productPrice.toString(),
        productStock(p, inventory).toString(),
        p.productMarketing.productSalesHistory.length.toString(),
        designerNames[p.productAuthorizer.productDesignerId] ??
            p.productAuthorizer.productDesignerId,
        p.status,
      ]);
    }
    return rows;
  }

  void _downloadBytes(Uint8List bytes, String fileName, String mimeType) {
    final blob = web.Blob(
      [bytes.toJS].toJS,
      web.BlobPropertyBag(type: mimeType),
    );
    final url = web.URL.createObjectURL(blob);
    final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
    anchor.href = url;
    anchor.download = fileName;
    anchor.click();
    web.URL.revokeObjectURL(url);
  }

  Future<Map<String, String>> _loadDesignerNames() async {
    final designers = await _designersFuture;
    return <String, String>{
      for (final u in designers)
        if (u.uid.isNotEmpty)
          u.uid: (u.designerMainInfo.designerInfo.name.isNotEmpty
              ? u.designerMainInfo.designerInfo.name
              : (u.displayName.isNotEmpty ? u.displayName : u.uid)),
    };
  }

  Future<void> _exportProductsCsv(
    List<ProductsRecord> products,
    List<InventoryRecord> inventory,
  ) async {
    final names = await _loadDesignerNames();
    final rows = _productExportRows(products, inventory, names);
    final buffer = StringBuffer('\uFEFF');
    for (final row in rows) {
      buffer.writeln(
        row.map((cell) => '"${cell.replaceAll('"', '""')}"').join(','),
      );
    }
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    _downloadBytes(
      Uint8List.fromList(utf8.encode(buffer.toString())),
      'products_$timestamp.csv',
      'text/csv;charset=utf-8',
    );
  }

  Future<void> _exportProductsExcel(
    List<ProductsRecord> products,
    List<InventoryRecord> inventory,
  ) async {
    final names = await _loadDesignerNames();
    final rows = _productExportRows(products, inventory, names);
    final workbook = Workbook();
    final sheet = workbook.worksheets[0];
    for (var r = 0; r < rows.length; r++) {
      for (var c = 0; c < rows[r].length; c++) {
        final range = sheet.getRangeByIndex(r + 1, c + 1);
        if (r > 0 && (c == 2 || c == 3 || c == 4)) {
          range.setNumber(double.tryParse(rows[r][c]) ?? 0);
        } else {
          range.setText(rows[r][c]);
        }
      }
    }
    for (var c = 1; c <= rows.first.length; c++) {
      sheet.autoFitColumn(c);
    }
    final bytes = workbook.saveAsStream();
    workbook.dispose();
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    _downloadBytes(
      Uint8List.fromList(bytes),
      'products_$timestamp.xlsx',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    );
  }

  Future<void> _runExport(
    List<ProductsRecord> products,
    List<InventoryRecord> inventory,
    Future<void> Function(List<ProductsRecord>, List<InventoryRecord>) exporter,
  ) async {
    if (products.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No records to export')),
      );
      return;
    }
    safeSetState(() => _isExporting = true);
    try {
      await exporter(products, inventory);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Exported ${products.length} products'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        safeSetState(() => _isExporting = false);
      }
    }
  }

  void _showProductsExportOptions(
    List<ProductsRecord> products,
    List<InventoryRecord> inventory,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            'Export Products',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  '${products.length} products (current filters, image excluded)',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              ListTile(
                leading:
                    const Icon(Icons.table_chart, color: Color(0xFF1D6F42)),
                title: const Text('Export to Excel'),
                subtitle: const Text('.xlsx format'),
                onTap: () {
                  Navigator.pop(dialogContext);
                  _runExport(products, inventory, _exportProductsExcel);
                },
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.description, color: Color(0xFF1976D2)),
                title: const Text('Export to CSV'),
                subtitle: const Text('.csv format'),
                onTap: () {
                  Navigator.pop(dialogContext);
                  _runExport(products, inventory, _exportProductsCsv);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Products',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).background,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.azyaaSidebarModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: AzyaaSidebarWidget(
                                  menuname: 'Products',
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<List<ProductsRecord>>(
                                    stream: queryProductsRecord(
                                      queryBuilder: (productsRecord) =>
                                          productsRecord.orderBy('created_at',
                                              descending: true),
                                      limit: 500,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ProductsRecord>
                                          customerProductsRecordList =
                                          snapshot.data!;

                                      return Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .backgroundpage,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: Color(0xFFE6E7EB),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.safePop();
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_back,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        Expanded(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'mgkb2a6w' /* Products */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState()
                                                                        .theme
                                                                        .themeMain
                                                                        .primary,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nvlfqcf6' /* Export */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFE3E3E3),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'gem65ef4' /* Import */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFE3E3E3),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FlutterFlowDropDown<String>(
                                                      controller: _model
                                                              .dropDownValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4upvteil' /* More Actions */,
                                                        )
                                                      ],
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.dropDownValue =
                                                                  val),
                                                      width: 115.0,
                                                      height: 30.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'teqm0fyb' /* More Actions */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor:
                                                          Color(0xFFE3E3E3),
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  if (FFAppState()
                                                          .currentUserPermission
                                                          .contains(_model
                                                              .permissionKeyAdd) ==
                                                      true)
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState()
                                                            .updateAdminFlowStruct(
                                                          (e) =>
                                                              e..product = null,
                                                        );
                                                        FFAppState()
                                                            .updateAdminFlowStruct(
                                                          (e) => e
                                                            ..updateProduct(
                                                              (e) => e
                                                                ..sku = random_data
                                                                    .randomInteger(
                                                                        100000,
                                                                        999999),
                                                            ),
                                                        );
                                                        while (
                                                            _model.loop > 0) {
                                                          _model.skuCount =
                                                              await queryProductsRecordCount(
                                                            queryBuilder:
                                                                (productsRecord) =>
                                                                    productsRecord
                                                                        .where(
                                                              'product.SKU',
                                                              isEqualTo:
                                                                  FFAppState()
                                                                      .adminFlow
                                                                      .product
                                                                      .sku,
                                                            ),
                                                          );
                                                          if (_model.skuCount ==
                                                              0) {
                                                            break;
                                                          } else {
                                                            FFAppState()
                                                                .updateAdminFlowStruct(
                                                              (e) => e
                                                                ..updateProduct(
                                                                  (e) => e
                                                                    ..sku = random_data
                                                                        .randomInteger(
                                                                            100000,
                                                                            999999),
                                                                ),
                                                            );
                                                          }
                                                        }

                                                        context.pushNamed(
                                                            ProductAddWidget
                                                                .routeName);

                                                        safeSetState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'kyym8c56' /* Add Product */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FFAppState()
                                                            .theme
                                                            .themeMain
                                                            .primaryButtoncolor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FFAppState()
                                                                      .theme
                                                                      .themeMain
                                                                      .primaryButtonTextColor,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FFAppState()
                                                              .theme
                                                              .themeMain
                                                              .primaryButtonBorder!,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .notificatioAlertModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child:
                                                        NotificatioAlertWidget(),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(width: 8.0))
                                                    .addToEnd(
                                                        SizedBox(width: 12.0)),
                                              ),
                                            ),
                                            if (FFAppState()
                                                    .currentUserRoleKey !=
                                                'designer')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 16.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 220.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '6fv01eqh' /* Total Products Listed */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  customerProductsRecordList
                                                                      .length
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 6.0)),
                                                            ),
                                                          ),
                                                          VerticalDivider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 220.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'h60igavd' /* Pending Product Approvals */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  customerProductsRecordList
                                                                      .where((e) =>
                                                                          e.status ==
                                                                          'Pending')
                                                                      .toList()
                                                                      .length
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 6.0)),
                                                            ),
                                                          ),
                                                          VerticalDivider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 220.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '07t80w3n' /* Low Stock Alerts */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ProductsRecord>>(
                                                                  stream:
                                                                      queryProductsRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ProductsRecord>
                                                                        richTextProductsRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'qa1dptx0' /* Elegant Satin Gown (2 Costumer... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: valueOrDefault<Color>(
                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 6.0)),
                                                            ),
                                                          ),
                                                          VerticalDivider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 220.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '3sd6ddks' /* Best-Selling Product */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  customerProductsRecordList
                                                                      .where((e) =>
                                                                          e.productMarketing.productSalesHistory
                                                                              .length >
                                                                          0)
                                                                      .toList()
                                                                      .length
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 6.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 24.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: StreamBuilder<
                                                    List<InventoryRecord>>(
                                                  stream: queryInventoryRecord(
                                                    queryBuilder:
                                                        (inventoryRecord) =>
                                                            inventoryRecord
                                                                .where(
                                                      'status',
                                                      isEqualTo: 'active',
                                                    ),
                                                    limit: 500,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<InventoryRecord>
                                                        listInventoryRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AzyaaListToolbar(
                                                            leftControl: Row(
                                                              children: [
                                                                _buildProductsStatusDropdown(),
                                                                const SizedBox(
                                                                    width: 12.0),
                                                                _buildProductsDesignerDropdown(),
                                                              ],
                                                            ),
                                                            searchField:
                                                                _buildProductsSearchField(),
                                                            showingText:
                                                                'Showing ${_model.visibleCount.clamp(0, customerProductsRecordList.length)} of ${customerProductsRecordList.length}',
                                                            trailingActions: [
                                                              AzyaaToolbarButtons.export(
                                                                context: context,
                                                                onPressed: _isExporting
                                                                    ? null
                                                                    : () => _showProductsExportOptions(
                                                                          _filteredProductsForExport(
                                                                              customerProductsRecordList),
                                                                          listInventoryRecordList,
                                                                        ),
                                                                isExporting:
                                                                    _isExporting,
                                                              ),
                                                              _buildProductsSortDropdown(),
                                                            ],
                                                            extraTrailing: [
                                                              if (_hasActiveProductFilters)
                                                                AzyaaToolbarButtons.reset(
                                                                  context: context,
                                                                  onPressed:
                                                                      _resetAllProductFilters,
                                                                ),
                                                              FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(context).buttonBorder,
                                                                borderRadius: 8.0,
                                                                buttonSize: 40.0,
                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                icon: Icon(
                                                                  Icons.format_list_bulleted,
                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: () async {
                                                                  _model.styleName = _model.styleName == 'List' ? 'Grid' : 'List';
                                                                  safeSetState(() {});
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                            ),
                                                          ),
                                                          if (_model
                                                                  .styleName ==
                                                              'List')
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                  ),
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final prd = (_model.searchStatus == 'Show'
                                                                                ? _model.algoliaSearchResults
                                                                                    ?.where((e) => () {
                                                                                          if (_model.productFilters == 'archived') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == 'archived') && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == 'archived'));
                                                                                          } else if (_model.productFilters == 'all') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? (e.productAuthorizer.productDesignerId == currentUserUid) : true);
                                                                                          } else if (_model.productFilters == 'request') {
                                                                                            return (e.status == 'request');
                                                                                          } else if (_model.productFilters != 'all') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == _model.productFilters) && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == _model.productFilters));
                                                                                          } else {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.productAuthorizer.productDesignerId == currentUserUid) && (e.status != 'archived')) : (e.status != 'archived'));
                                                                                          }
                                                                                        }())
                                                                                    .toList()
                                                                                    .sortedList(keyOf: (e) => e.createdAt!, desc: true)
                                                                                : customerProductsRecordList
                                                                                    .where((e) => () {
                                                                                          if (_model.productFilters == 'archived') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == 'archived') && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == 'archived'));
                                                                                          } else if (_model.productFilters == 'all') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? (e.productAuthorizer.productDesignerId == currentUserUid) : true);
                                                                                          } else if (_model.productFilters == 'request') {
                                                                                            return (e.status == 'request');
                                                                                          } else if (_model.productFilters != 'all') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == _model.productFilters) && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == _model.productFilters));
                                                                                          } else {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.productAuthorizer.productDesignerId == currentUserUid) && (e.status != 'archived')) : (e.status != 'archived'));
                                                                                          }
                                                                                        }())
                                                                                    .toList()
                                                                                    .sortedList(keyOf: (e) => e.createdAt!, desc: true))
                                                                            ?.toList() ??
                                                                        [];
                                                                    final prdView =
                                                                        prd
                                                                            .where((e) =>
                                                                                _model.designerFilterId == null ||
                                                                                _model.designerFilterId!.isEmpty ||
                                                                                e.productAuthorizer.productDesignerId == _model.designerFilterId)
                                                                            .where((e) => productMatchesDateFilter(
                                                                                  e.createdAt,
                                                                                  _model.dateFilter,
                                                                                  _model.customRangeStart,
                                                                                  _model.customRangeEnd,
                                                                                ))
                                                                            .toList();
                                                                    if (_model
                                                                        .sortField
                                                                        .isNotEmpty) {
                                                                      int cmp(
                                                                          ProductsRecord
                                                                              a,
                                                                          ProductsRecord
                                                                              b) {
                                                                        switch (
                                                                            _model.sortField) {
                                                                          case 'price':
                                                                            return a.product.productPrice.toDouble().compareTo(b.product.productPrice.toDouble());
                                                                          case 'stock':
                                                                            return productStock(a, listInventoryRecordList).compareTo(productStock(b, listInventoryRecordList));
                                                                          case 'sales':
                                                                            return a.productMarketing.productSalesHistory.length.compareTo(b.productMarketing.productSalesHistory.length);
                                                                          default:
                                                                            return 0;
                                                                        }
                                                                      }

                                                                      prdView.sort((a,
                                                                              b) =>
                                                                          _model.sortAscending
                                                                              ? cmp(a, b)
                                                                              : -cmp(a, b));
                                                                    }
                                                                    if (prdView
                                                                        .isEmpty) {
                                                                      return Container(
                                                                        width:
                                                                            800.0,
                                                                        height:
                                                                            300.0,
                                                                        child:
                                                                            EmptyWidget(
                                                                          messageOne:
                                                                              'No orders with the applied filters',
                                                                          messageTwo:
                                                                              'Try changing the filters or search terms for this view.',
                                                                        ),
                                                                      );
                                                                    }
                                                                    final windowedPrdView =
                                                                        prdView
                                                                            .take(_model
                                                                                .visibleCount)
                                                                            .toList();
                                                                    final hasMoreProducts =
                                                                        prdView.length >
                                                                            windowedPrdView
                                                                                .length;

                                                                    return NotificationListener<
                                                                        ScrollNotification>(
                                                                      onNotification:
                                                                          (notification) {
                                                                        if (hasMoreProducts &&
                                                                            !_isLoadingMore &&
                                                                            _model.visibleCount <
                                                                                prdView.length &&
                                                                            notification.metrics.pixels >=
                                                                                notification.metrics.maxScrollExtent -
                                                                                    300) {
                                                                          safeSetState(() =>
                                                                              _isLoadingMore =
                                                                                  true);
                                                                          WidgetsBinding
                                                                              .instance
                                                                              .addPostFrameCallback((_) {
                                                                            if (mounted) {
                                                                              safeSetState(() {
                                                                                _model.visibleCount = (_model.visibleCount + ProductsModel.loadMoreStep).clamp(0, prdView.length);
                                                                                _isLoadingMore =
                                                                                    false;
                                                                              });
                                                                            }
                                                                          });
                                                                        }
                                                                        return false;
                                                                      },
                                                                      child:
                                                                          FutureBuilder<
                                                                        Map<String,
                                                                            UsersRecord>>(
                                                                      future:
                                                                          _productDesignersLookupFuture(
                                                                              windowedPrdView),
                                                                      builder:
                                                                          (context,
                                                                              designerSnapshot) {
                                                                        final designerByUid =
                                                                            designerSnapshot.data ??
                                                                                {};
                                                                        return FlutterFlowDataTable<
                                                                            ProductsRecord>(
                                                                      controller:
                                                                          _model
                                                                              .paginatedDataTableController,
                                                                      data:
                                                                          windowedPrdView,
                                                                      columnsBuilder:
                                                                          (onSortChanged) =>
                                                                              [
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'dtiuwcz8' /*   */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          fixedWidth:
                                                                              50.0,
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '03b1tvxq' /* ID */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'wqa7x7jp' /* Name */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              sortableColumnHeader(
                                                                                  DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'lo4u3rix' /* Price */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          )),
                                                                          onSort: (i,
                                                                                  asc) =>
                                                                              onSortChanged(
                                                                                  i,
                                                                                  asc),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              sortableColumnHeader(
                                                                                  DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'r00746ch' /* Stock */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          )),
                                                                          onSort: (i,
                                                                                  asc) =>
                                                                              onSortChanged(
                                                                                  i,
                                                                                  asc),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              sortableColumnHeader(
                                                                                  DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'rlfwb7gq' /* Total Sales */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          )),
                                                                          onSort: (i,
                                                                                  asc) =>
                                                                              onSortChanged(
                                                                                  i,
                                                                                  asc),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'wg7dlsg4' /* Designer */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '4znmn35z' /* Rating */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'p30azj7z' /* Status */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'drayj93l' /*   */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                      dataRowBuilder: (prdItem,
                                                                              prdIndex,
                                                                              selected,
                                                                              onSelectChanged) =>
                                                                          DataRow(
                                                                        cells: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              getCORSProxyUrl(
                                                                                () {
                                                                                  if (prdItem.productInfo.featureImage != '') {
                                                                                    return prdItem.productInfo.featureImage;
                                                                                  } else if (prdItem.productInfo.featureImage == '') {
                                                                                    return prdItem.productInfo.galleryImage.firstOrNull!;
                                                                                  } else {
                                                                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                                                                                  }
                                                                                }(),
                                                                              ),
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              fit: BoxFit.cover,
                                                                              alignment: Alignment(0.0, 0.0),
                                                                            ),
                                                                          ),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            prdItem.productId,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          )),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: () {
                                                                                if (prdItem.productInfoCustomTranslate.name.en != '') {
                                                                                  return prdItem.productInfoCustomTranslate.name.en;
                                                                                } else if (prdItem.productInfoTranslate.name.en != '') {
                                                                                  return prdItem.productInfoTranslate.name.en;
                                                                                } else {
                                                                                  return prdItem.productInfo.name;
                                                                                }
                                                                              }(),
                                                                              arText: () {
                                                                                if (prdItem.productInfoCustomTranslate.name.ar != '') {
                                                                                  return prdItem.productInfoCustomTranslate.name.ar;
                                                                                } else if (prdItem.productInfoTranslate.name.ar != '') {
                                                                                  return prdItem.productInfoTranslate.name.ar;
                                                                                } else {
                                                                                  return prdItem.productInfo.name;
                                                                                }
                                                                              }(),
                                                                            ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          )),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            '${prdItem.product.productPrice.toString()} KD',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          )),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            valueOrDefault<String>(
                                                                              listInventoryRecordList.where((e) => e.reference == prdItem.product.inventoryRef).toList().firstOrNull?.stock.toString(),
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          )),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                              child: SelectionArea(
                                                                                  child: Text(
                                                                                '${valueOrDefault<String>(
                                                                                  prdItem.productMarketing.productSalesHistory.length.toString(),
                                                                                  '0',
                                                                                )} Sold',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primaryText,
                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              )),
                                                                            ),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final designerId =
                                                                                  prdItem.productAuthorizer.productDesignerId;
                                                                              if (designerId.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final textUsersRecord =
                                                                                  designerByUid[designerId];
                                                                              if (textUsersRecord ==
                                                                                  null) {
                                                                                return Image.asset(
                                                                                  getCORSProxyUrl(
                                                                                    '',
                                                                                  ),
                                                                                );
                                                                              }

                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    DesignerActiveWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'designer': serializeParam(
                                                                                        textUsersRecord.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  textUsersRecord.designerMainInfo.designerInfo.name.maybeHandleOverflow(
                                                                                    maxChars: 7,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primaryText,
                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              if (prdItem.productReview.length > 0)
                                                                                RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: valueOrDefault<String>(
                                                                                          ((functions.newCartTotal(prdItem.productReview
                                                                                                      .map((e) => valueOrDefault<double>(
                                                                                                            e.reviewRate,
                                                                                                            0.0,
                                                                                                          ))
                                                                                                      .toList()) /
                                                                                                  prdItem.productReview.length))
                                                                                              .toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'az8bkrt1' /* ( */,
                                                                                        ),
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontSize: 13.0,
                                                                                        ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: valueOrDefault<String>(
                                                                                          prdItem.productReview.length.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          '8odegyd6' /* ) */,
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: valueOrDefault<Color>(
                                                                                            FFAppState().theme.themeMain.primaryText,
                                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if (prdItem.productReview.length <= 0)
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'rtp6sgvr' /*  - */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: () {
                                                                                if (prdItem.status == 'active') {
                                                                                  return Color(0x0D27DA69);
                                                                                } else if (prdItem.status == 'inactive') {
                                                                                  return Color(0x0EDA2744);
                                                                                } else if (prdItem.status == 'request') {
                                                                                  return Color(0x0EF9CF58);
                                                                                } else if (prdItem.status == 'archived') {
                                                                                  return Color(0x0C8F8F8F);
                                                                                } else {
                                                                                  return Color(0x0EAD945A);
                                                                                }
                                                                              }(),
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                              border: Border.all(
                                                                                color: () {
                                                                                  if (prdItem.status == 'active') {
                                                                                    return FlutterFlowTheme.of(context).success;
                                                                                  } else if (prdItem.status == 'inactive') {
                                                                                    return FlutterFlowTheme.of(context).error;
                                                                                  } else if (prdItem.status == 'request') {
                                                                                    return FlutterFlowTheme.of(context).warning;
                                                                                  } else if (prdItem.status == 'archived') {
                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                  } else {
                                                                                    return Color(0xFFAD945A);
                                                                                  }
                                                                                }(),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                              child: SelectionArea(
                                                                                  child: Text(
                                                                                prdItem.status,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: () {
                                                                                        if (prdItem.status == 'active') {
                                                                                          return FlutterFlowTheme.of(context).success;
                                                                                        } else if (prdItem.status == 'inactive') {
                                                                                          return FlutterFlowTheme.of(context).error;
                                                                                        } else if (prdItem.status == 'request') {
                                                                                          return FlutterFlowTheme.of(context).warning;
                                                                                        } else if (prdItem.status == 'archived') {
                                                                                          return FlutterFlowTheme.of(context).secondaryText;
                                                                                        } else {
                                                                                          return Color(0xFFAD945A);
                                                                                        }
                                                                                      }(),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              )),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Builder(
                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                  borderRadius: 8.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: Colors.transparent,
                                                                                  icon: Icon(
                                                                                    Icons.edit_note_outlined,
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primary,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    _model.presentProductResult1 = await ProductsRecord.getDocumentOnce(prdItem.reference);
                                                                                    FFAppState().updateAdminFlowStruct(
                                                                                      (e) => e
                                                                                        ..updateProduct(
                                                                                          (e) => e
                                                                                            ..status = _model.presentProductResult1?.status
                                                                                            ..productType = _model.presentProductResult1?.productType
                                                                                            ..productId = _model.presentProductResult1?.productId
                                                                                            ..productInfo = _model.presentProductResult1?.productInfo
                                                                                            ..product = _model.presentProductResult1?.product
                                                                                            ..productAuthor = _model.presentProductResult1?.productAuthorizer
                                                                                            ..productMarket = _model.presentProductResult1?.productMarketing
                                                                                            ..productAttribute = _model.presentProductResult1!.productAttribute.toList()
                                                                                            ..sku = _model.presentProductResult1?.product.sku,
                                                                                        ),
                                                                                    );
                                                                                    await showDialog(
                                                                                      barrierColor: Color(0x7B000000),
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 600.0,
                                                                                                child: ProductQuickEditWidget(
                                                                                                  product: prdItem.reference,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                  borderRadius: 8.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: Colors.transparent,
                                                                                  icon: Icon(
                                                                                    Icons.more_vert,
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primary,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    await showDialog(
                                                                                      barrierColor: Color(0x7B000000),
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: Container(
                                                                                                height: 800.0,
                                                                                                width: 600.0,
                                                                                                child: ProductPreviewWidget(
                                                                                                  product: prdItem,
                                                                                                  stocks: listInventoryRecordList.where((e) => e.inventoryId == prdItem.product.inventoryId).toList().length == 1
                                                                                                      ? valueOrDefault<String>(
                                                                                                          listInventoryRecordList.where((e) => e.inventoryId == prdItem.product.inventoryId).toList().firstOrNull?.stock.toString(),
                                                                                                          '0',
                                                                                                        )
                                                                                                      : '0',
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ]
                                                                            .map((c) =>
                                                                                DataCell(c))
                                                                            .toList(),
                                                                      ),
                                                                      emptyBuilder:
                                                                          () =>
                                                                              Container(
                                                                        width:
                                                                            800.0,
                                                                        height:
                                                                            300.0,
                                                                        child:
                                                                            EmptyWidget(
                                                                          messageOne:
                                                                              'No orders with the applied filters',
                                                                          messageTwo:
                                                                              'Try changing the filters or search terms for this view.',
                                                                        ),
                                                                      ),
                                                                      onSortChanged:
                                                                          (columnIndex,
                                                                              ascending) {
                                                                        _model.sortAscending =
                                                                            ascending;
                                                                        _model.sortField =
                                                                            () {
                                                                          switch (
                                                                              columnIndex) {
                                                                            case 3:
                                                                              return 'price';
                                                                            case 4:
                                                                              return 'stock';
                                                                            case 5:
                                                                              return 'sales';
                                                                            default:
                                                                              return '';
                                                                          }
                                                                        }();
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      sortIconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      paginated:
                                                                          true,
                                                                      selectable:
                                                                          false,
                                                                      hidePaginator:
                                                                          false,
                                                                      showFirstLastButtons:
                                                                          true,
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      headingRowHeight:
                                                                          40.0,
                                                                      dataRowHeight:
                                                                          45.0,
                                                                      columnSpacing:
                                                                          16.0,
                                                                      headingRowColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      addHorizontalDivider:
                                                                          true,
                                                                      addTopAndBottomDivider:
                                                                          true,
                                                                      hideDefaultHorizontalDivider:
                                                                          false,
                                                                      horizontalDividerColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .border,
                                                                      horizontalDividerThickness:
                                                                          1.0,
                                                                      addVerticalDivider:
                                                                          false,
                                                                    );
                                                                      },
                                                                    ),
                                                                  );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          if (_model
                                                                  .styleName ==
                                                              'Grid')
                                                            Expanded(
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (_model
                                                                              .styleName ==
                                                                          'Grid')
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(16.0),
                                                                          child:
                                                                              Wrap(
                                                                            spacing:
                                                                                8.0,
                                                                            runSpacing:
                                                                                24.0,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final productGridList = customerProductsRecordList
                                                                                      .where((e) => () {
                                                                                            if (_model.productFilters == 'archived') {
                                                                                              return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == 'archived') && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == 'archived'));
                                                                                            } else if (_model.productFilters != 'all') {
                                                                                              return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == _model.productFilters) && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == _model.productFilters));
                                                                                            } else {
                                                                                              return (FFAppState().currentUserRoleKey == 'designer' ? ((e.productAuthorizer.productDesignerId == currentUserUid) && (e.status != 'archived')) : (e.status != 'archived'));
                                                                                            }
                                                                                          }())
                                                                                      .toList()
                                                                                      .sortedList(keyOf: (e) => e.createdAt!, desc: true)
                                                                                      .toList();

                                                                                  return Wrap(
                                                                                    spacing: 24.0,
                                                                                    runSpacing: 24.0,
                                                                                    alignment: WrapAlignment.start,
                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                    direction: Axis.horizontal,
                                                                                    runAlignment: WrapAlignment.start,
                                                                                    verticalDirection: VerticalDirection.down,
                                                                                    clipBehavior: Clip.none,
                                                                                    children: List.generate(productGridList.length, (productGridListIndex) {
                                                                                      final productGridListItem = productGridList[productGridListIndex];
                                                                                      return ProductsGridWidget(
                                                                                        key: Key('Keyf43_${productGridListIndex}_of_${productGridList.length}'),
                                                                                        product: productGridListItem,
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ].addToEnd(SizedBox(
                                                                        height:
                                                                            24.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ]
                                              .addToStart(
                                                  SizedBox(height: 16.0))
                                              .addToEnd(SizedBox(height: 24.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    wrapWithModel(
                      model: _model.azyaaResponsiveModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AzyaaResponsiveWidget(),
                    ),
                  wrapWithModel(
                    model: _model.themeStatusCheckerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ThemeStatusCheckerWidget(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
