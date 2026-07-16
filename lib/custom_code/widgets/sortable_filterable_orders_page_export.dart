// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Syncfusion Imports
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row, Border;
import 'package:intl/intl.dart';
import 'dart:convert';
// Modern web import (replaces dart:html)
import 'package:web/web.dart' as web;
import 'dart:js_interop';

// Helper function for hex colors
Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer
      .write(hexString.replaceFirst('#', '').replaceFirst('EBEBEB', 'EBEBEB'));
  return Color(int.parse(buffer.toString(), radix: 16));
}

// --- 1. Local Data Model ---
class Order {
  final String documentId;
  final String orderId;
  final DateTime createdAt;
  final double totalPrice;
  final String paymentStatus;
  final int itemCount;
  final String orderStatus;
  // Customer Fields
  final DocumentReference? customerRef;
  String? customerName;

  Order({
    required this.documentId,
    required this.orderId,
    required this.createdAt,
    required this.totalPrice,
    required this.paymentStatus,
    required this.itemCount,
    required this.orderStatus,
    this.customerRef,
    this.customerName,
  });

  static Order fromRecord(OrdersRecord record) {
    int calculatedItemCount = 0;
    final UserCartStruct? orderItemsStruct = record.orderItems;
    if (orderItemsStruct != null) {
      final List<dynamic>? cartItemsList = orderItemsStruct.cartItems;
      calculatedItemCount = cartItemsList?.length ?? 0;
    }

    return Order(
      documentId: record.reference.id,
      orderId: record.orderId ?? 'N/A',
      createdAt: record.createdAt ?? DateTime.now(),
      totalPrice: record.totalPrice?.toDouble() ?? 0,
      paymentStatus: record.paymentStatus ?? 'UNKNOWN',
      itemCount: calculatedItemCount,
      orderStatus: record.orderStatus ?? 'Pending',
      customerRef: record.customerRef,
      customerName: null,
    );
  }
}

// --- 2. DataGridSource with Pagination ---
class OrderDataSource extends DataGridSource {
  final BuildContext context;
  final List<Order> _originalOrders;
  final Function(String docRef) onOrderIdTap;
  final Widget Function(String status) buildPaymentStatusBadge;

  List<Order> _filteredAndSortedOrders = [];
  int rowsPerPage;
  int startIndex = 0;

  List<DataGridRow> _paginatedRows = [];
  List<FilterCondition> currentFilters = [];

  OrderDataSource({
    required this.context,
    required List<Order> orders,
    required this.rowsPerPage,
    required this.onOrderIdTap,
    required this.buildPaymentStatusBadge,
  }) : _originalOrders = orders {
    _applyFilteringAndSorting();
  }

  // Get the current page orders (for export)
  List<Order> getCurrentPageOrders() {
    int actualRows = _filteredAndSortedOrders.length;
    if (actualRows == 0) return [];

    if (startIndex >= actualRows) {
      return [];
    }

    int end = startIndex + rowsPerPage;
    if (end > actualRows) end = actualRows;

    return _filteredAndSortedOrders.sublist(startIndex, end);
  }

  // Get current page number (1-based)
  int getCurrentPageNumber() {
    if (rowsPerPage <= 0) return 1;
    return (startIndex ~/ rowsPerPage) + 1;
  }

  bool _filterRow(Order order) {
    if (currentFilters.isEmpty) {
      return true;
    }
    for (var condition in currentFilters) {
      final dynamic effectiveCondition =
          (condition as dynamic).filterCondition ?? condition;
      dynamic columnValue;
      switch (effectiveCondition.columnName) {
        case 'orderId':
          columnValue = order.orderId;
          break;
        case 'createdAt':
          columnValue = order.createdAt;
          break;
        case 'totalPrice':
          columnValue = order.totalPrice;
          break;
        case 'paymentStatus':
          columnValue = order.paymentStatus;
          break;
        case 'itemCount':
          columnValue = order.itemCount;
          break;
        case 'customerName':
          columnValue = order.customerName ?? '';
          break;
        case 'orderStatus':
          columnValue = order.orderStatus;
          break;
        default:
          continue;
      }
      if (!effectiveCondition.filter.evaluate(columnValue)) {
        return false;
      }
    }
    return true;
  }

