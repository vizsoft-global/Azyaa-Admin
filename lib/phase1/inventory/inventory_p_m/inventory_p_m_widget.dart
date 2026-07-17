import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import '/phase1/inventory/adjust_alert_threshold/adjust_alert_threshold_widget.dart';
import '/phase1/inventory/restock_request/restock_request_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import '/phase1/order/orders/orders_widget.dart'
    show AzyaaDateRangePickerDialog, orderMatchesDateFilter;
import '/custom_code/widgets/index.dart';
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dart:convert';
import 'dart:js_interop';
import 'package:web/web.dart' as web;
import 'package:syncfusion_flutter_xlsio/xlsio.dart'
    hide Column, Row, Border, Stack;
import 'inventory_p_m_model.dart';
export 'inventory_p_m_model.dart';

class InventoryPMWidget extends StatefulWidget {
  const InventoryPMWidget({super.key});

  static String routeName = 'Inventory-PM';
  static String routePath = '/azyaa-inventory';

  @override
  State<InventoryPMWidget> createState() => _InventoryPMWidgetState();
}

class _InventoryPMWidgetState extends State<InventoryPMWidget> {
  late InventoryPMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventoryPMModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentUserPermission.contains(_model.permissionKey) !=
          true) {
        context.goNamed(Error404Widget.routeName);
      }
      // Default status so a table branch renders on first load (null hides all).
      if (_model.choiceChipsValue == null || _model.choiceChipsValue!.isEmpty) {
        final allLabel =
            FFLocalizations.of(context).getText('7e5lng7r' /* All */);
        _model.choiceChipsValue = allLabel;
        _model.statusFilterController?.value = allLabel;
        safeSetState(() {});
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

  void _resetInventoryWindow() {
    _model.visibleCount = InventoryPMModel.initialVisibleCount;
  }

  bool get _hasActiveInventoryFilters {
    final chip = _model.choiceChipsValue;
    final chipActive =
        chip != null && chip.isNotEmpty && chip != 'All' && chip != 'الجميع';
    return chipActive ||
        (_model.designerFilterId != null &&
            _model.designerFilterId!.isNotEmpty) ||
        _model.dateFilter != 'All' ||
        _model.searchStatus == 'Show' ||
        (_model.searchTextController?.text.isNotEmpty ?? false);
  }

  bool get _isAllStatusChip {
    final chip = _model.choiceChipsValue;
    return chip == null ||
        chip.isEmpty ||
        chip == 'All' ||
        chip == 'الجميع';
  }

  void _resetAllInventoryFilters() {
    safeSetState(() {
      _model.choiceChipsValue = FFLocalizations.of(context).getText(
        '7e5lng7r' /* All */,
      );
      _model.statusFilterController?.value = _model.choiceChipsValue;
      _model.designerFilterId = null;
      _model.designerFilterController?.value = '';
      _model.dateFilter = 'All';
      _model.dateFilterController?.value = null;
      _model.customRangeStart = null;
      _model.customRangeEnd = null;
      _model.searchStatus = 'Hide';
      _model.searchTextController?.clear();
      _model.algoliaSearchResults = null;
      _resetInventoryWindow();
    });
  }

  Future<void> _pickInventoryDateRange() async {
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
        _resetInventoryWindow();
      });
    } else if (_model.customRangeStart == null) {
      safeSetState(() {
        _model.dateFilter = 'All';
        _model.dateFilterController?.value = null;
        _resetInventoryWindow();
      });
    }
  }

  List<String> _inventoryStatusOptions() {
    if ((FFAppState().currentUserRoleKey == 'designer') &&
        (FFLocalizations.of(context).languageCode == 'en')) {
      return _model.designerChoicehips.where((e) => e.isNotEmpty).toList();
    } else if ((FFAppState().currentUserRoleKey == 'designer') &&
        (FFLocalizations.of(context).languageCode == 'ar')) {
      return _model.designerChoicehipsAR;
    } else if ((FFAppState().currentUserRoleKey != 'designer') &&
        (FFLocalizations.of(context).languageCode == 'ar')) {
      return _model.adminChoicechipsAR;
    } else {
      return _model.adminChoicechips;
    }
  }

  Widget _buildInventoryStatusDropdown() {
    final initialStatus = _model.choiceChipsValue ??
        FFLocalizations.of(context).getText('7e5lng7r' /* All */);
    if (_model.choiceChipsValue == null || _model.choiceChipsValue!.isEmpty) {
      _model.choiceChipsValue = initialStatus;
    }
    return AzyaaToolbarBox(
      width: 190.0,
      height: 40.0,
      child: FlutterFlowDropDown<String>(
        controller: _model.statusFilterController ??=
            FormFieldController<String>(initialStatus),
        options: _inventoryStatusOptions(),
        onChanged: (val) async {
          safeSetState(() {
            _model.choiceChipsValue = val;
            _resetInventoryWindow();
          });
          if ((val == 'Low Stock Alert') ||
              (val == 'تنبيه انخفاض المخزون')) {
            FFAppState().updateAdminFlowStruct((e) => e..stockOnHand = null);
          }
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
        icon: Icon(Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText, size: 22.0),
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

  Widget _buildInventorySortDropdown() {
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
            await _pickInventoryDateRange();
          } else {
            safeSetState(() {
              _model.dateFilter = val;
              _resetInventoryWindow();
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
        icon: Icon(Icons.calendar_today_rounded,
            color: FlutterFlowTheme.of(context).secondaryText, size: 18.0),
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

  Widget _buildInventorySearchField() {
    return TextFormField(
      controller: _model.searchTextController,
      focusNode: _model.searchFocusNode,
      onChanged: (_) => EasyDebounce.debounce(
        '_model.searchTextController',
        const Duration(milliseconds: 2000),
        () async {
          if (_model.searchTextController.text != '') {
            safeSetState(() => _model.algoliaSearchResults = null);
            await InventoryRecord.search(
              term: _model.searchTextController.text,
              maxResults: 10,
            )
                .then((r) => _model.algoliaSearchResults = r)
                .onError((_, __) => _model.algoliaSearchResults = [])
                .whenComplete(() => safeSetState(() {}));
            _model.searchStatus = 'Show';
            _resetInventoryWindow();
            safeSetState(() {});
          } else {
            _model.searchStatus = 'Hide';
            _resetInventoryWindow();
            safeSetState(() {});
          }
        },
      ),
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: FFLocalizations.of(context).getText(
          'd5iva288' /* Search by Product ID */,
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
        filled: true,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        suffixIcon: Icon(FFIcons.ksearch,
            color: FlutterFlowTheme.of(context).secondaryText, size: 18.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(),
            fontSize: 13.0,
            letterSpacing: 0.0,
          ),
      cursorColor: FlutterFlowTheme.of(context).primaryText,
      validator: _model.searchTextControllerValidator.asValidator(context),
    );
  }

  Widget _buildInventoryDesignerDropdown() {
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
                _resetInventoryWindow();
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

  /// Same role/status rules as the on-screen inventory tables.
  bool _inventoryMatchesStatus(
    InventoryRecord e, {
    required bool fromSearch,
  }) {
    final chip = _model.choiceChipsValue;
    final isDesigner = FFAppState().currentUserRoleKey == 'designer';
    final stockValue = fromSearch ? e.stockOnHand : e.stock;

    if (isDesigner) {
      if (e.designerUid != currentUserUid) return false;
      if (chip == 'Low Stock Alert' || chip == 'تنبيه انخفاض المخزون') {
        return e.isPreferredVendor == true &&
            e.status == 'active' &&
            e.thresholdStock >= stockValue;
      }
      if (chip == 'Active' || chip == 'نشيط') {
        return e.isPreferredVendor == true && e.status == 'active';
      }
      if (chip == 'Inactive' || chip == 'غير نشط') {
        return e.isPreferredVendor == true && e.status != 'active';
      }
      return e.isPreferredVendor == true;
    }

    if (_model.designerFilterId != null &&
        _model.designerFilterId!.isNotEmpty &&
        e.designerUid != _model.designerFilterId) {
      return false;
    }
    if ((chip == 'Stock Managed by Azyaa') ||
        (chip == 'الأسهم التي تديرها Azyaa')) {
      return e.isPreferredVendor == true;
    }
    if ((chip == 'Stock Managed by Designer') ||
        (chip == 'الأسهم التي يديرها المصمم')) {
      return e.isPreferredVendor == false;
    }
    if (chip == 'Active' || chip == 'نشيط') {
      return e.isPreferredVendor == true && e.status == 'active';
    }
    if (chip == 'Inactive' || chip == 'غير نشط') {
      return e.isPreferredVendor == true && e.status != 'active';
    }
    if (chip == 'Low Stock Alert' || chip == 'تنبيه انخفاض المخزون') {
      return e.isPreferredVendor == true &&
          e.status == 'active' &&
          e.thresholdStock >= stockValue;
    }
    return true;
  }

  /// Filtered set used by Showing + Export (mirrors orders `mainFilteredOrders`).
  List<InventoryRecord> _buildMainFilteredInventory(
    List<InventoryRecord> source,
  ) {
    final fromSearch = _model.searchStatus == 'Show';
    final base =
        fromSearch ? (_model.algoliaSearchResults ?? <InventoryRecord>[]) : source;
    return base
        .where(
          (e) => orderMatchesDateFilter(
            e.updatedAt,
            _model.dateFilter,
            _model.customRangeStart,
            _model.customRangeEnd,
          ),
        )
        .where((e) => _inventoryMatchesStatus(e, fromSearch: fromSearch))
        .toList()
        .sortedList(
          keyOf: (e) => e.updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
          desc: true,
        );
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

  List<List<String>> _inventoryExportRows(List<InventoryRecord> inventory) {
    final rows = <List<String>>[
      [
        'Inventory ID',
        'Product ID',
        'SKU',
        'Stock',
        'Stock On Hand',
        'Threshold',
        'Status',
        'Stock Source',
        'Updated At',
      ],
    ];
    for (final e in inventory) {
      rows.add([
        e.inventoryId,
        e.productId,
        e.productSku,
        e.stock.toString(),
        e.stockOnHand.toString(),
        e.thresholdStock.toString(),
        e.status,
        e.stockSource.isNotEmpty
            ? e.stockSource
            : (e.isPreferredVendor ? 'Azyaa' : 'Designer'),
        e.updatedAt != null
            ? DateFormat('yyyy-MM-dd HH:mm').format(e.updatedAt!)
            : '',
      ]);
    }
    return rows;
  }

  Future<void> _exportInventoryCsv(List<InventoryRecord> inventory) async {
    final rows = _inventoryExportRows(inventory);
    final buffer = StringBuffer('\uFEFF');
    for (final row in rows) {
      buffer.writeln(
        row.map((cell) => '"${cell.replaceAll('"', '""')}"').join(','),
      );
    }
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    _downloadBytes(
      Uint8List.fromList(utf8.encode(buffer.toString())),
      'inventory_$timestamp.csv',
      'text/csv;charset=utf-8',
    );
  }

  Future<void> _exportInventoryExcel(List<InventoryRecord> inventory) async {
    final rows = _inventoryExportRows(inventory);
    final workbook = Workbook();
    final sheet = workbook.worksheets[0];
    for (var r = 0; r < rows.length; r++) {
      for (var c = 0; c < rows[r].length; c++) {
        final range = sheet.getRangeByIndex(r + 1, c + 1);
        if (r > 0 && (c == 3 || c == 4 || c == 5)) {
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
      'inventory_$timestamp.xlsx',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    );
  }

  Future<void> _runExport(
    List<InventoryRecord> inventory,
    Future<void> Function(List<InventoryRecord>) exporter,
  ) async {
    if (inventory.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No records to export')),
      );
      return;
    }
    safeSetState(() => _isExporting = true);
    try {
      await exporter(inventory);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Exported ${inventory.length} records'),
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

  void _showInventoryExportOptions(List<InventoryRecord> inventory) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            'Export Inventory',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  '${inventory.length} records (current filters)',
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
                  _runExport(inventory, _exportInventoryExcel);
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
                  _runExport(inventory, _exportInventoryCsv);
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

  Widget _wrapInventoryScrollTable({
    required List<InventoryRecord> fullList,
    required Widget Function(List<InventoryRecord> windowed) builder,
    required Widget emptyWidget,
  }) {
    if (fullList.isEmpty) return emptyWidget;
    final windowed = fullList.take(_model.visibleCount).toList();
    final hasMore = fullList.length > windowed.length;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (hasMore &&
            !_isLoadingMore &&
            _model.visibleCount < fullList.length &&
            notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 300) {
          safeSetState(() => _isLoadingMore = true);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              safeSetState(() {
                _model.visibleCount =
                    (_model.visibleCount + InventoryPMModel.loadMoreStep)
                        .clamp(0, fullList.length);
                _isLoadingMore = false;
              });
            }
          });
        }
        return false;
      },
      child: builder(windowed),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Inventory-PM',
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
                                  menuname: 'Product Management',
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<List<InventoryRecord>>(
                                    stream: queryInventoryRecord(
                                      queryBuilder: (inventoryRecord) =>
                                          inventoryRecord.where(
                                        'product_type',
                                        isEqualTo: 'ready',
                                      ),
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
                                      List<InventoryRecord>
                                          inventorInventoryRecordList =
                                          snapshot.data!
                                              .where((e) =>
                                                  _model.designerFilterId ==
                                                      null ||
                                                  _model.designerFilterId!
                                                      .isEmpty ||
                                                  e.designerUid ==
                                                      _model.designerFilterId)
                                              .where((e) =>
                                                  orderMatchesDateFilter(
                                                    e.updatedAt,
                                                    _model.dateFilter,
                                                    _model.customRangeStart,
                                                    _model.customRangeEnd,
                                                  ))
                                              .toList();
                                      final mainFilteredInventory =
                                          _buildMainFilteredInventory(
                                              snapshot.data!);

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
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
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
                                                                      .all(4.0),
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
                                                              'q7trc2eg' /* Product Management */,
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
                                                                  color: FFAppState()
                                                                      .theme
                                                                      .themeMain
                                                                      .primary,
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
                                                        'z4runll2' /* Export */,
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
                                                        'atgxkj6g' /* Import */,
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
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            AddInventoryEntryWidget
                                                                .routeName);
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'gth7jzlb' /*  Add Inventory */,
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
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<
                                                      InventorymovementlogRecord>>(
                                                stream:
                                                    queryInventorymovementlogRecord(
                                                  queryBuilder:
                                                      (inventorymovementlogRecord) =>
                                                          inventorymovementlogRecord
                                                              .orderBy(
                                                                  'update_at',
                                                                  descending:
                                                                      true),
                                                  limit: 150,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
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
                                                  List<InventorymovementlogRecord>
                                                      containerInventorymovementlogRecordList =
                                                      snapshot.data!;

                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<ProductsRecord>>(
                                                        stream:
                                                            queryProductsRecord(
                                                          queryBuilder:
                                                              (productsRecord) =>
                                                                  productsRecord
                                                                      .where(
                                                            'product.product_type',
                                                            isEqualTo: 'ready',
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
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
                                                          List<ProductsRecord>
                                                              listProductsRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                AzyaaListToolbar(
                                                                  leftControl:
                                                                      Row(
                                                                    children: [
                                                                      _buildInventoryStatusDropdown(),
                                                                      if (FFAppState()
                                                                              .currentUserRoleKey !=
                                                                          'designer') ...[
                                                                        const SizedBox(
                                                                            width:
                                                                                12.0),
                                                                        _buildInventoryDesignerDropdown(),
                                                                      ],
                                                                    ],
                                                                  ),
                                                                  searchField:
                                                                      _buildInventorySearchField(),
                                                                  showingText:
                                                                      'Showing ${_model.visibleCount.clamp(0, mainFilteredInventory.length)} of ${mainFilteredInventory.length}',
                                                                  trailingActions: [
                                                                    AzyaaToolbarButtons.export(
                                                                      context: context,
                                                                      onPressed: _isExporting
                                                                          ? null
                                                                          : () => _showInventoryExportOptions(
                                                                                mainFilteredInventory,
                                                                              ),
                                                                      isExporting: _isExporting,
                                                                    ),
                                                                    _buildInventorySortDropdown(),
                                                                  ],
                                                                  extraTrailing: [
                                                                    if ((_model.dateFilter == 'Custom') &&
                                                                        (_model.customRangeStart != null) &&
                                                                        (_model.customRangeEnd != null))
                                                                      Text(
                                                                        '${DateFormat('MMM d').format(_model.customRangeStart!)} - ${DateFormat('MMM d').format(_model.customRangeEnd!)}',
                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                              font: GoogleFonts.inter(),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    if (_hasActiveInventoryFilters)
                                                                      AzyaaToolbarButtons.reset(
                                                                        context: context,
                                                                        onPressed: _resetAllInventoryFilters,
                                                                      ),
                                                                    if (responsiveVisibility(
                                                                      context: context,
                                                                      phone: false,
                                                                      tablet: false,
                                                                      tabletLandscape: false,
                                                                      desktop: false,
                                                                    ))
                                                                      FlutterFlowIconButton(
                                                                        borderColor: FlutterFlowTheme.of(context).buttonBorder,
                                                                        borderRadius: 8.0,
                                                                        buttonSize: 40.0,
                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                        icon: Icon(
                                                                          Icons.format_list_bulleted,
                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                          size: 24.0,
                                                                        ),
                                                                        onPressed: () {
                                                                          _model.styleName = _model.styleName == 'List' ? 'Grid' : 'List';
                                                                          safeSetState(() {});
                                                                        },
                                                                      ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                  ),
                                                                ),
                                                                if ((FFAppState()
                                                                            .currentUserRoleKey ==
                                                                        'super_admin') &&
                                                                    (_isAllStatusChip ||
                                                                        ((_model.choiceChipsValue ==
                                                                                'Stock Managed by Azyaa') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'الأسهم التي تديرها Azyaa')) ||
                                                                        ((_model.choiceChipsValue ==
                                                                                'Stock Managed by Designer') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'الأسهم التي يديرها المصمم')) ||
                                                                        ((_model.choiceChipsValue ==
                                                                                'Active') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'نشيط')) ||
                                                                        ((_model.choiceChipsValue ==
                                                                                'Inactive') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'غير نشط'))))
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(12.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible: (FFAppState().currentUserRoleKey ==
                                                                                'super_admin') &&
                                                                            (_isAllStatusChip ||
                                                                                ((_model.choiceChipsValue == 'Stock Managed by Azyaa') || (_model.choiceChipsValue == 'الأسهم التي تديرها Azyaa')) ||
                                                                                ((_model.choiceChipsValue == 'Stock Managed by Designer') || (_model.choiceChipsValue == 'الأسهم التي يديرها المصمم')) ||
                                                                                ((_model.choiceChipsValue == 'Active') || (_model.choiceChipsValue == 'نشيط')) ||
                                                                                ((_model.choiceChipsValue == 'Inactive') || (_model.choiceChipsValue == 'غير نشط'))),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final inventoryList = (_model.searchStatus == 'Show'
                                                                                        ? _model.algoliaSearchResults
                                                                                            ?.where((e) => () {
                                                                                                  if ((_model.choiceChipsValue == 'Stock Managed by Azyaa') || (_model.choiceChipsValue == 'الأسهم التي تديرها Azyaa')) {
                                                                                                    return (e.isPreferredVendor == true);
                                                                                                  } else if ((_model.choiceChipsValue == 'Stock Managed by Designer') || (_model.choiceChipsValue == 'الأسهم التي يديرها المصمم')) {
                                                                                                    return (e.isPreferredVendor == false);
                                                                                                  } else if ((_model.choiceChipsValue == 'Inactive') || (_model.choiceChipsValue == 'غير نشط')) {
                                                                                                    return ((e.isPreferredVendor == true) && (e.status != 'active'));
                                                                                                  } else if ((_model.choiceChipsValue == 'Active') || (_model.choiceChipsValue == 'نشيط')) {
                                                                                                    return ((e.isPreferredVendor == true) && (e.status == 'active'));
                                                                                                  } else {
                                                                                                    return true;
                                                                                                  }
                                                                                                }())
                                                                                            .toList()
                                                                                            .sortedList(keyOf: (e) => e.updatedAt!, desc: true)
                                                                                        : inventorInventoryRecordList
                                                                                            .where((e) => () {
                                                                                                  if ((_model.choiceChipsValue == 'Stock Managed by Azyaa') || (_model.choiceChipsValue == 'الأسهم التي تديرها Azyaa')) {
                                                                                                    return (e.isPreferredVendor == true);
                                                                                                  } else if ((_model.choiceChipsValue == 'Stock Managed by Designer') || (_model.choiceChipsValue == 'الأسهم التي يديرها المصمم')) {
                                                                                                    return (e.isPreferredVendor == false);
                                                                                                  } else if ((_model.choiceChipsValue == 'Active') || (_model.choiceChipsValue == 'نشيط')) {
                                                                                                    return ((e.isPreferredVendor == true) && (e.status == 'active'));
                                                                                                  } else if ((_model.choiceChipsValue == 'Inactive') || (_model.choiceChipsValue == 'غير نشط')) {
                                                                                                    return ((e.isPreferredVendor == true) && (e.status != 'active'));
                                                                                                  } else {
                                                                                                    return true;
                                                                                                  }
                                                                                                }())
                                                                                            .toList()
                                                                                            .sortedList(keyOf: (e) => e.updatedAt!, desc: true))
                                                                                    ?.toList() ??
                                                                                [];
                                                                            return _wrapInventoryScrollTable(
                                                                              fullList: inventoryList,
                                                                              emptyWidget: EmptyWidget(
                                                                                messageOne: FFLocalizations.of(context).getText(
                                                                                  'mq6wltza' /* Your product shelf is still wa... */,
                                                                                ),
                                                                                messageTwo: FFLocalizations.of(context).getText(
                                                                                  '2ylt5c3u' /* Manage all your listings here ... */,
                                                                                ),
                                                                              ),
                                                                              builder: (windowedInventoryList) =>
                                                                                  FlutterFlowDataTable<InventoryRecord>(
                                                                              controller: _model.paginatedDataTableController1,
                                                                              data: windowedInventoryList,
                                                                              columnsBuilder: (onSortChanged) => [
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 50.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'r50ze8v6' /*           */,
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
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'wdd5oa0l' /* Product */,
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
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '88e0uylo' /* Product ID */,
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
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'vr63g1xi' /* ETA */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF616161),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 16.0)),
                                                                                    ),
                                                                                  ),
                                                                                  fixedWidth: 380.0,
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'qdbc5fjv' /* Stock Source */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '7yl1g5xn' /* Total stock */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'w6b9j8k5' /* Available */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'fc1euzdq' /* Stock In-hand */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'qoj8iyi7' /* Committed */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '4wyiru4i' /* Unavailable */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '2zk6vyeu' /* Alert Threshold */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '9s2w9hya' /* Current Status */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                              dataRowBuilder: (inventoryListItem, inventoryListIndex, selected, onSelectChanged) => DataRow(
                                                                                cells: [
                                                                                  Container(
                                                                                    width: 380.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 50.0,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            border: Border.all(
                                                                                              color: Colors.transparent,
                                                                                            ),
                                                                                          ),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            child: Image.network(
                                                                                              getCORSProxyUrl(
                                                                                                valueOrDefault<String>(
                                                                                                  listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfo.galleryImage.firstOrNull,
                                                                                                  ' https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/91d1v7uc478g/Vector.png',
                                                                                                ),
                                                                                              ),
                                                                                              width: 40.0,
                                                                                              height: 40.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  context.pushNamed(
                                                                                                    InventoryProductViewWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'inventoryReference': serializeParam(
                                                                                                        inventoryListItem.reference,
                                                                                                        ParamType.DocumentReference,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                },
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    FFLocalizations.of(context).getVariableText(
                                                                                                      enText: valueOrDefault<String>(
                                                                                                        () {
                                                                                                          if (listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.en != '') {
                                                                                                            return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.en;
                                                                                                          } else if (listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoTranslate.name.en != '') {
                                                                                                            return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoTranslate.name.en;
                                                                                                          } else {
                                                                                                            return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfo.name;
                                                                                                          }
                                                                                                        }(),
                                                                                                        '-',
                                                                                                      ),
                                                                                                      arText: () {
                                                                                                        if (listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.ar != '') {
                                                                                                          return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.ar;
                                                                                                        } else if (listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoTranslate.name.ar != '') {
                                                                                                          return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoTranslate.name.ar;
                                                                                                        } else {
                                                                                                          return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfo.name;
                                                                                                        }
                                                                                                      }(),
                                                                                                    ),
                                                                                                    '-',
                                                                                                  ),
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        decoration: TextDecoration.underline,
                                                                                                        lineHeight: 1.5,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                phone: false,
                                                                                                tablet: false,
                                                                                                tabletLandscape: false,
                                                                                                desktop: false,
                                                                                              ))
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).background,
                                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'j97a3z04' /* White / XS  */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ].divide(SizedBox(height: 6.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productId,
                                                                                              ' -',
                                                                                            ),
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            width: 100.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              '${inventoryListItem.shippedNumberDays.toString()} Days',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 16.0)),
                                                                                    ),
                                                                                  ),
                                                                                  SelectionArea(
                                                                                      child: Text(
                                                                                    inventoryListItem.stockSource,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  )),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      (inventoryListItem.stockOnHand + inventoryListItem.stockUnavailable).toString(),
                                                                                      '-',
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
                                                                                  Text(
                                                                                    ((int var1) {
                                                                                      return (var1) < 0 ? 0 : (var1);
                                                                                    }(inventoryListItem.stock))
                                                                                        .toString(),
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
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      inventoryListItem.stockOnHand.toString(),
                                                                                      '-',
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
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      inventoryListItem.stockReserved.toString(),
                                                                                      '-',
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
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      inventoryListItem.stockUnavailable.toString(),
                                                                                      '-',
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
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: Text(
                                                                                            inventoryListItem.thresholdStock.toString(),
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
                                                                                      if ((_model.choiceChipsValue == 'Stock Managed by Azyaa') || (_model.choiceChipsValue == 'الأسهم التي تديرها Azyaa'))
                                                                                        Expanded(
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Builder(
                                                                                              builder: (context) => InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await showAlignedDialog(
                                                                                                    barrierColor: Color(0x7B000000),
                                                                                                    context: context,
                                                                                                    isGlobal: false,
                                                                                                    avoidOverflow: false,
                                                                                                    targetAnchor: AlignmentDirectional(-20.0, 10.0).resolve(Directionality.of(context)),
                                                                                                    followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    builder: (dialogContext) {
                                                                                                      return Material(
                                                                                                        color: Colors.transparent,
                                                                                                        child: WebViewAware(
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: AdjustAlertThresholdWidget(
                                                                                                              product: inventoryListItem.productRef!,
                                                                                                              type: 'default',
                                                                                                              inventoryRef: inventoryListItem.reference,
                                                                                                              alertValue: inventoryListItem.thresholdStock,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                child: FaIcon(
                                                                                                  FontAwesomeIcons.listUl,
                                                                                                  color: FFAppState().theme.themeMain.primaryText,
                                                                                                  size: 18.0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (inventoryListItem.stock > inventoryListItem.thresholdStock)
                                                                                        Wrap(
                                                                                          spacing: 0.0,
                                                                                          runSpacing: 0.0,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.check_circle_outline,
                                                                                              color: FlutterFlowTheme.of(context).success,
                                                                                              size: 18.0,
                                                                                            ),
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '0ye1oxkf' /*  In Stock */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    lineHeight: 1.5,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      if (inventoryListItem.thresholdStock >= inventoryListItem.stock)
                                                                                        Wrap(
                                                                                          spacing: 0.0,
                                                                                          runSpacing: 0.0,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.report_outlined,
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              size: 18.0,
                                                                                            ),
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '9a7ebw92' /*  Low Stock */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    lineHeight: 1.5,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                  ),
                                                                                ].map((c) => DataCell(c)).toList(),
                                                                              ),
                                                                              emptyBuilder: () => EmptyWidget(
                                                                                messageOne: FFLocalizations.of(context).getText(
                                                                                  'mq6wltza' /* Your product shelf is still wa... */,
                                                                                ),
                                                                                messageTwo: FFLocalizations.of(context).getText(
                                                                                  '2ylt5c3u' /* Manage all your listings here ... */,
                                                                                ),
                                                                              ),
                                                                              paginated: true,
                                                                              selectable: false,
                                                                              hidePaginator: false,
                                                                              showFirstLastButtons: true,
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              headingRowHeight: 40.0,
                                                                              dataRowHeight: 60.0,
                                                                              columnSpacing: 16.0,
                                                                              headingRowColor: FlutterFlowTheme.of(context).secondary,
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              addHorizontalDivider: true,
                                                                              addTopAndBottomDivider: true,
                                                                              hideDefaultHorizontalDivider: false,
                                                                              horizontalDividerColor: FlutterFlowTheme.of(context).border,
                                                                              horizontalDividerThickness: 1.0,
                                                                              addVerticalDivider: false,
                                                                            ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((FFAppState()
                                                                            .currentUserRoleKey !=
                                                                        'designer') &&
                                                                    ((_model.choiceChipsValue ==
                                                                            'Low Stock Alert') ||
                                                                        (_model.choiceChipsValue ==
                                                                            'تنبيه انخفاض المخزون')))
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(12.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final lowstockList =
                                                                              (_model.searchStatus == 'Show' ? _model.algoliaSearchResults?.where((e) => (e.thresholdStock >= e.stockOnHand) && ((e.isPreferredVendor == true) && (e.status == 'active'))).toList().sortedList(keyOf: (e) => e.updatedAt!, desc: true) : inventorInventoryRecordList.where((e) => (e.thresholdStock >= e.stock) && ((e.isPreferredVendor == true) && (e.status == 'active'))).toList().sortedList(keyOf: (e) => e.updatedAt!, desc: true))?.toList() ?? [];
                                                                          return _wrapInventoryScrollTable(
                                                                            fullList: lowstockList,
                                                                            emptyWidget: EmptyWidget(

                                                                              messageOne: FFLocalizations.of(context).getText(
                                                                                'vxnyx5ar' /* Nothing Here Yet */,
                                                                              ),
                                                                              messageTwo: FFLocalizations.of(context).getText(
                                                                                'nvu0r46m' /* Looks like we couldn’t find an... */,
                                                                              ),),
                                                                            builder: (windowedLowstockList) =>
                                                                                FlutterFlowDataTable<
                                                                              InventoryRecord>(
                                                                            controller:
                                                                                _model.paginatedDataTableController2,
                                                                            data:
                                                                                windowedLowstockList,
                                                                            columnsBuilder: (onSortChanged) =>
                                                                                [
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 50.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'vruxnxkk' /*           */,
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
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'xu2c04ma' /* Product */,
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
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '3p7j3adl' /* SKU */,
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
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'uw1op1g0' /* ETA */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF616161),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 16.0)),
                                                                                  ),
                                                                                ),
                                                                                fixedWidth: 390.0,
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'bpp307ft' /* Alert Threshold */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'u364qiue' /* Stock Source */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'kq5twnwk' /* Stock In-hand */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'jnkrawmx' /* Current Status */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      't5dnzsfd' /*   */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                fixedWidth: 200.0,
                                                                              ),
                                                                            ],
                                                                            dataRowBuilder: (lowstockListItem, lowstockListIndex, selected, onSelectChanged) =>
                                                                                DataRow(
                                                                              cells: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 50.0,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: Colors.transparent,
                                                                                        ),
                                                                                      ),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          getCORSProxyUrl(
                                                                                            valueOrDefault<String>(
                                                                                              listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfo.galleryImage.firstOrNull,
                                                                                              ' https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/vko5cesuwirn/Frame_2087324869.jpg',
                                                                                            ),
                                                                                          ),
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getVariableText(
                                                                                              enText: () {
                                                                                                if (listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.en != '') {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.en;
                                                                                                } else if (listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoTranslate.name.en != '') {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoTranslate.name.en;
                                                                                                } else {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfo.name;
                                                                                                }
                                                                                              }(),
                                                                                              arText: () {
                                                                                                if (listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.ar != '') {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.ar;
                                                                                                } else if (listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoTranslate.name.ar != '') {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoTranslate.name.ar;
                                                                                                } else {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfo.name;
                                                                                                }
                                                                                              }(),
                                                                                            ),
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  lineHeight: 1.5,
                                                                                                ),
                                                                                          ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                            desktop: false,
                                                                                          ))
                                                                                            Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).background,
                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'ehcc82wm' /* White / XS  */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ].divide(SizedBox(height: 6.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: SelectionArea(
                                                                                          child: Text(
                                                                                        listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull!.productId,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      )),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          '${lowstockListItem.shippedNumberDays.toString()}${FFLocalizations.of(context).getVariableText(
                                                                                            enText: 'Days',
                                                                                            arText: 'أيام',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 16.0)),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    lowstockListItem.thresholdStock.toString(),
                                                                                    '-',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                SelectionArea(
                                                                                    child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '4n0ivwol' /* Azyaa Stock */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                )),
                                                                                Text(
                                                                                  lowstockListItem.stockOnHand.toString(),
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
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.report_outlined,
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '367hyaos' /*  Low Stock */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 4.0)),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (lowstockListItem.restockRequestRaisedRef == null)
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          _model.idmapResult = await queryIdMapRecordOnce(
                                                                                            queryBuilder: (idMapRecord) => idMapRecord.where(
                                                                                              'type',
                                                                                              isEqualTo: 'Main',
                                                                                            ),
                                                                                            singleRecord: true,
                                                                                          ).then((s) => s.firstOrNull);

                                                                                          await NotificationRecord.collection.doc().set(createNotificationRecordData(
                                                                                                notificationId: _model.idmapResult?.notificationId.toString(),
                                                                                                createdAt: getCurrentTimestamp,
                                                                                                updatedAt: getCurrentTimestamp,
                                                                                                notificationType: 'inventory',
                                                                                                messageType: 'LOW_STOCK_ALERT',
                                                                                                message: 'Low stock alert for product \"${listProductsRecordList.where((e) => e.productId == lowstockListItem.productId).toList().firstOrNull?.productInfo.name}\" || \"${lowstockListItem.productId}\". Current stock (${lowstockListItem.stock.toString()}) has reached or fallen below the threshold (${lowstockListItem.thresholdStock.toString()}). Please prepare fresh stock to refill the inventory as soon as possible.',
                                                                                                toUserRef: listProductsRecordList.where((e) => e.productId == lowstockListItem.productId).toList().firstOrNull?.productAuthorizer.productDesignerRef,
                                                                                                sentFrom: 'admin',
                                                                                                markAsRead: false,
                                                                                              ));

                                                                                          await _model.idmapResult!.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'notification_id': FieldValue.increment(1),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Notified to Designer',
                                                                                                style: GoogleFonts.inter(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'dx0j8olq' /* Notify Designer */,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 30.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 1.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    if ((lowstockListItem.restockRequestRaisedRef != null) && (containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId == null || containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId == ''))
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          await lowstockListItem.restockRequestRaisedRef!.update(createInventorymovementlogRecordData(
                                                                                            updateAt: getCurrentTimestamp,
                                                                                            deliveryRetry: true,
                                                                                          ));
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          '9k776o45' /* Restock request raised */,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 30.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 1.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    if ((lowstockListItem.restockRequestRaisedRef != null) && (containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId != null && containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId != ''))
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        'Tracking ID: ${containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      )),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                              ].map((c) => DataCell(c)).toList(),
                                                                            ),
                                                                            emptyBuilder: () =>
                                                                                EmptyWidget(
                                                                              messageOne: FFLocalizations.of(context).getText(
                                                                                'vxnyx5ar' /* Nothing Here Yet */,
                                                                              ),
                                                                              messageTwo: FFLocalizations.of(context).getText(
                                                                                'nvu0r46m' /* Looks like we couldn’t find an... */,
                                                                              ),
                                                                            ),
                                                                            paginated:
                                                                                true,
                                                                            selectable:
                                                                                false,
                                                                            hidePaginator:
                                                                                false,
                                                                            showFirstLastButtons:
                                                                                true,
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            headingRowHeight:
                                                                                40.0,
                                                                            dataRowHeight:
                                                                                60.0,
                                                                            columnSpacing:
                                                                                16.0,
                                                                            headingRowColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            addHorizontalDivider:
                                                                                true,
                                                                            addTopAndBottomDivider:
                                                                                true,
                                                                            hideDefaultHorizontalDivider:
                                                                                false,
                                                                            horizontalDividerColor:
                                                                                FlutterFlowTheme.of(context).border,
                                                                            horizontalDividerThickness:
                                                                                1.0,
                                                                            addVerticalDivider:
                                                                                false,
                                                                          ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((FFAppState()
                                                                            .currentUserRoleKey ==
                                                                        'designer') &&
                                                                    (_isAllStatusChip ||
                                                                        ((_model.choiceChipsValue ==
                                                                                'Stock Managed by Azyaa') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'الأسهم التي تديرها Azyaa')) ||
                                                                        ((_model.choiceChipsValue ==
                                                                                'Stock Managed by Designer') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'الأسهم التي يديرها المصمم')) ||
                                                                        ((_model.choiceChipsValue ==
                                                                                'Active') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'نشيط')) ||
                                                                        ((_model.choiceChipsValue ==
                                                                                'Inactive') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'غير نشط'))))
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(12.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final inventoryList = (_model.searchStatus == 'Show'
                                                                                      ? _model.algoliaSearchResults
                                                                                          ?.where((e) => () {
                                                                                                if ((_model.choiceChipsValue == 'Active') || (_model.choiceChipsValue == 'نشيط')) {
                                                                                                  return ((e.designerUid == currentUserUid) && (e.isPreferredVendor == true) && (e.status == 'active'));
                                                                                                } else if ((_model.choiceChipsValue == 'Inactive') || (_model.choiceChipsValue == 'غير نشط')) {
                                                                                                  return ((e.designerUid == currentUserUid) && (e.isPreferredVendor == true) && (e.status != 'active'));
                                                                                                } else {
                                                                                                  return false;
                                                                                                }
                                                                                              }())
                                                                                          .toList()
                                                                                          .sortedList(keyOf: (e) => e.updatedAt!, desc: true)
                                                                                      : inventorInventoryRecordList
                                                                                          .where((e) => () {
                                                                                                if ((_model.choiceChipsValue == 'Active') || (_model.choiceChipsValue == 'نشيط')) {
                                                                                                  return ((e.designerUid == currentUserUid) && (e.isPreferredVendor == true) && (e.status == 'active'));
                                                                                                } else if ((_model.choiceChipsValue == 'Inactive') || (_model.choiceChipsValue == 'غير نشط')) {
                                                                                                  return ((e.designerUid == currentUserUid) && (e.isPreferredVendor == true) && (e.status != 'active'));
                                                                                                } else {
                                                                                                  return ((e.designerUid == currentUserUid) && (e.isPreferredVendor == true));
                                                                                                }
                                                                                              }())
                                                                                          .toList()
                                                                                          .sortedList(keyOf: (e) => e.updatedAt!, desc: true))
                                                                                  ?.toList() ??
                                                                              [];
                                                                          return _wrapInventoryScrollTable(
                                                                            fullList: inventoryList,
                                                                            emptyWidget: EmptyWidget(

                                                                              messageOne: FFLocalizations.of(context).getText(
                                                                                '8ym347io' /* Oops! Nothing Here */,
                                                                              ),
                                                                              messageTwo: FFLocalizations.of(context).getText(
                                                                                'gduu3xqj' /* We couldn’t retrieve any data ... */,
                                                                              ),),
                                                                            builder: (windowedInventoryList) =>
                                                                                FlutterFlowDataTable<
                                                                              InventoryRecord>(
                                                                            controller:
                                                                                _model.paginatedDataTableController3,
                                                                            data:
                                                                                windowedInventoryList,
                                                                            columnsBuilder: (onSortChanged) =>
                                                                                [
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 50.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '8m8l3ulv' /*           */,
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
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'brv492k5' /* Product */,
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
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '3mz23le5' /* SKU */,
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
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'azw5xgdr' /* ETA */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                                color: Color(0xFF616161),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 16.0)),
                                                                                  ),
                                                                                ),
                                                                                fixedWidth: 380.0,
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'on2if2lt' /* Available */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'lnkjgnjq' /* Stock In-hand */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '86oak1lf' /* Committed */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'dmys6iaz' /* Alert Threshold */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'ezq1qbgx' /* Current Status */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                            dataRowBuilder: (inventoryListItem, inventoryListIndex, selected, onSelectChanged) =>
                                                                                DataRow(
                                                                              cells: [
                                                                                Container(
                                                                                  width: 380.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: Colors.transparent,
                                                                                          ),
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          child: Image.network(
                                                                                            getCORSProxyUrl(
                                                                                              valueOrDefault<String>(
                                                                                                listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfo.galleryImage.firstOrNull,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/91d1v7uc478g/Vector.png',
                                                                                              ),
                                                                                            ),
                                                                                            width: 40.0,
                                                                                            height: 40.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                context.pushNamed(
                                                                                                  InventoryProductViewWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'inventoryReference': serializeParam(
                                                                                                      inventoryListItem.reference,
                                                                                                      ParamType.DocumentReference,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              },
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getVariableText(
                                                                                                  enText: () {
                                                                                                    if (listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.en != '') {
                                                                                                      return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.en;
                                                                                                    } else if (listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoTranslate.name.en != '') {
                                                                                                      return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoTranslate.name.en;
                                                                                                    } else {
                                                                                                      return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfo.name;
                                                                                                    }
                                                                                                  }(),
                                                                                                  arText: () {
                                                                                                    if (listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.ar != '') {
                                                                                                      return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.ar;
                                                                                                    } else if (listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoTranslate.name.ar != '') {
                                                                                                      return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfoTranslate.name.ar;
                                                                                                    } else {
                                                                                                      return listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull?.productInfo.name;
                                                                                                    }
                                                                                                  }(),
                                                                                                ),
                                                                                                maxLines: 2,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      decoration: TextDecoration.underline,
                                                                                                      lineHeight: 1.5,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                              desktop: false,
                                                                                            ))
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).background,
                                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'e1rlji45' /* White / XS  */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ].divide(SizedBox(height: 6.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: SelectionArea(
                                                                                            child: Text(
                                                                                          listProductsRecordList.where((e) => e.product.inventoryRef == inventoryListItem.reference).toList().firstOrNull!.productId,
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().theme.themeMain.primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        )),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            '${inventoryListItem.shippedNumberDays.toString()}${FFLocalizations.of(context).getVariableText(
                                                                                              enText: ' Days',
                                                                                              arText: 'أيام',
                                                                                            )}',
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
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 16.0)),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  inventoryListItem.stock.toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primaryText,
                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        inventoryListItem.stockOnHand.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.primaryText,
                                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    if ((_model.choiceChipsValue == 'Stock Managed by Designer') || (_model.choiceChipsValue == 'الأسهم التي يديرها المصمم'))
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Builder(
                                                                                            builder: (context) => InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await showAlignedDialog(
                                                                                                  barrierColor: Color(0x7B000000),
                                                                                                  context: context,
                                                                                                  isGlobal: false,
                                                                                                  avoidOverflow: false,
                                                                                                  targetAnchor: AlignmentDirectional(-20.0, 10.0).resolve(Directionality.of(context)),
                                                                                                  followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  builder: (dialogContext) {
                                                                                                    return Material(
                                                                                                      color: Colors.transparent,
                                                                                                      child: WebViewAware(
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () {
                                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                                          },
                                                                                                          child: AdjustAlertThresholdWidget(
                                                                                                            product: inventoryListItem.productRef!,
                                                                                                            type: 'total',
                                                                                                            inventoryRef: inventoryListItem.reference,
                                                                                                            alertValue: inventoryListItem.stockOnHand,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.format_list_bulleted_outlined,
                                                                                                color: FFAppState().theme.themeMain.primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    inventoryListItem.stockReserved.toString(),
                                                                                    '-',
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
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            inventoryListItem.thresholdStock.toString(),
                                                                                            '-',
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
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    if ((_model.choiceChipsValue == 'Stock Managed by Designer') || (_model.choiceChipsValue == 'الأسهم التي يديرها المصمم'))
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Builder(
                                                                                            builder: (context) => InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await showAlignedDialog(
                                                                                                  barrierColor: Color(0x7B000000),
                                                                                                  context: context,
                                                                                                  isGlobal: false,
                                                                                                  avoidOverflow: false,
                                                                                                  targetAnchor: AlignmentDirectional(-20.0, 10.0).resolve(Directionality.of(context)),
                                                                                                  followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  builder: (dialogContext) {
                                                                                                    return Material(
                                                                                                      color: Colors.transparent,
                                                                                                      child: WebViewAware(
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () {
                                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                                          },
                                                                                                          child: AdjustAlertThresholdWidget(
                                                                                                            product: inventoryListItem.productRef!,
                                                                                                            type: 'default',
                                                                                                            inventoryRef: inventoryListItem.reference,
                                                                                                            alertValue: inventoryListItem.thresholdStock,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              child: FaIcon(
                                                                                                FontAwesomeIcons.listUl,
                                                                                                color: FFAppState().theme.themeMain.primaryText,
                                                                                                size: 18.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (inventoryListItem.stock > inventoryListItem.thresholdStock)
                                                                                          Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.check_circle_outline,
                                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                                size: 18.0,
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'dmu5m9ae' /*  In Stock */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      lineHeight: 1.5,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        if (inventoryListItem.thresholdStock >= inventoryListItem.stock)
                                                                                          Wrap(
                                                                                            spacing: 0.0,
                                                                                            runSpacing: 0.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.report_outlined,
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                size: 18.0,
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'j0wasexv' /*  Low Stock */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      lineHeight: 1.5,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].map((c) => DataCell(c)).toList(),
                                                                            ),
                                                                            emptyBuilder: () =>
                                                                                EmptyWidget(
                                                                              messageOne: FFLocalizations.of(context).getText(
                                                                                '8ym347io' /* Oops! Nothing Here */,
                                                                              ),
                                                                              messageTwo: FFLocalizations.of(context).getText(
                                                                                'gduu3xqj' /* We couldn’t retrieve any data ... */,
                                                                              ),
                                                                            ),
                                                                            paginated:
                                                                                true,
                                                                            selectable:
                                                                                false,
                                                                            hidePaginator:
                                                                                false,
                                                                            showFirstLastButtons:
                                                                                true,
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            headingRowHeight:
                                                                                40.0,
                                                                            dataRowHeight:
                                                                                60.0,
                                                                            columnSpacing:
                                                                                16.0,
                                                                            headingRowColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            addHorizontalDivider:
                                                                                true,
                                                                            addTopAndBottomDivider:
                                                                                true,
                                                                            hideDefaultHorizontalDivider:
                                                                                false,
                                                                            horizontalDividerColor:
                                                                                FlutterFlowTheme.of(context).border,
                                                                            horizontalDividerThickness:
                                                                                1.0,
                                                                            addVerticalDivider:
                                                                                false,
                                                                          ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((FFAppState()
                                                                            .currentUserRoleKey ==
                                                                        'designer') &&
                                                                    ((_model.choiceChipsValue ==
                                                                            'Low Stock Alert') ||
                                                                        (_model.choiceChipsValue ==
                                                                            'تنبيه انخفاض المخزون')))
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(12.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final lowstockList =
                                                                              (_model.searchStatus == 'Show' ? _model.algoliaSearchResults?.where((e) => (e.thresholdStock >= e.stockOnHand) && (e.isPreferredVendor == true) && (e.designerUid == currentUserUid) && (e.status == 'active')).toList().sortedList(keyOf: (e) => e.updatedAt!, desc: true) : inventorInventoryRecordList.where((e) => (e.thresholdStock >= e.stock) && (e.isPreferredVendor == true) && (e.designerUid == currentUserUid) && (e.status == 'active')).toList().sortedList(keyOf: (e) => e.updatedAt!, desc: true))?.toList() ?? [];
                                                                          return _wrapInventoryScrollTable(
                                                                            fullList: lowstockList,
                                                                            emptyWidget: EmptyWidget(

                                                                              messageOne: FFLocalizations.of(context).getText(
                                                                                'ebhn16j3' /* Some items are running low! */,
                                                                              ),
                                                                              messageTwo: FFLocalizations.of(context).getText(
                                                                                'qczu3dwt' /* Keep an eye on these products—... */,
                                                                              ),),
                                                                            builder: (windowedLowstockList) =>
                                                                                FlutterFlowDataTable<
                                                                              InventoryRecord>(
                                                                            controller:
                                                                                _model.paginatedDataTableController4,
                                                                            data:
                                                                                windowedLowstockList,
                                                                            columnsBuilder: (onSortChanged) =>
                                                                                [
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 50.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'xthcd2eq' /*           */,
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
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'mb0dsd28' /* Product */,
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
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'u6zo599a' /* SKU */,
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
                                                                                      if (responsiveVisibility(
                                                                                        context: context,
                                                                                        phone: false,
                                                                                        tablet: false,
                                                                                        tabletLandscape: false,
                                                                                        desktop: false,
                                                                                      ))
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            width: 100.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'v3qo7jvo' /* ETA */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF616161),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ].divide(SizedBox(width: 16.0)),
                                                                                  ),
                                                                                ),
                                                                                fixedWidth: 380.0,
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'kg6022by' /* Available */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'cpd42oh8' /* Stock In-hand */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                fixedWidth: 0.0,
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '12wh9ib1' /* Alert Threshold */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'dtqlptcu' /* Current Status */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'l9arx7mi' /*   */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                            dataRowBuilder: (lowstockListItem, lowstockListIndex, selected, onSelectChanged) =>
                                                                                DataRow(
                                                                              cells: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 50.0,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: Colors.transparent,
                                                                                        ),
                                                                                      ),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          getCORSProxyUrl(
                                                                                            valueOrDefault<String>(
                                                                                              listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfo.galleryImage.firstOrNull,
                                                                                              ' https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/vko5cesuwirn/Frame_2087324869.jpg',
                                                                                            ),
                                                                                          ),
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getVariableText(
                                                                                              enText: () {
                                                                                                if (listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.en != '') {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.en;
                                                                                                } else if (listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoTranslate.name.en != '') {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoTranslate.name.en;
                                                                                                } else {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfo.name;
                                                                                                }
                                                                                              }(),
                                                                                              arText: () {
                                                                                                if (listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.ar != '') {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoCustomTranslate.name.ar;
                                                                                                } else if (listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoTranslate.name.ar != '') {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfoTranslate.name.ar;
                                                                                                } else {
                                                                                                  return listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull?.productInfo.name;
                                                                                                }
                                                                                              }(),
                                                                                            ),
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  lineHeight: 1.5,
                                                                                                ),
                                                                                          ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                            desktop: false,
                                                                                          ))
                                                                                            Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).background,
                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'x2f2a8ih' /* White / XS  */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ].divide(SizedBox(height: 6.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: SelectionArea(
                                                                                          child: Text(
                                                                                        listProductsRecordList.where((e) => e.product.inventoryRef == lowstockListItem.reference).toList().firstOrNull!.productId,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      )),
                                                                                    ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                      tabletLandscape: false,
                                                                                      desktop: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            '${lowstockListItem.shippedNumberDays.toString()}${valueOrDefault<String>(
                                                                                              FFLocalizations.of(context).getVariableText(
                                                                                                enText: ' Days',
                                                                                                arText: 'أيام',
                                                                                              ),
                                                                                              ' Days',
                                                                                            )}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 16.0)),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    lowstockListItem.stock.toString(),
                                                                                    '-',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 14.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          lowstockListItem.stockOnHand.toString(),
                                                                                          '0',
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
                                                                                    if ((_model.choiceChipsValue == 'Stock Managed by Designer') &&
                                                                                        responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                          tablet: false,
                                                                                          tabletLandscape: false,
                                                                                          desktop: false,
                                                                                        ))
                                                                                      FaIcon(
                                                                                        FontAwesomeIcons.listUl,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 18.0,
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 14.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          lowstockListItem.thresholdStock.toString(),
                                                                                          '0',
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
                                                                                    if ((_model.choiceChipsValue == 'Stock Managed by Designer') &&
                                                                                        responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                          tablet: false,
                                                                                          tabletLandscape: false,
                                                                                          desktop: false,
                                                                                        ))
                                                                                      FaIcon(
                                                                                        FontAwesomeIcons.listUl,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 18.0,
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.report_outlined,
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ma8xjg6u' /*  Low Stock */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 4.0)),
                                                                                ),
                                                                                Stack(
                                                                                  children: [
                                                                                    if (lowstockListItem.restockRequestRaisedRef == null)
                                                                                      Builder(
                                                                                        builder: (context) => FFButtonWidget(
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
                                                                                                        width: 600.0,
                                                                                                        child: RestockRequestWidget(
                                                                                                          inventoryRef: lowstockListItem.reference,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'jf4fjqj7' /* Raise Collect Request */,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 30.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((lowstockListItem.restockRequestRaisedRef != null) && (containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId == null || containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId == ''))
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          await lowstockListItem.restockRequestRaisedRef!.update(createInventorymovementlogRecordData(
                                                                                            updateAt: getCurrentTimestamp,
                                                                                            deliveryRetry: true,
                                                                                          ));
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'ym3jd0dp' /* Retry Collect Request */,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 30.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).buttonBorder,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    if ((lowstockListItem.restockRequestRaisedRef != null) && (containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId != null && containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId != ''))
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        'Tracking ID: ${containerInventorymovementlogRecordList.where((e) => e.reference == lowstockListItem.restockRequestRaisedRef).toList().firstOrNull?.requestDeliveryInfo.deliveryTrackingId}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      )),
                                                                                  ],
                                                                                ),
                                                                              ].map((c) => DataCell(c)).toList(),
                                                                            ),
                                                                            emptyBuilder: () =>
                                                                                EmptyWidget(
                                                                              messageOne: FFLocalizations.of(context).getText(
                                                                                'ebhn16j3' /* Some items are running low! */,
                                                                              ),
                                                                              messageTwo: FFLocalizations.of(context).getText(
                                                                                'qczu3dwt' /* Keep an eye on these products—... */,
                                                                              ),
                                                                            ),
                                                                            paginated:
                                                                                true,
                                                                            selectable:
                                                                                false,
                                                                            hidePaginator:
                                                                                false,
                                                                            showFirstLastButtons:
                                                                                true,
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            headingRowHeight:
                                                                                40.0,
                                                                            dataRowHeight:
                                                                                60.0,
                                                                            columnSpacing:
                                                                                16.0,
                                                                            headingRowColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            addHorizontalDivider:
                                                                                true,
                                                                            addTopAndBottomDivider:
                                                                                true,
                                                                            hideDefaultHorizontalDivider:
                                                                                false,
                                                                            horizontalDividerColor:
                                                                                FlutterFlowTheme.of(context).border,
                                                                            horizontalDividerThickness:
                                                                                1.0,
                                                                            addVerticalDivider:
                                                                                false,
                                                                          ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
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
