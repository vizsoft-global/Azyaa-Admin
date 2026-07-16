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

  Order({
    required this.documentId,
    required this.orderId,
    required this.createdAt,
    required this.totalPrice,
    required this.paymentStatus,
    required this.itemCount,
    required this.orderStatus,
  });

  static Order fromRecord(OrdersRecord record) {
    // START ITEM COUNT CALCULATION LOGIC
    int calculatedItemCount = 0;

    final UserCartStruct? orderItemsStruct = record.orderItems;

    if (orderItemsStruct != null) {
      final List<dynamic>? cartItemsList = orderItemsStruct.cartItems;
      calculatedItemCount = cartItemsList?.length ?? 0;
    }
    // END ITEM COUNT CALCULATION LOGIC

    return Order(
      documentId: record.reference.id,
      orderId: record.orderId ?? 'N/A',
      createdAt: record.createdAt ?? DateTime.now(),
      totalPrice: record.totalPrice?.toDouble() ?? 0,
      paymentStatus: record.paymentStatus ?? 'UNKNOWN',
      itemCount: calculatedItemCount,
      orderStatus: record.orderStatus ?? 'Pending',
    );
  }
}

// --- 2. DataGridSource (Non-Paginated) ---
class OrderDataSource extends DataGridSource {
  final BuildContext context;
  final List<Order> _originalOrders;
  final Function(String docRef) onOrderIdTap;
  final Widget Function(String status) buildPaymentStatusBadge;

  // The list that holds the final, filtered, and sorted rows (ALL ROWS)
  List<Order> _filteredAndSortedOrders = [];
  // The list of DataGridRow objects to be displayed
  List<DataGridRow> _dataGridRows = [];

  List<FilterCondition> currentFilters = [];

  OrderDataSource({
    required this.context,
    required List<Order> orders,
    required this.onOrderIdTap,
    required this.buildPaymentStatusBadge,
  }) : _originalOrders = orders {
    _applyFilteringAndSorting();
  }

  // Helper to check if a row matches ALL currently applied filters
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

  // Applies filters, then sorting, then calls buildRows
  void _applyFilteringAndSorting() {
    List<Order> currentList = List.from(_originalOrders);

    // 1. FILTERING: Filters the ENTIRE collection
    if (currentFilters.isNotEmpty) {
      currentList = currentList.where((order) => _filterRow(order)).toList();
    }

    // 2. SORTING: Sorts the filtered results
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

    // 3. BUILD ROWS: Build DataGridRows for ALL results
    _buildDataGridRows();
  }

  // Builds DataGridRows for ALL filtered/sorted items (no slicing)
  void _buildDataGridRows() {
    _dataGridRows = _filteredAndSortedOrders.map((order) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'orderId', value: order.orderId),
        DataGridCell<DateTime>(columnName: 'createdAt', value: order.createdAt),
        DataGridCell<double>(columnName: 'totalPrice', value: order.totalPrice),
        DataGridCell<String>(
            columnName: 'paymentStatus', value: order.paymentStatus),
        DataGridCell<int>(columnName: 'itemCount', value: order.itemCount),
        DataGridCell<String>(
            columnName: 'orderStatus', value: order.orderStatus),
        // Hidden cell
        DataGridCell<String>(columnName: 'documentId', value: order.documentId),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

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

        // Skip building a widget for the hidden documentId cell
        if (cell.columnName == 'documentId') {
          return Container();
        }

        // Payment Status Badge Logic
        if (cell.columnName == 'paymentStatus') {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            alignment: Alignment.centerLeft,
            child: buildPaymentStatusBadge(cell.value.toString()),
          );
        }

        // Default styling for other columns
        TextStyle style = FlutterFlowTheme.of(context).bodyMedium!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.3,
              fontFamily: 'Inter',
            );

        if (isTotalPrice || isOrderId || isItemCount)
          style = style.copyWith(fontWeight: FontWeight.w500);

        Widget cellContent = Text(
          _formatCell(cell),
          overflow: TextOverflow.ellipsis,
          style: style,
        );

        // Order ID Tap Logic
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
    _applyFilteringAndSorting();
    notifyListeners();
    return true;
  }

  @override
  Future<void> sort() async {
    _applyFilteringAndSorting();
    notifyListeners();
  }

  @override
  int get rowCount => _filteredAndSortedOrders.length;

  // *** Removed handlePageChange override ***
}

/// --- 3.
///
/// Custom Widget Main Class ---
class SortableandFilterableOrdersWithoutPage extends StatefulWidget {
  // <--- NEW NAME
  const SortableandFilterableOrdersWithoutPage({
    super.key,
    required this.width,
    required this.height,
    required this.orders,
  });

  final double width;
  final double height;
  final List<OrdersRecord> orders;

  @override
  State<SortableandFilterableOrdersWithoutPage>
      createState() => // <--- NEW NAME
          _SortableandFilterableOrdersWithoutPageState(); // <--- NEW STATE NAME
}

class _SortableandFilterableOrdersWithoutPageState // <--- NEW STATE NAME
    extends State<SortableandFilterableOrdersWithoutPage> {
  // <--- NEW WIDGET NAME
  late OrderDataSource _orderDataSource;

  Widget _buildPaymentStatusBadge(String status) {
    // Standardize status string for comparison (e.g., "CAPTURED" vs "Paid")
    final String paymentStatus = status.toUpperCase();

    // Mapping for colors and text
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

    // Widget rendering
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
            // Colored Dot
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: dotColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(width: 4), // Spacing between dot and text
            Text(
              displayText,
              style: FlutterFlowTheme.of(context).bodyMedium!.copyWith(
                    color: textColor,
                    fontSize:
                        12, // Adjusted font size to match the provided snippet
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

  // NAVIGATION FUNCTION
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

  // Helper method to create the OrderDataSource
  OrderDataSource _createDataSource(List<Order> orders) {
    return OrderDataSource(
      context: context,
      orders: orders,
      onOrderIdTap: _navigateToOrder,
      buildPaymentStatusBadge: _buildPaymentStatusBadge,
    );
  }

  @override
  void initState() {
    super.initState();
    _orderDataSource = _createDataSource(
      widget.orders.map((r) => Order.fromRecord(r)).toList(),
    );
  }

  @override
  void didUpdateWidget(
      covariant SortableandFilterableOrdersWithoutPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.orders != oldWidget.orders) {
      _orderDataSource = _createDataSource(
        widget.orders.map((r) => Order.fromRecord(r)).toList(),
      );
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
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
                  columnName: 'orderStatus',
                  allowSorting: false,
                  allowFiltering: true,
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
        ],
      ),
    );
  }
}
