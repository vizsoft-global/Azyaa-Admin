import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/batch_lookup_util.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/component/blank_loading/blank_loading_widget.dart';
import '/phase1/inventory/timeline_for_inventory/timeline_for_inventory_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import '/custom_code/widgets/index.dart';
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
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
import 'orders_model.dart';
export 'orders_model.dart';

/// Returns true if [when] falls inside the range described by [filter].
/// [filter] is one of: All, Today, Yesterday, This Week, This Month, Custom.
bool orderMatchesDateFilter(
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
      // Week starts on Monday.
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

/// Human-readable payment status used in badges and exports.
String orderPaymentStatusLabel(String status) {
  if (status == 'Initialization' || status == 'PENDING') {
    return 'Pending';
  } else if (status == 'CAPTURED') {
    return 'Paid';
  } else if (status == 'FAILED') {
    return 'Failed';
  } else {
    return 'Cancelled';
  }
}

/// Applies the active column sort to [orders] without mutating the input.
List<OrdersRecord> sortOrdersList(
  List<OrdersRecord> orders,
  String sortField,
  bool ascending,
) {
  if (sortField.isEmpty) {
    return orders;
  }
  final sorted = List<OrdersRecord>.from(orders);
  sorted.sort((a, b) {
    int result;
    switch (sortField) {
      case 'items':
        result = a.orderItems.cartItems.length
            .compareTo(b.orderItems.cartItems.length);
        break;
      case 'payment':
        result = orderPaymentStatusLabel(a.paymentStatus)
            .compareTo(orderPaymentStatusLabel(b.paymentStatus));
        break;
      default:
        result = 0;
    }
    return ascending ? result : -result;
  });
  return sorted;
}

/// Replicates the main orders table's status-chip filtering so the same list
/// can be reused for the table, the record count, and exports.
bool orderMatchesChoice(OrdersRecord e, String choice) {
  final isDesigner = FFAppState().currentUserRoleKey == 'designer';
  final designerHasItems =
      e.orderItems.cartItems.where((i) => i.productDesignerId == currentUserUid).isNotEmpty;
  final roleScope = isDesigner ? designerHasItems : true;

  switch (choice) {
    case 'Paid':
      return e.paymentStatus == 'CAPTURED' && roleScope;
    case 'Unpaid':
      return e.paymentStatus != 'CAPTURED' && roleScope;
    case 'Tailoring':
      return e.paymentStatus == 'CAPTURED' &&
          e.orderItems.cartItems
                  .where((i) => i.productMainType == 'custom')
                  .toList()
                  .firstOrNull
                  ?.productPickupInfo
                  .createdAt ==
              null &&
          (isDesigner ? designerHasItems : false) &&
          (e.orderItems.cartItems
                      .where((i) => i.productMainType == 'custom')
                      .isNotEmpty ||
              e.orderItems.cartItems
                  .where((i) => i.productStockInfo.isPreferredVendor == false)
                  .isNotEmpty);
    case 'Ready to Pickup':
      return e.paymentStatus == 'CAPTURED' &&
          e.orderItems.cartItems
                  .where((i) => i.productMainType == 'custom')
                  .toList()
                  .firstOrNull
                  ?.productPickupInfo
                  .status ==
              'Ready to Pickup' &&
          (isDesigner ? designerHasItems : false);
    case 'Picked Up':
      return e.paymentStatus == 'CAPTURED' &&
          e.orderItems.cartItems
                  .where((i) => i.productMainType == 'custom')
                  .toList()
                  .firstOrNull
                  ?.productPickupInfo
                  .status ==
              'Processing' &&
          (isDesigner ? designerHasItems : false);
    default:
      // 'All' and any other value.
      return (e.paymentStatus != '' || e.orderStatus != '') && roleScope;
  }
}

/// Returns true when the order has at least one cart item matching the
/// selected designer and/or product chosen in the Filters dialog.
bool orderMatchesProductFilters(
  OrdersRecord e,
  String? designerId,
  String? productId,
) {
  final hasDesigner = designerId != null && designerId.isNotEmpty;
  final hasProduct = productId != null && productId.isNotEmpty;
  if (!hasDesigner && !hasProduct) {
    return true;
  }
  return e.orderItems.cartItems.any((i) {
    final designerOk = !hasDesigner || i.productDesignerId == designerId;
    final productOk = !hasProduct || i.productId == productId;
    return designerOk && productOk;
  });
}

/// Maps a localized status-filter dropdown label (English or Arabic) to the
/// canonical `_model.choice` value used by the filtering logic.
String ordersChoiceFromLabel(String? label) {
  switch (label) {
    case 'Paid':
    case 'مدفوع':
      return 'Paid';
    case 'Unpaid':
    case 'غير مدفوعة الأجر':
      return 'Unpaid';
    case 'Create Shipping':
    case 'إنشاء الشحن':
      return 'Create Shipping';
    case 'Delivery Ongoing':
    case 'التسليم مستمر':
      return 'Delivery Ongoing';
    case 'Delivered':
    case 'تم التوصيل':
      return 'Delivered';
    case 'Pickup request':
    case 'طلب بيك اب':
    case 'طلب الاستلام':
      return 'Pickup request';
    case 'Tailoring':
    case 'قائد التنفيس':
    case 'قائد الفصل':
      return 'Tailoring';
    case 'Ready to Pickup':
    case 'جاهز للاستلام':
      return 'Ready to Pickup';
    case 'Picked Up':
    case 'تام الاستلام':
      return 'Picked Up';
    default:
      return 'All';
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

Widget buildOrderCustomerNameCell(
  BuildContext context,
  OrdersRecord order,
  Map<String, UsersRecord> customerByRefId, {
  Color? textColor,
}) {
  final ref = order.customerRef;
  if (ref == null) {
    return Text(
      ' -',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            color: textColor ??
                valueOrDefault<Color>(
                  FFAppState().theme.themeMain.primaryText,
                  FlutterFlowTheme.of(context).primaryText,
                ),
            fontSize: 12.0,
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            lineHeight: 1.5,
          ),
    );
  }
  final user = customerByRefId[ref.id];
  if (user == null) {
    return Center(
      child: BlankLoadingWidget(),
    );
  }
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SelectionArea(
        child: Text(
          valueOrDefault<String>(
            user.displayName,
            ' -',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: textColor ??
                    valueOrDefault<Color>(
                      FFAppState().theme.themeMain.primaryText,
                      FlutterFlowTheme.of(context).primaryText,
                    ),
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                lineHeight: 1.5,
              ),
        ),
      ),
    ],
  );
}

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key});

  static String routeName = 'Orders';
  static String routePath = '/azyaa-orders';

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  late OrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentUserPermission.contains(_model.permissionKey) !=
          true) {
        context.goNamed(Error404Widget.routeName);
      }
    });

    _model.serachTextController ??= TextEditingController();
    _model.serachFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  bool _isExporting = false;
  bool _isLoadingMore = false;
  String? _ordersLookupKey;
  Future<OrdersRowLookups>? _ordersLookupFuture;
  String? _ordersSecondaryLookupKey;
  Future<OrdersRowLookups>? _ordersSecondaryLookupFuture;

  Future<OrdersRowLookups> _ordersRowLookupsFuture(
    List<OrdersRecord> orders,
    String choice, {
    required bool secondary,
  }) {
    final key =
        '${orders.map((o) => o.reference.id).join(',')}|$choice|${orders.length}';
    if (secondary) {
      if (_ordersSecondaryLookupKey != key ||
          _ordersSecondaryLookupFuture == null) {
        _ordersSecondaryLookupKey = key;
        _ordersSecondaryLookupFuture = loadOrdersRowLookups(orders, choice);
      }
      return _ordersSecondaryLookupFuture!;
    }
    if (_ordersLookupKey != key || _ordersLookupFuture == null) {
      _ordersLookupKey = key;
      _ordersLookupFuture = loadOrdersRowLookups(orders, choice);
    }
    return _ordersLookupFuture!;
  }

  void _resetOrdersWindow() {
    _model.visibleCount = OrdersModel.initialVisibleCount;
  }

  bool get _hasActiveOrderFilters =>
      _model.choice != 'All' ||
      _model.dateFilter != 'All' ||
      _model.hasProductFilters ||
      _model.sortField.isNotEmpty ||
      _model.searchStatus ||
      (_model.serachTextController?.text.isNotEmpty ?? false);

  void _resetAllOrderFilters() {
    final allLabel =
        FFLocalizations.of(context).languageCode == 'ar' ? 'الجميع' : 'All';
    safeSetState(() {
      _model.choice = 'All';
      _model.statusFilterController?.value = allLabel;
      _model.dateFilter = 'All';
      _model.dateFilterController?.value = null;
      _model.customRangeStart = null;
      _model.customRangeEnd = null;
      _model.sortField = '';
      _model.sortAscending = true;
      _model.filterDesignerId = null;
      _model.filterDesignerName = null;
      _model.filterProductId = null;
      _model.filterProductName = null;
      _model.searchStatus = false;
      _model.serachTextController?.clear();
      _model.algoliaSearchResults = null;
      _resetOrdersWindow();
    });
  }

  Widget _buildOrdersSearchField() {
    return TextFormField(
        controller: _model.serachTextController,
        focusNode: _model.serachFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.serachTextController',
          Duration(milliseconds: 2000),
          () async {
            if (_model.serachTextController.text != '') {
              safeSetState(() => _model.algoliaSearchResults = null);
              await OrdersRecord.search(
                term: _model.serachTextController.text,
              )
                  .then((r) => _model.algoliaSearchResults = r)
                  .onError((_, __) => _model.algoliaSearchResults = [])
                  .whenComplete(() => safeSetState(() {}));

              _model.searchStatus = true;
              safeSetState(() {});
            } else {
              _model.searchStatus = false;
              safeSetState(() {});
            }
          },
        ),
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          isDense: true,
          hintText: FFLocalizations.of(context).getText(
            'mjnbo2xb' /* Search... */,
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
              fontSize: 13.0,
              letterSpacing: 0.0,
            ),
        cursorColor: FFAppState().theme.themeMain.primary,
        validator:
            _model.serachTextControllerValidator.asValidator(context),
    );
  }

  Widget _buildOrdersStatusDropdown() {
    return AzyaaToolbarBox(
      width: 190.0,
      height: 40.0,
      child: FlutterFlowDropDown<String>(
        controller: _model.statusFilterController ??=
            FormFieldController<String>(_model.choice),
        options: () {
          if ((FFAppState().currentUserRoleKey == 'designer') &&
              (FFLocalizations.of(context).languageCode == 'ar')) {
            return _model.designerChoicechipsAR;
          } else if (FFAppState().currentUserRoleKey == 'designer') {
            return _model.designerCChoicechips;
          } else if (FFLocalizations.of(context).languageCode == 'ar') {
            return _model.adminChoicechipsAR;
          } else {
            return _model.adminChoicechips;
          }
        }(),
        onChanged: (val) async {
          _model.choice = ordersChoiceFromLabel(val);
          _resetOrdersWindow();
          safeSetState(() {});
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

  Widget _buildOrdersSortDropdown() {
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
            await _pickCustomDateRange();
          } else {
            safeSetState(() {
              _model.dateFilter = val;
              _resetOrdersWindow();
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

  Future<void> _pickCustomDateRange() async {
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
        _resetOrdersWindow();
      });
    } else if (_model.customRangeStart == null) {
      safeSetState(() {
        _model.dateFilter = 'All';
        _model.dateFilterController?.value = 'All';
      });
    }
  }

  List<List<String>> _ordersExportRows(List<OrdersRecord> orders) {
    final rows = <List<String>>[
      ['Order ID', 'Created At', 'Items', 'Total (KD)', 'Payment Status'],
    ];
    for (final order in orders) {
      rows.add([
        order.orderId,
        DateFormat('yyyy-MM-dd HH:mm')
            .format(order.createdAt ?? DateTime.now()),
        order.orderItems.cartItems.length.toString(),
        (order.totalPrice.toDouble()).toStringAsFixed(2),
        orderPaymentStatusLabel(order.paymentStatus),
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

  Future<void> _exportOrdersCsv(List<OrdersRecord> orders) async {
    final rows = _ordersExportRows(orders);
    final buffer = StringBuffer('\uFEFF');
    for (final row in rows) {
      buffer.writeln(
        row.map((cell) => '"${cell.replaceAll('"', '""')}"').join(','),
      );
    }
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    _downloadBytes(
      Uint8List.fromList(utf8.encode(buffer.toString())),
      'orders_$timestamp.csv',
      'text/csv;charset=utf-8',
    );
  }

  Future<void> _exportOrdersExcel(List<OrdersRecord> orders) async {
    final rows = _ordersExportRows(orders);
    final workbook = Workbook();
    final sheet = workbook.worksheets[0];
    for (var r = 0; r < rows.length; r++) {
      for (var c = 0; c < rows[r].length; c++) {
        final range = sheet.getRangeByIndex(r + 1, c + 1);
        // Items column as number when possible.
        if (r > 0 && c == 2) {
          range.setNumber(double.tryParse(rows[r][c]) ?? 0);
        } else if (r > 0 && c == 3) {
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
      'orders_$timestamp.xlsx',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    );
  }

  Future<void> _runExport(
    List<OrdersRecord> orders,
    Future<void> Function(List<OrdersRecord>) exporter,
  ) async {
    if (orders.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No records to export')),
      );
      return;
    }
    safeSetState(() => _isExporting = true);
    try {
      await exporter(orders);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Exported ${orders.length} orders'),
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

  void _showOrdersExportOptions(List<OrdersRecord> orders) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            'Export Orders',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  '${orders.length} orders (current filters)',
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
                  _runExport(orders, _exportOrdersExcel);
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
                  _runExport(orders, _exportOrdersCsv);
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

  Future<void> _showOrdersFilterDialog(List<OrdersRecord> orders) async {
    final result = await showDialog<OrdersFilterResult>(
      context: context,
      builder: (dialogContext) => AzyaaOrdersFilterDialog(
        orders: orders,
        initialDesignerId: _model.filterDesignerId,
        initialDesignerName: _model.filterDesignerName,
        initialProductId: _model.filterProductId,
        initialProductName: _model.filterProductName,
      ),
    );
    if (result != null) {
      safeSetState(() {
        _model.filterDesignerId = result.designerId;
        _model.filterDesignerName = result.designerName;
        _model.filterProductId = result.productId;
        _model.filterProductName = result.productName;
        _resetOrdersWindow();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Orders',
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
                                  menuname: 'Orders',
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<List<OrdersRecord>>(
                                    stream: queryOrdersRecord(
                                      queryBuilder: (ordersRecord) =>
                                          ordersRecord.orderBy('created_at',
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
                                      List<OrdersRecord>
                                          ordersOrdersRecordList =
                                          snapshot.data!;

                                      final baseOrders = _model.searchStatus ==
                                              true
                                          ? (_model.algoliaSearchResults ??
                                              <OrdersRecord>[])
                                          : ordersOrdersRecordList;
                                      // Choice + date filtered set (without the
                                      // product-scope filter) drives the Filters
                                      // dialog options and its live result count.
                                      final choiceDateFilteredOrders =
                                          baseOrders
                                              .where((e) => orderMatchesChoice(
                                                  e, _model.choice))
                                              .where((e) =>
                                                  orderMatchesDateFilter(
                                                      e.createdAt,
                                                      _model.dateFilter,
                                                      _model.customRangeStart,
                                                      _model.customRangeEnd))
                                              .toList();
                                      final mainFilteredOrders =
                                          sortOrdersList(
                                        choiceDateFilteredOrders
                                            .where((e) =>
                                                orderMatchesProductFilters(
                                                    e,
                                                    _model.filterDesignerId,
                                                    _model.filterProductId))
                                            .toList(),
                                        _model.sortField,
                                        _model.sortAscending,
                                      );

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
                                                              'cadko3fr' /* Orders */,
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
                                                                        .primaryText,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'zqpayald' /* Export */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
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
                                                              Color(0xFFCBCBCB),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFCBCBCB),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 130.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFCBCBCB),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: [
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'uiiyf2vl' /* More Actions */,
                                                            )
                                                          ],
                                                          onChanged: (val) =>
                                                              safeSetState(() =>
                                                                  _model.dropDownValue =
                                                                      val),
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        14.0,
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
                                                            'za2425bn' /* More Actions */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
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
                                                      ),
                                                    ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          FilterordersWidget
                                                              .routeName);
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '2tv7ymec' /* Filterable Orders */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 36.0,
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
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState()
                                                                    .theme
                                                                    .themeMain
                                                                    .primaryButtonTextColor,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .notificatioAlertModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
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
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .border,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        AzyaaListToolbar(
                                                          leftControl:
                                                              _buildOrdersStatusDropdown(),
                                                          searchField:
                                                              _buildOrdersSearchField(),
                                                          showingText:
                                                              'Showing ${_model.visibleCount.clamp(0, mainFilteredOrders.length)} of ${mainFilteredOrders.length}',
                                                          trailingActions: [
                                                            AzyaaToolbarButtons.export(
                                                              context: context,
                                                              onPressed: _isExporting
                                                                  ? null
                                                                  : () => _showOrdersExportOptions(mainFilteredOrders),
                                                              isExporting: _isExporting,
                                                            ),
                                                            _buildOrdersSortDropdown(),
                                                            AzyaaToolbarButtons.filter(
                                                              context: context,
                                                              onPressed: () => _showOrdersFilterDialog(choiceDateFilteredOrders),
                                                              label: _model.hasProductFilters
                                                                  ? 'Filter (${_model.activeProductFilterCount})'
                                                                  : 'Filter',
                                                              active: _model.hasProductFilters,
                                                            ),
                                                          ],
                                                          extraTrailing: [
                                                            if ((_model.dateFilter == 'Custom') && (_model.customRangeStart != null) && (_model.customRangeEnd != null))
                                                              Text(
                                                                '${DateFormat('MMM d').format(_model.customRangeStart!)} - ${DateFormat('MMM d').format(_model.customRangeEnd!)}',
                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                      font: GoogleFonts.inter(),
                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                      letterSpacing: 0.0,
                                                                    ),
                                                              ),
                                                            if (_hasActiveOrderFilters)
                                                              AzyaaToolbarButtons.reset(
                                                                context: context,
                                                                onPressed: _resetAllOrderFilters,
                                                              ),
                                                          ],
                                                        ),
                                                              Offstage(
                                                                offstage: true,
                                                                child:
                                                                    FlutterFlowChoiceChips(
                                                                  options: () {
                                                                    if ((FFAppState().currentUserRoleKey ==
                                                                            'designer') &&
                                                                        (FFLocalizations.of(context).languageCode ==
                                                                            'en')) {
                                                                      return _model
                                                                          .designerCChoicechips;
                                                                    } else if ((FFAppState().currentUserRoleKey ==
                                                                            'designer') &&
                                                                        (FFLocalizations.of(context).languageCode ==
                                                                            'ar')) {
                                                                      return _model
                                                                          .designerChoicechipsAR;
                                                                    } else if ((FFAppState().currentUserRoleKey !=
                                                                            'designer') &&
                                                                        (FFLocalizations.of(context).languageCode ==
                                                                            'en')) {
                                                                      return _model
                                                                          .adminChoicechips;
                                                                    } else if ((FFAppState().currentUserRoleKey !=
                                                                            'designer') &&
                                                                        (FFLocalizations.of(context).languageCode ==
                                                                            'ar')) {
                                                                      return _model
                                                                          .adminChoicechipsAR;
                                                                    } else if (FFAppState()
                                                                            .currentUserRoleKey ==
                                                                        'designer') {
                                                                      return _model
                                                                          .designerCChoicechips;
                                                                    } else {
                                                                      return _model
                                                                          .adminChoicechips;
                                                                    }
                                                                  }()
                                                                      .map((label) =>
                                                                          ChipData(
                                                                              label))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.choiceChipsFilterValue =
                                                                            val?.firstOrNull);
                                                                    if ((_model.choiceChipsFilterValue ==
                                                                            'Unpaid') ||
                                                                        (_model.choiceChipsFilterValue ==
                                                                            'غير مدفوعة الأجر')) {
                                                                      _model.choice =
                                                                          'Unpaid';
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      if ((_model.choiceChipsFilterValue ==
                                                                              'All') ||
                                                                          (_model.choiceChipsFilterValue ==
                                                                              'الجميع')) {
                                                                        _model.choice =
                                                                            'All';
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        if ((_model.choiceChipsFilterValue ==
                                                                                'Paid') ||
                                                                            (_model.choiceChipsFilterValue ==
                                                                                'مدفوع')) {
                                                                          _model.choice =
                                                                              'Paid';
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          if ((_model.choiceChipsFilterValue == 'Delivery Ongoing') ||
                                                                              (_model.choiceChipsFilterValue == 'التسليم مستمر')) {
                                                                            _model.choice =
                                                                                'Delivery Ongoing';
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            if ((_model.choiceChipsFilterValue == 'Pickup request') ||
                                                                                (_model.choiceChipsFilterValue == 'طلب الاستلام')) {
                                                                              _model.choice = 'Pickup request';
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              if ((_model.choiceChipsFilterValue == 'Create Shipping') || (_model.choiceChipsFilterValue == 'إنشاء الشحن')) {
                                                                                _model.choice = 'Create Shipping';
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                if ((_model.choiceChipsFilterValue == 'Delivered') || (_model.choiceChipsFilterValue == 'تم التوصيل')) {
                                                                                  _model.choice = 'Delivered';
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  if ((_model.choiceChipsFilterValue == 'Picked Up') || (_model.choiceChipsFilterValue == 'تام الاستلام')) {
                                                                                    _model.choice = 'Picked Up';
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    if ((_model.choiceChipsFilterValue == 'Ready to Pickup') || (_model.choiceChipsFilterValue == 'جاهز للاستلام')) {
                                                                                      _model.choice = 'Ready to Pickup';
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      if ((_model.choiceChipsFilterValue == 'Tailoring') || (_model.choiceChipsFilterValue == 'قائد الفصل')) {
                                                                                        _model.choice = 'Tailoring';
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        return;
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  },
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
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
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    iconSize:
                                                                        0.0,
                                                                    labelPadding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
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
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    iconSize:
                                                                        0.0,
                                                                    labelPadding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      8.0,
                                                                  rowSpacing:
                                                                      8.0,
                                                                  multiselect:
                                                                      false,
                                                                  initialized:
                                                                      _model.choiceChipsFilterValue !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .choiceChipsFilterValueController ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'lb3j1iik' /* All */,
                                                                      )
                                                                    ],
                                                                  ),
                                                                  wrapped: true,
                                                                ),
                                                              ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .border,
                                                            ),
                                                          ),
                                                        ),
                                                        if ((_model.choice ==
                                                                'All') ||
                                                            (_model.choice ==
                                                                'Paid') ||
                                                            (_model.choice ==
                                                                'Unpaid') ||
                                                            (_model.choice ==
                                                                'Tailoring') ||
                                                            (_model.choice ==
                                                                'Ready to Pickup') ||
                                                            (_model.choice ==
                                                                'Picked Up'))
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                ),
                                                              ),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final orderList =
                                                                      mainFilteredOrders;
                                                                  final windowedOrders =
                                                                      orderList
                                                                          .take(_model
                                                                              .visibleCount)
                                                                          .toList();
                                                                  final hasMore =
                                                                      orderList.length >
                                                                          windowedOrders
                                                                              .length;
                                                                  if (orderList
                                                                      .isEmpty) {
                                                                    return EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'bf0knboq' /* All caught up! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'wlqhmaex' /* There are no pending payments ... */,
                                                                      ),
                                                                    );
                                                                  }

                                                                  return FutureBuilder<
                                                                      OrdersRowLookups>(
                                                                    future:
                                                                        _ordersRowLookupsFuture(
                                                                      windowedOrders,
                                                                      _model.choice,
                                                                      secondary:
                                                                          false,
                                                                    ),
                                                                    builder: (context,
                                                                        lookupSnapshot) {
                                                                      final customerByRefId =
                                                                          lookupSnapshot
                                                                                  .data
                                                                                  ?.customers ??
                                                                              {};
                                                                      return NotificationListener<
                                                                      ScrollNotification>(
                                                                    onNotification:
                                                                        (notification) {
                                                                      if (hasMore &&
                                                                          !_isLoadingMore &&
                                                                          _model.visibleCount <
                                                                              orderList.length &&
                                                                          notification.metrics.pixels >=
                                                                              notification.metrics.maxScrollExtent -
                                                                                  300) {
                                                                        safeSetState(
                                                                            () =>
                                                                                _isLoadingMore =
                                                                                    true);
                                                                        WidgetsBinding
                                                                            .instance
                                                                            .addPostFrameCallback(
                                                                                (_) {
                                                                          if (mounted) {
                                                                            safeSetState(
                                                                                () {
                                                                              _model.visibleCount = (_model.visibleCount +
                                                                                      OrdersModel.loadMoreStep)
                                                                                  .clamp(0, orderList.length);
                                                                              _isLoadingMore =
                                                                                  false;
                                                                            });
                                                                          }
                                                                        });
                                                                      }
                                                                      return false;
                                                                    },
                                                                    child: Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              FlutterFlowDataTable<
                                                                                  OrdersRecord>(
                                                                    controller:
                                                                        _model
                                                                            .paginatedDataTableController1,
                                                                    data:
                                                                        windowedOrders,
                                                                    onSortChanged:
                                                                        (columnIndex,
                                                                            ascending) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.sortField = columnIndex ==
                                                                                3
                                                                            ? 'items'
                                                                            : (columnIndex == 5
                                                                                ? 'payment'
                                                                                : '');
                                                                        _model.sortAscending =
                                                                            ascending;
                                                                        _resetOrdersWindow();
                                                                      });
                                                                    },
                                                                    columnsBuilder:
                                                                        (onSortChanged) =>
                                                                            [
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '9ehe1nhf' /* Order ID */,
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
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'jmcjgepk' /* Date */,
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
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '0787bj4k' /* Customer */,
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
                                                                        label: sortableColumnHeader(DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'wxrmt409' /* Items */,
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
                                                                        )),
                                                                        onSort: (columnIndex,
                                                                                ascending) =>
                                                                            onSortChanged(
                                                                                columnIndex,
                                                                                ascending),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '27zaw3v2' /* Total */,
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
                                                                        fixedWidth: valueOrDefault(currentUserDocument?.userRole, '') ==
                                                                                'SuperAdmin'
                                                                            ? 150.0
                                                                            : 0.0,
                                                                      ),
                                                                      DataColumn2(
                                                                        label: sortableColumnHeader(DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '88sl7wa1' /* Payment Status */,
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
                                                                        )),
                                                                        onSort: (columnIndex,
                                                                                ascending) =>
                                                                            onSortChanged(
                                                                                columnIndex,
                                                                                ascending),
                                                                      ),
                                                                    ],
                                                                    dataRowBuilder: (orderListItem,
                                                                            orderListIndex,
                                                                            selected,
                                                                            onSelectChanged) =>
                                                                        DataRow(
                                                                      onSelectChanged:
                                                                          (_) async {
                                                                        FFAppState().deliveryflow =
                                                                            DeliveryFlowStruct();
                                                                        context
                                                                            .pushNamed(
                                                                          OrderDetailsWidget
                                                                              .routeName,
                                                                          queryParameters: {
                                                                            'orderRef':
                                                                                serializeParam(
                                                                              orderListItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      cells: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            FFAppState().deliveryflow =
                                                                                DeliveryFlowStruct();

                                                                            context.pushNamed(
                                                                              OrderDetailsWidget.routeName,
                                                                              queryParameters: {
                                                                                'orderRef': serializeParam(
                                                                                  orderListItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            orderListItem.orderId,
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
                                                                        ),
                                                                        Text(
                                                                          '${dateTimeFormat(
                                                                            "yMMMd",
                                                                            orderListItem.createdAt,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )} ${dateTimeFormat(
                                                                            "jm",
                                                                            orderListItem.createdAt,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                        buildOrderCustomerNameCell(
                                                                          context,
                                                                          orderListItem,
                                                                          customerByRefId,
                                                                        ),
                                                                        Text(
                                                                          '${orderListItem.orderItems.cartItems.length.toString()} Items',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              '${orderListItem.totalPrice.toString()} KD',
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
                                                                                  ),
                                                                            ),
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              Icon(
                                                                                FFIcons.kfinance,
                                                                                color: FFAppState().theme.themeMain.primaryText,
                                                                                size: 16.0,
                                                                              ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                () {
                                                                              if (orderListItem.paymentStatus == 'Initialization') {
                                                                                return Color(0xFFFFD6A4);
                                                                              } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                return Color(0xFFFDEAEA);
                                                                              } else if (orderListItem.paymentStatus == 'CAPTURED') {
                                                                                return Color(0xFFCCFFC7);
                                                                              } else {
                                                                                return Color(0xFFF1F1F1);
                                                                              }
                                                                            }(),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: () {
                                                                                if (orderListItem.paymentStatus == 'Initialization') {
                                                                                  return Color(0xFFFFB800);
                                                                                } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                  return Color(0xFFFCA5A5);
                                                                                } else if (orderListItem.paymentStatus == 'CAPTURED') {
                                                                                  return Color(0xFF78FF6A);
                                                                                } else {
                                                                                  return FlutterFlowTheme.of(context).secondaryText;
                                                                                }
                                                                              }(),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(116.0),
                                                                                  child: Image.network(
                                                                                    getCORSProxyUrl(
                                                                                      () {
                                                                                        if (orderListItem.paymentStatus == 'Initialization') {
                                                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/145bzpgd7dzv/pending.png';
                                                                                        } else if (orderListItem.paymentStatus == 'CAPTURED') {
                                                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/95daq34b5geh/paid.png';
                                                                                        } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/mvdr2mtibmkx/failed.png';
                                                                                        } else {
                                                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/u0irvtjm5pm6/canceled.png';
                                                                                        }
                                                                                      }(),
                                                                                    ),
                                                                                    width: 8.0,
                                                                                    height: 8.0,
                                                                                    fit: BoxFit.contain,
                                                                                    alignment: Alignment(0.0, 0.0),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                  child: SelectionArea(
                                                                                      child: Text(
                                                                                    () {
                                                                                      if (orderListItem.paymentStatus == 'Initialization') {
                                                                                        return 'Pending';
                                                                                      } else if (orderListItem.paymentStatus == 'CAPTURED') {
                                                                                        return 'Paid';
                                                                                      } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                        return 'Failed';
                                                                                      } else {
                                                                                        return 'Cancelled';
                                                                                      }
                                                                                    }(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: () {
                                                                                            if (orderListItem.paymentStatus == 'Initialization') {
                                                                                              return FlutterFlowTheme.of(context).primaryText;
                                                                                            } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                              return Color(0xFFD92D20);
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).primaryText;
                                                                                            }
                                                                                          }(),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
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
                                                                                  Icon(
                                                                                    FFIcons.kouline,
                                                                                    color: () {
                                                                                      if (orderListItem.orderStatus == 'Initialization') {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else if ((orderListItem.orderStatus == 'FAILED') && (orderListItem.paymentStatus == 'FAILED')) {
                                                                                        return Color(0xFFD92D20);
                                                                                      } else {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      }
                                                                                    }(),
                                                                                    size: 18.0,
                                                                                  ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ]
                                                                          .map((c) =>
                                                                              DataCell(c))
                                                                          .toList(),
                                                                    ),
                                                                    emptyBuilder:
                                                                        () =>
                                                                            EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'bf0knboq' /* All caught up! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'wlqhmaex' /* There are no pending payments ... */,
                                                                      ),
                                                                    ),
                                                                    paginated:
                                                                        false,
                                                                    selectable:
                                                                        false,
                                                                    hidePaginator:
                                                                        true,
                                                                    showFirstLastButtons:
                                                                        true,
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
                                                                          ),
                                                                        ),
                                                                        if (orderList
                                                                                .isNotEmpty &&
                                                                            _isLoadingMore)
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            padding: const EdgeInsets
                                                                                .symmetric(
                                                                                vertical:
                                                                                    10.0),
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 14.0,
                                                                                  height: 14.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    strokeWidth: 2.0,
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(width: 8.0),
                                                                                Text(
                                                                                  'Loading more...',
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        font: GoogleFonts.inter(),
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        if (((_model.choice ==
                                                                    'Delivery Ongoing') ||
                                                                (_model.choice ==
                                                                    'Create Shipping') ||
                                                                (_model.choice ==
                                                                    'Pickup request') ||
                                                                (_model.choice ==
                                                                    'Delivered')) &&
                                                            (FFAppState()
                                                                    .currentUserRoleKey ==
                                                                'super_admin'))
                                                          Expanded(
                                                            child: StreamBuilder<
                                                                List<
                                                                    OrdersRecord>>(
                                                              stream:
                                                                  queryOrdersRecord(
                                                                queryBuilder:
                                                                    (ordersRecord) =>
                                                                        ordersRecord
                                                                            .where(
                                                                  'payment_status',
                                                                  isEqualTo:
                                                                      'CAPTURED',
                                                                ),
                                                                limit: 100,
                                                              ),
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<OrdersRecord>
                                                                    multipleProductsOrdersRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
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
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final orderList = multipleProductsOrdersRecordList
                                                                          .where((e) => () {
                                                                                if (_model.choice == 'Delivery Ongoing') {
                                                                                  return ((e.deliveryInfoList.length > 0) && (e.orderStatus != 'completed'));
                                                                                } else if (_model.choice == 'Pickup request') {
                                                                                  return (e.orderItems.cartItems.where((e) => (e.productMainType == 'custom') && (e.productPickupInfo.status == 'Ready to Pickup')).toList().length > 0);
                                                                                } else if (_model.choice == 'Create Shipping') {
                                                                                  return (e.deliveryInfoList.length == 0);
                                                                                } else if (_model.choice == 'Delivered') {
                                                                                  return (e.orderStatus == 'completed');
                                                                                } else {
                                                                                  return ((e.paymentStatus == 'CAPTURED') && (e.deliveryInfoList.length > 0));
                                                                                }
                                                                              }())
                                                                          .where((e) => orderMatchesDateFilter(
                                                                                e.createdAt,
                                                                                _model.dateFilter,
                                                                                _model.customRangeStart,
                                                                                _model.customRangeEnd,
                                                                              ))
                                                                          .where((e) => orderMatchesProductFilters(
                                                                                e,
                                                                                _model.filterDesignerId,
                                                                                _model.filterProductId,
                                                                              ))
                                                                          .toList()
                                                                          .sortedList(keyOf: (e) => e.updatedAt!, desc: true)
                                                                          .toList();
                                                                      if (orderList
                                                                          .isEmpty) {
                                                                        return EmptyWidget(
                                                                          messageOne:
                                                                              FFLocalizations.of(context).getText(
                                                                            'vf5zy7q6' /* All caught up! */,
                                                                          ),
                                                                          messageTwo:
                                                                              FFLocalizations.of(context).getText(
                                                                            'o2mcbbdy' /* There are no pending payments ... */,
                                                                          ),
                                                                        );
                                                                      }

                                                                      return FutureBuilder<
                                                                          OrdersRowLookups>(
                                                                        future:
                                                                            _ordersRowLookupsFuture(
                                                                          orderList,
                                                                          _model.choice,
                                                                          secondary:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                lookupSnapshot) {
                                                                          final secondaryCustomerByRefId =
                                                                              lookupSnapshot.data?.customers ??
                                                                                  {};
                                                                          final secondaryDeliveryByRefId =
                                                                              lookupSnapshot.data?.deliveries ??
                                                                                  {};
                                                                          return FlutterFlowDataTable<
                                                                              OrdersRecord>(
                                                                        controller:
                                                                            _model.paginatedDataTableController2,
                                                                        data:
                                                                            orderList,
                                                                        columnsBuilder:
                                                                            (onSortChanged) =>
                                                                                [
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'uc67ikft' /* Order ID */,
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
                                                                                200.0,
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '5465504q' /* Customer */,
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
                                                                            fixedWidth:
                                                                                200.0,
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'xsvhlqkm' /* Date */,
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
                                                                            fixedWidth:
                                                                                200.0,
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'rb359bio' /* products */,
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
                                                                        dataRowBuilder: (orderListItem,
                                                                                orderListIndex,
                                                                                selected,
                                                                                onSelectChanged) =>
                                                                            DataRow(
                                                                          onSelectChanged:
                                                                              (_) async {
                                                                            FFAppState().deliveryflow =
                                                                                DeliveryFlowStruct();
                                                                            context.pushNamed(
                                                                              OrderDetailsWidget.routeName,
                                                                              queryParameters: {
                                                                                'orderRef': serializeParam(
                                                                                  orderListItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          cells:
                                                                              [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                FFAppState().deliveryflow = DeliveryFlowStruct();

                                                                                context.pushNamed(
                                                                                  OrderDetailsWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'orderRef': serializeParam(
                                                                                      orderListItem.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                orderListItem.orderId,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF303030),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      decoration: TextDecoration.underline,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            buildOrderCustomerNameCell(
                                                                              context,
                                                                              orderListItem,
                                                                              secondaryCustomerByRefId,
                                                                              textColor: const Color(0xFF303030),
                                                                            ),
                                                                            Text(
                                                                              '${dateTimeFormat(
                                                                                "MMM dd, yyyy",
                                                                                orderListItem.createdAt,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              )} ${dateTimeFormat(
                                                                                "jm",
                                                                                orderListItem.createdAt,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              )}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF303030),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final itemsList = orderListItem.orderItems.cartItems.map((e) => e).toList();

                                                                                  return SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: List.generate(itemsList.length, (itemsListIndex) {
                                                                                        final itemsListItem = itemsList[itemsListIndex];
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      getCORSProxyUrl(
                                                                                                        valueOrDefault<String>(
                                                                                                          itemsListItem.productInfo.featureImage != ''
                                                                                                              ? itemsListItem.productInfo.featureImage
                                                                                                              : valueOrDefault<String>(
                                                                                                                  itemsListItem.productInfo.galleryImage.firstOrNull,
                                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/91d1v7uc478g/Vector.png',
                                                                                                                ),
                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/91d1v7uc478g/Vector.png',
                                                                                                        ),
                                                                                                      ),
                                                                                                      width: 40.0,
                                                                                                      height: 40.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: SelectionArea(
                                                                                                        child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        itemsListItem.productInfo.name,
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: Color(0xFF303030),
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            lineHeight: 1.5,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 24.0)),
                                                                                              ),
                                                                                            ),
                                                                                            if ((_model.choice == 'Delivery Ongoing') && (orderListItem.deliveryInfoList.where((e) => e.productIds.contains(itemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != null && orderListItem.deliveryInfoList.where((e) => e.productIds.contains(itemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != ''))
                                                                                              Expanded(
                                                                                                child: Builder(
                                                                                                  builder: (context) {
                                                                                                    final deliveryInfo = orderListItem
                                                                                                        .deliveryInfoList
                                                                                                        .where((e) => e.productIds.contains(itemsListItem.productId))
                                                                                                        .firstOrNull;
                                                                                                    final deliveryRef = deliveryInfo?.deliveryRef;
                                                                                                    if (deliveryRef == null) {
                                                                                                      return const SizedBox.shrink();
                                                                                                    }
                                                                                                    final deliveryDeliveryRecord =
                                                                                                        secondaryDeliveryByRefId[deliveryRef.id];
                                                                                                    if (deliveryDeliveryRecord == null) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 1.0,
                                                                                                          height: 1.0,
                                                                                                          child: CircularProgressIndicator(
                                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                              FlutterFlowTheme.of(context).secondary,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }

                                                                                                    return Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            deliveryDeliveryRecord.status,
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF303030),
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        )),
                                                                                                        if (responsiveVisibility(
                                                                                                          context: context,
                                                                                                          phone: false,
                                                                                                          tablet: false,
                                                                                                          tabletLandscape: false,
                                                                                                          desktop: false,
                                                                                                        ))
                                                                                                          Icon(
                                                                                                            FFIcons.kpickup,
                                                                                                            color: FFAppState().theme.themeMain.primaryText,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        if (orderListItem.deliveryInfoList.where((e) => (e.productIds.contains(itemsListItem.productId) == true) && (e.status != '')).toList().firstOrNull?.deliveryRef != null)
                                                                                                          Builder(
                                                                                                            builder: (context) => FlutterFlowIconButton(
                                                                                                              borderRadius: 8.0,
                                                                                                              buttonSize: 40.0,
                                                                                                              icon: Icon(
                                                                                                                FFIcons.kpickup,
                                                                                                                color: FFAppState().theme.themeMain.primaryText,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                              showLoadingIndicator: true,
                                                                                                              onPressed: () async {
                                                                                                                _model.logisticsResponseDoc = await queryLogisticsResponseRecordOnce(
                                                                                                                  queryBuilder: (logisticsResponseRecord) => logisticsResponseRecord.where(
                                                                                                                    'id',
                                                                                                                    isEqualTo: deliveryDeliveryRecord.deliveryId,
                                                                                                                  ),
                                                                                                                  singleRecord: true,
                                                                                                                ).then((s) => s.firstOrNull);
                                                                                                                await showAlignedDialog(
                                                                                                                  barrierColor: Color(0x7B000000),
                                                                                                                  context: context,
                                                                                                                  isGlobal: false,
                                                                                                                  avoidOverflow: false,
                                                                                                                  targetAnchor: AlignmentDirectional(-12.0, 6.0).resolve(Directionality.of(context)),
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
                                                                                                                          child: Container(
                                                                                                                            height: 300.0,
                                                                                                                            child: TimelineForInventoryWidget(
                                                                                                                              logisticsDoc: _model.logisticsResponseDoc!,
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
                                                                                                      ].divide(SizedBox(width: 6.0)),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            if ((_model.choice == 'Pickup request') && (itemsListItem.productPickupInfo.status == 'Ready to Pickup'))
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    if (itemsListItem.productPickupInfo.status == 'Ready to Pickup')
                                                                                                      SelectionArea(
                                                                                                          child: Text(
                                                                                                        itemsListItem.productPickupInfo.status == 'Ready to Pickup' ? itemsListItem.productPickupInfo.status : 'Designer Processing',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF303030),
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              lineHeight: 1.5,
                                                                                                            ),
                                                                                                      )),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            if (((_model.choice == 'Create Shipping') && (itemsListItem.productMainType == 'ready')) || ((_model.choice == 'Create Shipping') && (itemsListItem.productPickupInfo.status == 'Recevied')))
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '8yjgqbef' /* Raise Shipping Request */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: Color(0xFF303030),
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            lineHeight: 1.5,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            if (_model.choice == 'Delivered')
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'ffprqdyv' /* Delivered */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: Color(0xFF303030),
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            lineHeight: 1.5,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                          ].divide(SizedBox(width: 12.0)).addToEnd(SizedBox(width: 24.0)),
                                                                                        );
                                                                                      }).divide(SizedBox(height: 8.0)).addToStart(SizedBox(height: 8.0)),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ].map((c) => DataCell(c)).toList(),
                                                                        ),
                                                                        emptyBuilder:
                                                                            () =>
                                                                                EmptyWidget(
                                                                          messageOne:
                                                                              FFLocalizations.of(context).getText(
                                                                            'vf5zy7q6' /* All caught up! */,
                                                                          ),
                                                                          messageTwo:
                                                                              FFLocalizations.of(context).getText(
                                                                            'o2mcbbdy' /* There are no pending payments ... */,
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
                                                                        dataRowHeight:
                                                                            130.0,
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
                                                                      );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
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
                ],
              ),
            ),
          ),
        ));
  }
}

/// Custom "Sort by date range" calendar dialog styled with the app's design
/// tokens. Returns the selected [DateTimeRange] on Apply, or null on Cancel.
class AzyaaDateRangePickerDialog extends StatefulWidget {
  const AzyaaDateRangePickerDialog({
    super.key,
    this.initialStart,
    this.initialEnd,
  });

  final DateTime? initialStart;
  final DateTime? initialEnd;

  @override
  State<AzyaaDateRangePickerDialog> createState() =>
      _AzyaaDateRangePickerDialogState();
}

class _AzyaaDateRangePickerDialogState
    extends State<AzyaaDateRangePickerDialog> {
  late DateTime _visibleMonth;
  DateTime? _start;
  DateTime? _end;

  DateTime get _today {
    final n = DateTime.now();
    return DateTime(n.year, n.month, n.day);
  }

  @override
  void initState() {
    super.initState();
    _start = _dateOnly(widget.initialStart);
    _end = _dateOnly(widget.initialEnd);
    final base = widget.initialStart ?? DateTime.now();
    _visibleMonth = DateTime(base.year, base.month);
  }

  DateTime? _dateOnly(DateTime? d) =>
      d == null ? null : DateTime(d.year, d.month, d.day);

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  bool get _canGoNext {
    final now = DateTime.now();
    return _visibleMonth.isBefore(DateTime(now.year, now.month));
  }

  bool _inRange(DateTime day) {
    if (_start == null || _end == null) {
      return false;
    }
    return day.isAfter(_start!) && day.isBefore(_end!);
  }

  void _onDayTap(DateTime day) {
    if (day.isAfter(_today)) {
      return;
    }
    setState(() {
      if (_start == null || _end != null) {
        _start = day;
        _end = null;
      } else if (day.isBefore(_start!)) {
        _start = day;
      } else {
        _end = day;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final primary = theme.primary;

    final daysInMonth =
        DateTime(_visibleMonth.year, _visibleMonth.month + 1, 0).day;
    // Sunday-first offset (Sun = 0 ... Sat = 6).
    final firstWeekday =
        DateTime(_visibleMonth.year, _visibleMonth.month, 1).weekday % 7;

    final cells = <DateTime?>[];
    for (var i = 0; i < firstWeekday; i++) {
      cells.add(null);
    }
    for (var d = 1; d <= daysInMonth; d++) {
      cells.add(DateTime(_visibleMonth.year, _visibleMonth.month, d));
    }
    while (cells.length % 7 != 0) {
      cells.add(null);
    }
    final weeks = <List<DateTime?>>[];
    for (var i = 0; i < cells.length; i += 7) {
      weeks.add(cells.sublist(i, i + 7));
    }

    return Dialog(
      backgroundColor: theme.secondaryBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: 330.0,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sort by date range',
              style: theme.titleMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                color: theme.primaryText,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              'Tap a start date, then tap an end date',
              style: theme.bodyMedium.override(
                font: GoogleFonts.inter(),
                color: theme.secondaryText,
                letterSpacing: 0.0,
              ),
            ),
            const SizedBox(height: 18.0),
            Row(
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(_visibleMonth),
                  style: theme.titleSmall.override(
                    font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                    color: theme.primaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                _navButton(
                  Icons.chevron_left_rounded,
                  () => setState(() => _visibleMonth = DateTime(
                        _visibleMonth.year,
                        _visibleMonth.month - 1,
                      )),
                ),
                const SizedBox(width: 4.0),
                _navButton(
                  Icons.chevron_right_rounded,
                  _canGoNext
                      ? () => setState(() => _visibleMonth = DateTime(
                            _visibleMonth.year,
                            _visibleMonth.month + 1,
                          ))
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 14.0),
            Row(
              children: const ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                  .map(
                    (w) => Expanded(
                      child: Center(
                        child: _WeekdayLabel(label: w),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 6.0),
            ...weeks.map(
              (week) => Row(
                children: week
                    .map((day) => Expanded(child: _dayCell(day, primary)))
                    .toList(),
              ),
            ),
            const SizedBox(height: 18.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                      color: primary,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 2.0),
                TextButton(
                  onPressed: () => setState(() {
                    _start = null;
                    _end = null;
                  }),
                  child: Text(
                    'Clear',
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                      color: primary,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _start == null
                      ? null
                      : () => Navigator.pop(
                            context,
                            DateTimeRange(
                              start: _start!,
                              end: _end ?? _start!,
                            ),
                          ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: theme.alternate,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navButton(IconData icon, VoidCallback? onTap) {
    final theme = FlutterFlowTheme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          icon,
          size: 24.0,
          color: onTap == null ? theme.alternate : theme.primaryText,
        ),
      ),
    );
  }

  Widget _dayCell(DateTime? day, Color primary) {
    final theme = FlutterFlowTheme.of(context);
    if (day == null) {
      return const SizedBox(height: 40.0);
    }
    final isFuture = day.isAfter(_today);
    final isEdge = (_start != null && _sameDay(day, _start!)) ||
        (_end != null && _sameDay(day, _end!));
    final inRange = _inRange(day);

    Color? bg;
    Color textColor = theme.primaryText;
    if (isEdge) {
      bg = primary;
      textColor = Colors.white;
    } else if (inRange) {
      bg = primary.withAlpha(30);
      textColor = primary;
    }
    if (isFuture) {
      textColor = theme.alternate;
    }

    return GestureDetector(
      onTap: isFuture ? null : () => _onDayTap(day),
      child: Container(
        height: 40.0,
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(isEdge ? 100.0 : 8.0),
        ),
        alignment: Alignment.center,
        child: Text(
          '${day.day}',
          style: theme.bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: isEdge ? FontWeight.w600 : FontWeight.w500,
            ),
            color: textColor,
            letterSpacing: 0.0,
            fontWeight: isEdge ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _WeekdayLabel extends StatelessWidget {
  const _WeekdayLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Text(
      label,
      style: theme.bodySmall.override(
        font: GoogleFonts.inter(fontWeight: FontWeight.w600),
        color: theme.secondaryText,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

/// Selections returned by [AzyaaOrdersFilterDialog].
class OrdersFilterResult {
  const OrdersFilterResult({
    this.designerId,
    this.designerName,
    this.productId,
    this.productName,
  });

  final String? designerId;
  final String? designerName;
  final String? productId;
  final String? productName;
}

/// Filters pop-up for the orders table: pick a Designer and/or a Product to
/// scope the visible orders. Designer names are resolved from the users
/// collection (user_role == 'Designer'); product options are derived from the
/// currently loaded orders so no extra Firestore index is required.
class AzyaaOrdersFilterDialog extends StatefulWidget {
  const AzyaaOrdersFilterDialog({
    super.key,
    required this.orders,
    this.initialDesignerId,
    this.initialDesignerName,
    this.initialProductId,
    this.initialProductName,
  });

  final List<OrdersRecord> orders;
  final String? initialDesignerId;
  final String? initialDesignerName;
  final String? initialProductId;
  final String? initialProductName;

  @override
  State<AzyaaOrdersFilterDialog> createState() =>
      _AzyaaOrdersFilterDialogState();
}

class _AzyaaOrdersFilterDialogState extends State<AzyaaOrdersFilterDialog> {
  static const List<String> _categories = ['Designer', 'Products'];

  String _category = 'Designer';
  String? _designerId;
  String? _designerName;
  String? _productId;
  String? _productName;

  late final FormFieldController<String> _designerController;
  late final FormFieldController<String> _productController;
  late final Future<List<UsersRecord>> _designersFuture;

  @override
  void initState() {
    super.initState();
    _designerId = widget.initialDesignerId;
    _designerName = widget.initialDesignerName;
    _productId = widget.initialProductId;
    _productName = widget.initialProductName;
    _designerController = FormFieldController<String>(_designerId ?? '');
    _productController = FormFieldController<String>(_productId ?? '');
    _designersFuture = queryUsersRecordOnce(
      queryBuilder: (usersRecord) =>
          usersRecord.where('user_role', isEqualTo: 'Designer'),
    );
  }

  Set<String> get _orderDesignerIds {
    final ids = <String>{};
    for (final o in widget.orders) {
      for (final i in o.orderItems.cartItems) {
        if (i.productDesignerId.isNotEmpty) {
          ids.add(i.productDesignerId);
        }
      }
    }
    return ids;
  }

  /// Distinct products (id -> display name) in the loaded orders, optionally
  /// scoped to the currently selected designer.
  List<MapEntry<String, String>> _productOptions() {
    final map = <String, String>{};
    for (final o in widget.orders) {
      for (final i in o.orderItems.cartItems) {
        if (_designerId != null &&
            _designerId!.isNotEmpty &&
            i.productDesignerId != _designerId) {
          continue;
        }
        if (i.productId.isEmpty) {
          continue;
        }
        map[i.productId] =
            i.productInfo.name.isNotEmpty ? i.productInfo.name : i.productId;
      }
    }
    final entries = map.entries.toList()
      ..sort((a, b) => a.value.toLowerCase().compareTo(b.value.toLowerCase()));
    return entries;
  }

  int get _matchCount => widget.orders
      .where((e) => orderMatchesProductFilters(e, _designerId, _productId))
      .length;

  void _clearAll() {
    setState(() {
      _designerId = null;
      _designerName = null;
      _productId = null;
      _productName = null;
      _designerController.value = '';
      _productController.value = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final maxWidth = MediaQuery.sizeOf(context).width;
    return Dialog(
      backgroundColor: theme.secondaryBackground,
      insetPadding: const EdgeInsets.all(24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: maxWidth < 700 ? maxWidth : 660.0,
        constraints: const BoxConstraints(maxHeight: 460.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 18.0, 12.0, 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Filters',
                      style: theme.headlineSmall.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.close_rounded,
                          color: theme.secondaryText, size: 22.0),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1.0, thickness: 1.0, color: theme.border),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 190.0,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 8.0),
                          child: Text(
                            'Filter by',
                            style: theme.bodySmall.override(
                              font: GoogleFonts.inter(),
                              color: theme.secondaryText,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                        ..._categories.map(_buildCategoryTile),
                      ],
                    ),
                  ),
                  VerticalDivider(width: 1.0, thickness: 1.0, color: theme.border),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: _category == 'Designer'
                          ? _buildDesignerPanel(theme)
                          : _buildProductsPanel(theme),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1.0, thickness: 1.0, color: theme.border),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Results: $_matchCount',
                      style: theme.bodyMedium.override(
                        font: GoogleFonts.inter(),
                        color: theme.secondaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: _clearAll,
                    text: 'Clear all',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      color: theme.secondaryBackground,
                      textStyle: theme.titleSmall.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        color: theme.primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 0.0,
                      borderSide: BorderSide(color: theme.border),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  FFButtonWidget(
                    onPressed: () => Navigator.pop(
                      context,
                      OrdersFilterResult(
                        designerId: _designerId,
                        designerName: _designerName,
                        productId: _productId,
                        productName: _productName,
                      ),
                    ),
                    text: 'Apply filters',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      color: FFAppState().theme.themeMain.primaryButtoncolor,
                      textStyle: theme.titleSmall.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        color:
                            FFAppState().theme.themeMain.primaryButtonTextColor,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color:
                            FFAppState().theme.themeMain.primaryButtonBorder!,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile(String category) {
    final theme = FlutterFlowTheme.of(context);
    final selected = _category == category;
    final active = category == 'Designer'
        ? (_designerId != null && _designerId!.isNotEmpty)
        : (_productId != null && _productId!.isNotEmpty);
    return InkWell(
      onTap: () => setState(() => _category = category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        color: selected ? theme.primaryBackground : Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Text(
                category,
                style: theme.bodyMedium.override(
                  font: GoogleFonts.inter(
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w500),
                  color: selected ? theme.primaryText : theme.secondaryText,
                  letterSpacing: 0.0,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
            if (active)
              Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: FFAppState().theme.themeMain.primaryButtoncolor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesignerPanel(FlutterFlowTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Designer',
          style: theme.titleMedium.override(
            font: GoogleFonts.inter(fontWeight: FontWeight.w600),
            letterSpacing: 0.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16.0),
        FutureBuilder<List<UsersRecord>>(
          future: _designersFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 22.0,
                  width: 22.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            }
            final nameById = <String, String>{
              for (final u in snapshot.data!)
                if (u.uid.isNotEmpty)
                  u.uid: (u.displayName.isNotEmpty ? u.displayName : u.uid),
            };
            final ids = _orderDesignerIds.toList()
              ..sort((a, b) => (nameById[a] ?? a)
                  .toLowerCase()
                  .compareTo((nameById[b] ?? b).toLowerCase()));
            final options = ['', ...ids];
            final optionLabels = [
              'All designers',
              ...ids.map((id) => nameById[id] ?? id),
            ];
            return _buildDropdown(
              theme: theme,
              controller: _designerController,
              options: options,
              optionLabels: optionLabels,
              hintText: 'All designers',
              onChanged: (val) {
                setState(() {
                  _designerId = (val == null || val.isEmpty) ? null : val;
                  _designerName =
                      _designerId == null ? null : (nameById[val] ?? val);
                  if (_productId != null &&
                      !_productOptions().any((e) => e.key == _productId)) {
                    _productId = null;
                    _productName = null;
                    _productController.value = '';
                  }
                });
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildProductsPanel(FlutterFlowTheme theme) {
    final opts = _productOptions();
    final options = ['', ...opts.map((e) => e.key)];
    final optionLabels = ['All products', ...opts.map((e) => e.value)];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Products',
          style: theme.titleMedium.override(
            font: GoogleFonts.inter(fontWeight: FontWeight.w600),
            letterSpacing: 0.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (_designerId != null && _designerId!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Products by ${_designerName ?? 'selected designer'}',
              style: theme.bodySmall.override(
                font: GoogleFonts.inter(),
                color: theme.secondaryText,
                letterSpacing: 0.0,
              ),
            ),
          ),
        const SizedBox(height: 16.0),
        _buildDropdown(
          theme: theme,
          controller: _productController,
          options: options,
          optionLabels: optionLabels,
          hintText: 'All products',
          onChanged: (val) {
            setState(() {
              _productId = (val == null || val.isEmpty) ? null : val;
              if (_productId == null) {
                _productName = null;
              } else {
                final match =
                    opts.where((e) => e.key == val).map((e) => e.value);
                _productName = match.isNotEmpty ? match.first : val;
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required FlutterFlowTheme theme,
    required FormFieldController<String> controller,
    required List<String> options,
    required List<String> optionLabels,
    required String hintText,
    required void Function(String?) onChanged,
  }) {
    return Container(
      height: 44.0,
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: theme.border),
      ),
      child: FlutterFlowDropDown<String>(
        controller: controller,
        options: options,
        optionLabels: optionLabels,
        onChanged: onChanged,
        width: double.infinity,
        height: 44.0,
        textStyle: theme.bodyMedium.override(
          font: GoogleFonts.inter(fontWeight: FontWeight.w500),
          fontSize: 14.0,
          letterSpacing: 0.0,
          fontWeight: FontWeight.w500,
        ),
        hintText: hintText,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: theme.secondaryText,
          size: 22.0,
        ),
        elevation: 2.0,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
        borderRadius: 8.0,
        margin: const EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 10.0, 0.0),
        hidesUnderline: true,
        isOverButton: false,
        isSearchable: true,
        isMultiSelect: false,
      ),
    );
  }
}