  void _applyFilteringAndSorting() {
    List<Order> currentList = List.from(_originalOrders);

    if (currentFilters.isNotEmpty) {
      currentList = currentList.where((order) => _filterRow(order)).toList();
    }

    if (sortedColumns.isNotEmpty) {
      final sortColumn = sortedColumns.first;
      currentList.sort((a, b) {
        dynamic valueA;
        dynamic valueB;
        switch (sortColumn.name) {
          case 'orderId':
            valueA = a.orderId;
            valueB = b.orderId;
            break;
          case 'createdAt':
            valueA = a.createdAt;
            valueB = b.createdAt;
            break;
          case 'totalPrice':
            valueA = a.totalPrice;
            valueB = b.totalPrice;
            break;
          case 'paymentStatus':
            valueA = a.paymentStatus;
            valueB = b.paymentStatus;
            break;
          case 'itemCount':
            valueA = a.itemCount;
            valueB = b.itemCount;
            break;
          case 'customerName':
            valueA = a.customerName ?? '';
            valueB = b.customerName ?? '';
            break;
          case 'orderStatus':
            valueA = a.orderStatus;
            valueB = b.orderStatus;
            break;
          default:
            return 0;
        }
        int result;
        if (valueA is Comparable && valueB is Comparable) {
          result = valueA.compareTo(valueB);
        } else {
          result = 0;
        }
        return sortColumn.sortDirection == DataGridSortDirection.ascending
            ? result
            : -result;
      });
    }
    _filteredAndSortedOrders = currentList;
    buildRows();
  }

  void buildRows() {
    int actualRows = _filteredAndSortedOrders.length;
    if (actualRows == 0) {
      _paginatedRows = [];
      return;
    }
    if (startIndex >= actualRows) {
      startIndex = 0;
    }
    int end = startIndex + rowsPerPage;
    if (end > actualRows) end = actualRows;

    final currentPageItems = _filteredAndSortedOrders.sublist(startIndex, end);

    _paginatedRows = currentPageItems.map((order) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'orderId', value: order.orderId),
        DataGridCell<DateTime>(columnName: 'createdAt', value: order.createdAt),
        DataGridCell<double>(columnName: 'totalPrice', value: order.totalPrice),
        DataGridCell<String>(
            columnName: 'paymentStatus', value: order.paymentStatus),
        DataGridCell<int>(columnName: 'itemCount', value: order.itemCount),
        DataGridCell<String>(
            columnName: 'customerName', value: order.customerName ?? 'N/A'),
        DataGridCell<String>(
            columnName: 'orderStatus', value: order.orderStatus),
        DataGridCell<String>(columnName: 'documentId', value: order.documentId),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _paginatedRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final documentIdCell = row.getCells().firstWhere(
          (cell) => cell.columnName == 'documentId',
        );
    final documentId = documentIdCell.value.toString();

    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        final isTotalPrice = cell.columnName == 'totalPrice';
        final isOrderId = cell.columnName == 'orderId';
        final isItemCount = cell.columnName == 'itemCount';
        final isCustomerName = cell.columnName == 'customerName';

        if (cell.columnName == 'documentId') {
          return Container();
        }

        if (cell.columnName == 'paymentStatus') {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            alignment: Alignment.centerLeft,
            child: buildPaymentStatusBadge(cell.value.toString()),
          );
        }

        TextStyle style = FlutterFlowTheme.of(context).bodyMedium!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.3,
              fontFamily: 'Inter',
            );

        if (isTotalPrice || isOrderId || isItemCount || isCustomerName)
          style = style.copyWith(fontWeight: FontWeight.w500);

        Widget cellContent = Text(
          _formatCell(cell),
          overflow: TextOverflow.ellipsis,
          style: style,
        );

        if (isOrderId) {
          style = style.copyWith(
              decoration: TextDecoration.underline,
              color: FlutterFlowTheme.of(context).primary);

          cellContent = GestureDetector(
            onTap: () {
              onOrderIdTap(documentId);
            },
            child: Text(
              _formatCell(cell),
              overflow: TextOverflow.ellipsis,
              style: style,
            ),
          );
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          alignment: isTotalPrice ? Alignment.centerLeft : Alignment.centerLeft,
          child: cellContent,
        );
      }).toList(),
    );
  }

  String _formatCell(DataGridCell cell) {
    if (cell.columnName == 'totalPrice') {
      return '${cell.value.toStringAsFixed(2)} KD';
    } else if (cell.columnName == 'createdAt' && cell.value is DateTime) {
      return DateFormat('yyyy-MM-dd HH:mm').format(cell.value);
    } else if (cell.columnName == 'itemCount' && cell.value is int) {
      return cell.value.toString();
    }
    return cell.value.toString();
  }

  @override
  Future<bool> handleFiltering(List<FilterCondition> filters) async {
    currentFilters = filters;
    startIndex = 0;
    _applyFilteringAndSorting();
    notifyListeners();
    return true;
  }

  @override
  Future<void> sort() async {
    startIndex = 0;
    _applyFilteringAndSorting();
    notifyListeners();
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    startIndex = newPageIndex * rowsPerPage;
    buildRows();
    notifyListeners();
    return true;
  }

  @override
  int get rowCount => _filteredAndSortedOrders.length;
}

