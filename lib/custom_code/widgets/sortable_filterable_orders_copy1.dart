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
import 'package:intl/intl.dart';

Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer
      .write(hexString.replaceFirst('#', '').replaceFirst('EBEBEB', 'EBEBEB'));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class Order {
  final String orderId;
  final DateTime createdAt;
  final double totalPrice;
  final String paymentStatus;
  final String orderStatus;

  Order({
    required this.orderId,
    required this.createdAt,
    required this.totalPrice,
    required this.paymentStatus,
    required this.orderStatus,
  });

  static Order fromRecord(OrdersRecord record) {
    return Order(
      orderId: record.orderId ?? record.reference.id,
      createdAt: record.createdAt ?? DateTime.now(),
      totalPrice: record.totalPrice?.toDouble() ?? 0,
      paymentStatus: record.paymentStatus ?? 'Unknown',
      orderStatus: record.orderStatus ?? 'Pending',
    );
  }
}

class OrderDataSource extends DataGridSource {
  final BuildContext context;
  final List<Order> _originalOrders;
  List<Order> _sortedOrders = [];
  int rowsPerPage;
  int startIndex = 0;
  List<DataGridRow> _paginatedRows = [];

  OrderDataSource({
    required this.context,
    required List<Order> orders,
    required this.rowsPerPage,
  }) : _originalOrders = orders {
    _sortedOrders = List.from(_originalOrders);
    buildRows();
  }

  void buildRows() {
    int actualRows = _sortedOrders.length;
    if (actualRows == 0) {
      _paginatedRows = [];
      return;
    }
    if (startIndex >= actualRows) {
      startIndex = 0;
    }
    int end = startIndex + rowsPerPage;
    if (end > actualRows) end = actualRows;

    final currentPageItems = _sortedOrders.sublist(startIndex, end);

    _paginatedRows = currentPageItems.map((order) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'orderId', value: order.orderId),
        DataGridCell<DateTime>(columnName: 'createdAt', value: order.createdAt),
        DataGridCell<double>(columnName: 'totalPrice', value: order.totalPrice),
        DataGridCell<String>(
            columnName: 'paymentStatus', value: order.paymentStatus),
        DataGridCell<String>(
            columnName: 'orderStatus', value: order.orderStatus),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _paginatedRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        final isTotalPrice = cell.columnName == 'totalPrice';
        final isOrderId = cell.columnName == 'orderId';

        TextStyle style = FlutterFlowTheme.of(context).bodyMedium!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            );

        if (isTotalPrice || isOrderId)
          style = style.copyWith(fontWeight: FontWeight.w500);
        if (isOrderId)
          style = style.copyWith(decoration: TextDecoration.underline);

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          alignment:
              isTotalPrice ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            _formatCell(cell),
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
        );
      }).toList(),
    );
  }

  String _formatCell(DataGridCell cell) {
    if (cell.columnName == 'totalPrice') {
      return '${cell.value.toStringAsFixed(2)} KD';
    } else if (cell.columnName == 'createdAt' && cell.value is DateTime) {
      return DateFormat('yyyy-MM-dd HH:mm').format(cell.value);
    }
    return cell.value.toString();
  }

  @override
  Future<void> sort() async {
    if (sortedColumns.isNotEmpty) {
      final sortColumn = sortedColumns.first;
      _sortedOrders.sort((a, b) {
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
    } else {
      _sortedOrders = List.from(_originalOrders);
    }
    startIndex = 0;
    buildRows();
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
  int get rowCount => _sortedOrders.length;
}

class SortableFilterableOrders extends StatefulWidget {
  const SortableFilterableOrders({
    super.key,
    required this.width,
    required this.height,
    required this.orders,
    this.rowsPerPage,
  });

  final double width;
  final double height;
  final List<OrdersRecord> orders;
  final int? rowsPerPage;

  @override
  State<SortableFilterableOrders> createState() =>
      _SortableFilterableOrdersWidgetState();
}

class _SortableFilterableOrdersWidgetState
    extends State<SortableFilterableOrders> {
  late OrderDataSource _orderDataSource;
  late DataPagerController _pagerController;
  late int _rowsPerPage;

  @override
  void initState() {
    super.initState();
    _rowsPerPage = widget.rowsPerPage ?? 10;
    _pagerController = DataPagerController();

    _orderDataSource = OrderDataSource(
      context: context,
      orders: widget.orders.map((r) => Order.fromRecord(r)).toList(),
      rowsPerPage: _rowsPerPage,
    );
  }

  @override
  void didUpdateWidget(covariant SortableFilterableOrders oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.orders != oldWidget.orders ||
        widget.rowsPerPage != oldWidget.rowsPerPage) {
      _rowsPerPage = widget.rowsPerPage ?? 10;
      _orderDataSource = OrderDataSource(
        context: context,
        orders: widget.orders.map((r) => Order.fromRecord(r)).toList(),
        rowsPerPage: _rowsPerPage,
      );
      _pagerController.selectedPageIndex = 0;
    }
  }

  Widget _buildHeaderCell(String text, Alignment alignment) {
    final Color headerBgColor = hexToColor('EBEBEB');
    final TextStyle headerTextStyle =
        FlutterFlowTheme.of(context).titleSmall!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              color: Colors.black,
            );

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: alignment,
      decoration: BoxDecoration(
        color: headerBgColor,
        border: Border(
          right: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1,
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
          Expanded(
            child: SfDataGrid(
              source: _orderDataSource,
              allowSorting: true,
              allowFiltering: false,
              columnWidthMode: ColumnWidthMode.fill,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              headerRowHeight: 40,
              columns: [
                GridColumn(
                  columnName: 'orderId',
                  allowSorting: true,
                  label: _buildHeaderCell('Order ID', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'createdAt',
                  allowSorting: true,
                  label: _buildHeaderCell('Created At', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'totalPrice',
                  allowSorting: true,
                  label: _buildHeaderCell('Total Price', Alignment.centerRight),
                ),
                GridColumn(
                  columnName: 'paymentStatus',
                  allowSorting: false,
                  label:
                      _buildHeaderCell('Payment Status', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'orderStatus',
                  allowSorting: false,
                  label: _buildHeaderCell('Order Status', Alignment.centerLeft),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: SfDataPager(
              controller: _pagerController,
              delegate: _orderDataSource,
              pageCount: pageCount,
              // REMOVED: rowsPerPage: _rowsPerPage (This line was causing the error)
              direction: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
