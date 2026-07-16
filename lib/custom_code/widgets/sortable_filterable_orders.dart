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

// Syncfusion Imports - CORRECTED IMPORTS
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//import 'package:syncfusion_flutter_datagrid_pager/datagrid_pager.dart';
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
  // NEW: Customer Fields
  final DocumentReference? customerRef;
  String? customerName; // Mutable for lookup update

  Order({
    required this.documentId,
    required this.orderId,
    required this.createdAt,
    required this.totalPrice,
    required this.paymentStatus,
    required this.itemCount,
    required this.orderStatus,
    // NEW: Customer Fields
    this.customerRef,
    this.customerName,
  });

  static Order fromRecord(OrdersRecord record) {
    // START ITEM COUNT CALCULATION LOGIC
    int calculatedItemCount = 0;

    // record.orderItems is a UserCartStruct.
    final UserCartStruct? orderItemsStruct = record.orderItems;

    if (orderItemsStruct != null) {
      // Use List<dynamic>? to safely access the 'cart_items' list from the struct
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
      // NEW: Extract customer reference
      customerRef: record.customerRef,
      customerName: null, // Will be populated by the State class
    );
  }
}

// --- 2. DataGridSource with Styling and Interaction ---
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
        // NEW: Filtering for Customer Name
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
          // NEW: Sorting for Customer Name
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

    // 3. PAGINATION: Updates the rows to show the current page
    buildRows();
  }

  // Slices the current _filteredAndSortedOrders list for the page view
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
        // CELL FOR ITEM COUNT
        DataGridCell<int>(columnName: 'itemCount', value: order.itemCount),
        // NEW CELL: Customer Name
        DataGridCell<String>(
            columnName: 'customerName', value: order.customerName ?? 'N/A'),
        // END NEW CELL
        DataGridCell<String>(
            columnName: 'orderStatus', value: order.orderStatus),
        // CRITICAL: Add the Document ID as a hidden cell
        DataGridCell<String>(columnName: 'documentId', value: order.documentId),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _paginatedRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    // CRITICAL FIX: Extract the actual Document ID from the row
    final documentIdCell = row.getCells().firstWhere(
          (cell) => cell.columnName == 'documentId',
        );
    final documentId = documentIdCell.value.toString();

    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        final isTotalPrice = cell.columnName == 'totalPrice';
        final isOrderId = cell.columnName == 'orderId';
        final isItemCount = cell.columnName == 'itemCount';
        final isCustomerName = cell.columnName == 'customerName'; // NEW

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
            // Call the passed-down function to build the badge
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

        if (isTotalPrice ||
            isOrderId ||
            isItemCount ||
            isCustomerName) // MODIFIED
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

  // Format cell function to handle the new integer type
  String _formatCell(DataGridCell cell) {
    if (cell.columnName == 'totalPrice') {
      return '${cell.value.toStringAsFixed(2)} KD';
    } else if (cell.columnName == 'createdAt' && cell.value is DateTime) {
      return DateFormat('yyyy-MM-dd HH:mm').format(cell.value);
    } else if (cell.columnName == 'itemCount' && cell.value is int) {
      // Item Count formatting
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

  // NOTE: getFilterValues override was removed because it is not supported
  // by your version of DataGridSource, causing the "undefined_super_member" error.
  // The filtering still works based on the logic in _applyFilteringAndSorting.

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
class SortableFilterableOrders extends StatefulWidget {
  const SortableFilterableOrders({
    super.key,
    required this.width,
    required this.height,
    required this.orders,
    this.rowsPerPage,
    // NEW PARAMETER: Users Records
    this.users,
  });

  final double width;
  final double height;
  final List<OrdersRecord> orders;
  final int? rowsPerPage;
  final List<UsersRecord>? users; // The list of users for lookup

  @override
  State<SortableFilterableOrders> createState() =>
      _SortableFilterableOrdersWidgetState();
}

class _SortableFilterableOrdersWidgetState
    extends State<SortableFilterableOrders> {
  late OrderDataSource _orderDataSource;
  late DataPagerController _pagerController;
  late int _rowsPerPage;

  // NEW METHOD: Synchronously maps order records to customer names
  List<Order> _mapOrdersToUsers(
      List<OrdersRecord> orderRecords, List<UsersRecord>? userRecords) {
    final List<Order> orders =
        orderRecords.map((r) => Order.fromRecord(r)).toList();

    // 1. Create a fast lookup map: DocumentReference -> DisplayName
    final Map<DocumentReference, String> userLookup = {};
    if (userRecords != null) {
      for (var user in userRecords) {
        if (user.displayName != null && user.reference != null) {
          userLookup[user.reference] = user.displayName!;
        }
      }
    }

    // 2. Iterate through orders and assign the name
    for (var order in orders) {
      if (order.customerRef != null) {
        // Find the name in the map using the customerRef
        final String? name = userLookup[order.customerRef];
        order.customerName = name ?? 'User Deleted';
      } else {
        order.customerName = 'N/A';
      }
    }

    return orders;
  }

  // HELPER FUNCTION: Creates the styled badge widget (unchanged)
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

  // NAVIGATION FUNCTION (to Order-Details page)
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

    // NEW: Map orders to users before creating the data source
    final List<Order> ordersWithNames =
        _mapOrdersToUsers(widget.orders, widget.users);

    _orderDataSource = _createDataSource(
      ordersWithNames,
      _rowsPerPage,
    );
  }

  @override
  void didUpdateWidget(covariant SortableFilterableOrders oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.orders != oldWidget.orders ||
        widget.rowsPerPage != oldWidget.rowsPerPage ||
        widget.users != oldWidget.users) {
      _rowsPerPage = widget.rowsPerPage ?? 10;

      // NEW: Map orders to users again
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
              allowFiltering: true,
              columnWidthMode: ColumnWidthMode.fill,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              headerRowHeight: 40,
              columns: [
                GridColumn(
                  columnName: 'orderId',
                  allowSorting: true,
                  allowFiltering:
                      false, // Typically false for ID/Search columns
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
                // NEW COLUMN: Customer Name
                GridColumn(
                  columnName: 'customerName',
                  allowSorting: true,
                  allowFiltering: true,
                  label:
                      _buildHeaderCell('Customer Name', Alignment.centerLeft),
                ),
                // END NEW COLUMN
                GridColumn(
                  columnName: 'orderStatus',
                  allowSorting: false,
                  allowFiltering: true,
                  visible: false,
                  label: _buildHeaderCell('Order Status', Alignment.centerLeft),
                ),
                // HIDDEN COLUMN: Document ID for navigation
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