/// --- 3.
///
/// Custom Widget Main Class ---
class SortableFilterableOrdersPageExport extends StatefulWidget {
  const SortableFilterableOrdersPageExport({
    super.key,
    this.width,
    this.height,
    required this.orders,
    this.rowsPerPage,
    this.users,
  });

  final double? width;
  final double? height;
  final List<OrdersRecord> orders;
  final int? rowsPerPage;
  final List<UsersRecord>? users;

  @override
  State<SortableFilterableOrdersPageExport> createState() =>
      _SortableFilterableOrdersPageExportState();
}

class _SortableFilterableOrdersPageExportState
    extends State<SortableFilterableOrdersPageExport> {
  late OrderDataSource _orderDataSource;
  late DataPagerController _pagerController;
  late int _rowsPerPage;
  bool _isExporting = false;

  List<Order> _mapOrdersToUsers(
      List<OrdersRecord> orderRecords, List<UsersRecord>? userRecords) {
    final List<Order> orders =
        orderRecords.map((r) => Order.fromRecord(r)).toList();

    final Map<DocumentReference, String> userLookup = {};
    if (userRecords != null) {
      for (var user in userRecords) {
        if (user.displayName != null && user.reference != null) {
          userLookup[user.reference] = user.displayName!;
        }
      }
    }

    for (var order in orders) {
      if (order.customerRef != null) {
        final String? name = userLookup[order.customerRef];
        order.customerName = name ?? 'User Deleted';
      } else {
        order.customerName = 'N/A';
      }
    }

    return orders;
  }

  Widget _buildPaymentStatusBadge(String status) {
    final String paymentStatus = status.toUpperCase();

    final Color bgColor = () {
      if (paymentStatus == 'INITIALIZATION' || paymentStatus == 'PENDING') {
        return const Color(0xFFFFD6A4);
      } else if (paymentStatus == 'FAILED') {
        return const Color(0xFFFDEAEA);
      } else if (paymentStatus == 'CAPTURED' || paymentStatus == 'PAID') {
        return const Color(0xFFCCFFC7);
      } else {
        return const Color(0xFFF1F1F1);
      }
    }();

    final Color dotColor = () {
      if (paymentStatus == 'CAPTURED' || paymentStatus == 'PAID') {
        return const Color(0xFF78FF6A);
      } else if (paymentStatus == 'FAILED') {
        return const Color(0xFFD92D20);
      } else if (paymentStatus == 'INITIALIZATION' ||
          paymentStatus == 'PENDING') {
        return const Color(0xFFFFB800);
      } else {
        return const Color(0xFF6B7280);
      }
    }();

    final Color borderColor = () {
      if (paymentStatus == 'INITIALIZATION' || paymentStatus == 'PENDING') {
        return const Color(0xFFFFB800);
      } else if (paymentStatus == 'FAILED') {
        return const Color(0xFFFCA5A5);
      } else if (paymentStatus == 'CAPTURED' || paymentStatus == 'PAID') {
        return const Color(0xFF78FF6A);
      } else {
        return FlutterFlowTheme.of(context).secondaryText;
      }
    }();

    final Color textColor = () {
      if (paymentStatus == 'INITIALIZATION' || paymentStatus == 'PENDING') {
        return const Color(0xFFFFB800);
      } else if (paymentStatus == 'FAILED') {
        return const Color(0xFFD92D20);
      } else if (paymentStatus == 'CAPTURED' || paymentStatus == 'PAID') {
        return const Color(0xFF109B05);
      } else {
        return FlutterFlowTheme.of(context).secondaryText;
      }
    }();

    final String displayText = () {
      if (paymentStatus == 'INITIALIZATION' || paymentStatus == 'PENDING') {
        return 'Pending';
      } else if (paymentStatus == 'CAPTURED' || paymentStatus == 'PAID') {
        return 'Paid';
      } else if (paymentStatus == 'FAILED') {
        return 'Failed';
      } else {
        return 'Cancelled';
      }
    }();

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: dotColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              displayText,
              style: FlutterFlowTheme.of(context).bodyMedium!.copyWith(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.0,
                    fontFamily: 'Inter',
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToOrder(String docRef) async {
    final docReference =
        FirebaseFirestore.instance.collection('orders').doc(docRef);
    context.pushNamed(
      'Order-Details',
      queryParameters: {
        'orderRef': serializeParam(
          docReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls,
    );
  }

  OrderDataSource _createDataSource(List<Order> orders, int rowsPerPage) {
    return OrderDataSource(
      context: context,
      orders: orders,
      rowsPerPage: rowsPerPage,
      onOrderIdTap: _navigateToOrder,
      buildPaymentStatusBadge: _buildPaymentStatusBadge,
    );
  }

  @override
  void initState() {
    super.initState();
    _rowsPerPage = widget.rowsPerPage ?? 10;
    _pagerController = DataPagerController();

    final List<Order> ordersWithNames =
        _mapOrdersToUsers(widget.orders, widget.users);

    _orderDataSource = _createDataSource(
      ordersWithNames,
      _rowsPerPage,
    );
  }

  @override
  void didUpdateWidget(covariant SortableFilterableOrdersPageExport oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.orders != oldWidget.orders ||
        widget.rowsPerPage != oldWidget.rowsPerPage ||
        widget.users != oldWidget.users) {
      _rowsPerPage = widget.rowsPerPage ?? 10;

      final List<Order> ordersWithNames =
          _mapOrdersToUsers(widget.orders, widget.users);

      _orderDataSource = _createDataSource(
        ordersWithNames,
        _rowsPerPage,
      );
      _pagerController.selectedPageIndex = 0;
    }
  }

  Widget _buildHeaderCell(String text, Alignment alignment) {
    final TextStyle headerTextStyle =
        FlutterFlowTheme.of(context).titleSmall!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: const Color(0xFF616161),
            );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      alignment: alignment,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
          left: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 0.5,
          ),
        ),
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: headerTextStyle,
      ),
    );
  }

  // EXPORT CURRENT PAGE TO CSV
  Future<void> _exportCurrentPageToCSV() async {
    setState(() => _isExporting = true);

    try {
      // Get only the current page orders
      final currentPageOrders = _orderDataSource.getCurrentPageOrders();
      final currentPage = _orderDataSource.getCurrentPageNumber();

      if (currentPageOrders.isEmpty) {
        throw Exception('No data on current page to export');
      }

      final StringBuffer csvBuffer = StringBuffer();
      csvBuffer.write('\uFEFF'); // UTF-8 BOM

      // Header
      csvBuffer.writeln(
          'Order ID,Created At,Total Price,Payment Status,Items,Customer Name,Order Status');

      // Data rows - only current page
      for (var order in currentPageOrders) {
        final formattedDate =
            DateFormat('yyyy-MM-dd HH:mm').format(order.createdAt);
        csvBuffer.writeln(
            '"${order.orderId}","$formattedDate","${order.totalPrice.toStringAsFixed(2)} KD","${order.paymentStatus}","${order.itemCount}","${order.customerName ?? 'N/A'}","${order.orderStatus}"');
      }

      final String csvContent = csvBuffer.toString();
      final String timestamp =
          DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final String fileName = 'orders_page${currentPage}_$timestamp.csv';

      final blob = web.Blob(
        [csvContent.toJS].toJS,
        web.BlobPropertyBag(type: 'text/csv;charset=utf-8'),
      );

      final url = web.URL.createObjectURL(blob);
      final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
      anchor.href = url;
      anchor.download = fileName;
      anchor.click();
      web.URL.revokeObjectURL(url);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                      'Page $currentPage exported (${currentPageOrders.length} orders)'),
                ),
              ],
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(width: 8),
                Text('Export failed: $e'),
              ],
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isExporting = false);
      }
    }
  }

  // EXPORT CURRENT PAGE TO EXCEL
  Future<void> _exportCurrentPageToExcel() async {
    setState(() => _isExporting = true);

    try {
      // Get only the current page orders
      final currentPageOrders = _orderDataSource.getCurrentPageOrders();
      final currentPage = _orderDataSource.getCurrentPageNumber();

      if (currentPageOrders.isEmpty) {
        throw Exception('No data on current page to export');
      }

      // Create workbook
      final Workbook workbook = Workbook();
      final Worksheet sheet = workbook.worksheets[0];

      // Headers
      sheet.getRangeByIndex(1, 1).setText('Order ID');
      sheet.getRangeByIndex(1, 2).setText('Created At');
      sheet.getRangeByIndex(1, 3).setText('Total Price');
      sheet.getRangeByIndex(1, 4).setText('Payment Status');
      sheet.getRangeByIndex(1, 5).setText('Items');
      sheet.getRangeByIndex(1, 6).setText('Customer Name');
      sheet.getRangeByIndex(1, 7).setText('Order Status');

      // Data rows - only current page
      int rowIndex = 2;
      for (var order in currentPageOrders) {
        sheet.getRangeByIndex(rowIndex, 1).setText(order.orderId);
        sheet
            .getRangeByIndex(rowIndex, 2)
            .setText(DateFormat('yyyy-MM-dd HH:mm').format(order.createdAt));
        sheet
            .getRangeByIndex(rowIndex, 3)
            .setText('${order.totalPrice.toStringAsFixed(2)} KD');
        sheet.getRangeByIndex(rowIndex, 4).setText(order.paymentStatus);
        sheet
            .getRangeByIndex(rowIndex, 5)
            .setNumber(order.itemCount.toDouble());
        sheet.getRangeByIndex(rowIndex, 6).setText(order.customerName ?? 'N/A');
        sheet.getRangeByIndex(rowIndex, 7).setText(order.orderStatus);
        rowIndex++;
      }

      // Auto-fit columns
      for (int i = 1; i <= 7; i++) {
        sheet.autoFitColumn(i);
      }

      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      final String timestamp =
          DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final String fileName = 'orders_page${currentPage}_$timestamp.xlsx';

      final Uint8List bytesData =
          bytes is Uint8List ? bytes : Uint8List.fromList(bytes);
      final blob = web.Blob(
        [bytesData.toJS].toJS,
        web.BlobPropertyBag(
            type:
                'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
      );

      final url = web.URL.createObjectURL(blob);
      final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
      anchor.href = url;
      anchor.download = fileName;
      anchor.click();
      web.URL.revokeObjectURL(url);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                      'Page $currentPage exported (${currentPageOrders.length} orders)'),
                ),
              ],
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(width: 8),
                Text('Export failed: $e'),
              ],
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isExporting = false);
      }
    }
  }

  void _showExportOptions() {
    final currentPage = _orderDataSource.getCurrentPageNumber();
    final currentPageOrders = _orderDataSource.getCurrentPageOrders();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            'Export Current Page',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Page $currentPage • ${currentPageOrders.length} orders',
                  style: FlutterFlowTheme.of(context).bodyMedium!.copyWith(
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ),
              ListTile(
                leading:
                    const Icon(Icons.table_chart, color: Color(0xFF1D6F42)),
                title: const Text('Export to Excel'),
                subtitle: const Text('Current page only • .xlsx format'),
                onTap: () {
                  Navigator.pop(dialogContext);
                  _exportCurrentPageToExcel();
                },
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.description, color: Color(0xFF1976D2)),
                title: const Text('Export to CSV'),
                subtitle: const Text('Current page only • .csv format'),
                onTap: () {
                  Navigator.pop(dialogContext);
                  _exportCurrentPageToCSV();
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
    final double pageCount = _rowsPerPage > 0
        ? (_orderDataSource.rowCount / _rowsPerPage).ceil().toDouble()
        : 1.0;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          // Export Button Bar
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      size: 20,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Page ${_orderDataSource.getCurrentPageNumber()} • ${_orderDataSource.getCurrentPageOrders().length} orders',
                      style: FlutterFlowTheme.of(context).bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF616161),
                          ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: _isExporting ? null : _showExportOptions,
                  icon: _isExporting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Icon(Icons.download, size: 18),
                  label: Text(_isExporting ? 'Exporting...' : 'Export Page'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                    disabledForegroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SfDataGrid(
              source: _orderDataSource,
              allowSorting: true,
              allowFiltering: true,
              columnWidthMode: ColumnWidthMode.fill,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              headerRowHeight: 40,
              columns: [
                GridColumn(
                  columnName: 'orderId',
                  allowSorting: true,
                  allowFiltering: false,
                  label: _buildHeaderCell('Order ID', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'createdAt',
                  allowSorting: true,
                  allowFiltering: true,
                  label: _buildHeaderCell('Created At', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'totalPrice',
                  allowSorting: true,
                  allowFiltering: true,
                  label: _buildHeaderCell('Total Price', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'paymentStatus',
                  allowSorting: false,
                  allowFiltering: true,
                  label:
                      _buildHeaderCell('Payment Status', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'itemCount',
                  allowSorting: true,
                  allowFiltering: true,
                  label: _buildHeaderCell('Items', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'customerName',
                  allowSorting: true,
                  allowFiltering: true,
                  label:
                      _buildHeaderCell('Customer Name', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'orderStatus',
                  allowSorting: false,
                  allowFiltering: true,
                  visible: false,
                  label: _buildHeaderCell('Order Status', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'documentId',
                  visible: false,
                  label: _buildHeaderCell('Document ID', Alignment.centerLeft),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: SfDataPager(
              controller: _pagerController,
              delegate: _orderDataSource,
              pageCount: pageCount,
              direction: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
