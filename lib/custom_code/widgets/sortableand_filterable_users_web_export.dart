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
// Modern web import (replaces dart:html)
import 'package:web/web.dart' as web;
import 'dart:js_interop';

// --- 1. Local Data Model ---
class AppUser {
  final String documentId;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String status;
  final DateTime createdTime;

  AppUser({
    required this.documentId,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.status,
    required this.createdTime,
  });

  static AppUser fromRecord(UsersRecord record) {
    return AppUser(
      documentId: record.reference.id,
      name: record.displayName.isNotEmpty ? record.displayName : '-',
      email: record.email.isNotEmpty ? record.email : '-',
      phone: record.phoneNumber.isNotEmpty ? record.phoneNumber : '-',
      role: record.userRole.isNotEmpty ? record.userRole : '-',
      status: record.status.isNotEmpty ? record.status : '-',
      createdTime: record.createdTime ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}

// --- 2. DataGridSource (Non-Paginated) ---
class UserDataSource extends DataGridSource {
  final BuildContext context;
  final List<AppUser> _originalUsers;
  final bool showRole;
  final Widget Function(String status) buildStatusBadge;

  List<AppUser> _filteredAndSortedUsers = [];
  List<DataGridRow> _dataGridRows = [];

  List<FilterCondition> currentFilters = [];

  UserDataSource({
    required this.context,
    required List<AppUser> users,
    required this.showRole,
    required this.buildStatusBadge,
  }) : _originalUsers = users {
    _applyFilteringAndSorting();
  }

  bool _filterRow(AppUser user) {
    if (currentFilters.isEmpty) {
      return true;
    }
    for (var condition in currentFilters) {
      final dynamic effectiveCondition =
          (condition as dynamic).filterCondition ?? condition;
      dynamic columnValue;
      switch (effectiveCondition.columnName) {
        case 'name':
          columnValue = user.name;
          break;
        case 'email':
          columnValue = user.email;
          break;
        case 'phone':
          columnValue = user.phone;
          break;
        case 'role':
          columnValue = user.role;
          break;
        case 'createdTime':
          columnValue = user.createdTime;
          break;
        case 'status':
          columnValue = user.status;
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
    List<AppUser> currentList = List.from(_originalUsers);

    if (currentFilters.isNotEmpty) {
      currentList = currentList.where((user) => _filterRow(user)).toList();
    }

    if (sortedColumns.isNotEmpty) {
      final sortColumn = sortedColumns.first;
      currentList.sort((a, b) {
        dynamic valueA;
        dynamic valueB;
        switch (sortColumn.name) {
          case 'name':
            valueA = a.name;
            valueB = b.name;
            break;
          case 'email':
            valueA = a.email;
            valueB = b.email;
            break;
          case 'phone':
            valueA = a.phone;
            valueB = b.phone;
            break;
          case 'role':
            valueA = a.role;
            valueB = b.role;
            break;
          case 'createdTime':
            valueA = a.createdTime;
            valueB = b.createdTime;
            break;
          case 'status':
            valueA = a.status;
            valueB = b.status;
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
    _filteredAndSortedUsers = currentList;

    _buildDataGridRows();
  }

  void _buildDataGridRows() {
    _dataGridRows = _filteredAndSortedUsers.map((user) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'name', value: user.name),
        DataGridCell<String>(columnName: 'email', value: user.email),
        DataGridCell<String>(columnName: 'phone', value: user.phone),
        if (showRole) DataGridCell<String>(columnName: 'role', value: user.role),
        DataGridCell<DateTime>(
            columnName: 'createdTime', value: user.createdTime),
        DataGridCell<String>(columnName: 'status', value: user.status),
        // Hidden cell
        DataGridCell<String>(columnName: 'documentId', value: user.documentId),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        // Skip building a widget for the hidden documentId cell
        if (cell.columnName == 'documentId') {
          return Container();
        }

        // Status Badge Logic
        if (cell.columnName == 'status') {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            alignment: Alignment.centerLeft,
            child: buildStatusBadge(cell.value.toString()),
          );
        }

        TextStyle style = FlutterFlowTheme.of(context).bodyMedium!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.3,
              fontFamily: 'Inter',
            );

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          alignment: Alignment.centerLeft,
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
    if (cell.columnName == 'createdTime' && cell.value is DateTime) {
      final DateTime value = cell.value as DateTime;
      if (value.millisecondsSinceEpoch == 0) {
        return '-';
      }
      return DateFormat('yyyy-MM-dd HH:mm').format(value);
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
  int get rowCount => _filteredAndSortedUsers.length;

  String documentIdForRowIndex(int rowIndex) {
    if (rowIndex < 0 || rowIndex >= _dataGridRows.length) {
      return '';
    }
    return _dataGridRows[rowIndex]
        .getCells()
        .firstWhere((cell) => cell.columnName == 'documentId')
        .value
        .toString();
  }
}

/// --- 3. Custom Widget Main Class ---
class SortableandFilterableUsersWebExport extends StatefulWidget {
  const SortableandFilterableUsersWebExport({
    super.key,
    this.width,
    this.height,
    required this.users,
    this.showRole = false,
    this.navTitle = 'Users',
  });

  final double? width;
  final double? height;
  final List<UsersRecord> users;
  final bool showRole;
  final String navTitle;

  @override
  State<SortableandFilterableUsersWebExport> createState() =>
      _SortableandFilterableUsersWebExportState();
}

class _SortableandFilterableUsersWebExportState
    extends State<SortableandFilterableUsersWebExport> {
  late UserDataSource _userDataSource;
  final GlobalKey<SfDataGridState> _dataGridKey = GlobalKey<SfDataGridState>();
  bool _isExporting = false;

  Widget _buildStatusBadge(String status) {
    final String normalized = status.toUpperCase();

    final Color bgColor = () {
      if (normalized == 'ACTIVE' || normalized == 'ACCEPTED') {
        return const Color(0xFFCCFFC7);
      } else if (normalized == 'DEACTIVE' ||
          normalized == 'INACTIVE' ||
          normalized == 'BLOCKED' ||
          normalized == 'REJECTED') {
        return const Color(0xFFFDEAEA);
      } else if (normalized == 'PENDING') {
        return const Color(0xFFFFD6A4);
      } else {
        return const Color(0xFFF1F1F1);
      }
    }();

    final Color dotColor = () {
      if (normalized == 'ACTIVE' || normalized == 'ACCEPTED') {
        return const Color(0xFF78FF6A);
      } else if (normalized == 'DEACTIVE' ||
          normalized == 'INACTIVE' ||
          normalized == 'BLOCKED' ||
          normalized == 'REJECTED') {
        return const Color(0xFFD92D20);
      } else if (normalized == 'PENDING') {
        return const Color(0xFFFFB800);
      } else {
        return const Color(0xFF6B7280);
      }
    }();

    final Color borderColor = () {
      if (normalized == 'ACTIVE' || normalized == 'ACCEPTED') {
        return const Color(0xFF78FF6A);
      } else if (normalized == 'DEACTIVE' ||
          normalized == 'INACTIVE' ||
          normalized == 'BLOCKED' ||
          normalized == 'REJECTED') {
        return const Color(0xFFFCA5A5);
      } else if (normalized == 'PENDING') {
        return const Color(0xFFFFB800);
      } else {
        return FlutterFlowTheme.of(context).secondaryText;
      }
    }();

    final Color textColor = () {
      if (normalized == 'ACTIVE' || normalized == 'ACCEPTED') {
        return const Color(0xFF109B05);
      } else if (normalized == 'DEACTIVE' ||
          normalized == 'INACTIVE' ||
          normalized == 'BLOCKED' ||
          normalized == 'REJECTED') {
        return const Color(0xFFD92D20);
      } else if (normalized == 'PENDING') {
        return const Color(0xFFFFB800);
      } else {
        return FlutterFlowTheme.of(context).secondaryText;
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
              status,
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

  // NAVIGATION FUNCTION
  void _navigateToUser(String docRef) async {
    if (docRef.isEmpty) return;
    final docReference =
        FirebaseFirestore.instance.collection('users').doc(docRef);
    context.pushNamed(
      'Customer-details',
      queryParameters: {
        'customer': serializeParam(
          docReference,
          ParamType.DocumentReference,
        ),
        'title': serializeParam(
          widget.navTitle,
          ParamType.String,
        ),
      }.withoutNulls,
    );
  }

  UserDataSource _createDataSource(List<AppUser> users) {
    return UserDataSource(
      context: context,
      users: users,
      showRole: widget.showRole,
      buildStatusBadge: _buildStatusBadge,
    );
  }

  @override
  void initState() {
    super.initState();
    _userDataSource = _createDataSource(
      widget.users.map((r) => AppUser.fromRecord(r)).toList(),
    );
  }

  @override
  void didUpdateWidget(
      covariant SortableandFilterableUsersWebExport oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.users != oldWidget.users ||
        widget.showRole != oldWidget.showRole) {
      _userDataSource = _createDataSource(
        widget.users.map((r) => AppUser.fromRecord(r)).toList(),
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

  Future<void> _exportToExcelWeb() async {
    setState(() => _isExporting = true);

    try {
      final Workbook workbook =
          _dataGridKey.currentState!.exportToExcelWorkbook(
        exportColumnWidth: true,
        exportRowHeight: true,
      );

      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      final String timestamp =
          DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final String fileName =
          '${widget.navTitle.toLowerCase()}_export_$timestamp.xlsx';

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
                Text('Excel file "$fileName" downloaded successfully!'),
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

  Future<void> _exportToCSVWeb() async {
    setState(() => _isExporting = true);

    try {
      final rows = _userDataSource.rows;

      final StringBuffer csvBuffer = StringBuffer();
      csvBuffer.write('\uFEFF');

      csvBuffer.writeln(widget.showRole
          ? 'Name,Email,Phone,Role,Joined,Status'
          : 'Name,Email,Phone,Joined,Status');

      for (var row in rows) {
        final cells = row.getCells();
        String cellValue(String columnName) => cells
            .firstWhere((c) => c.columnName == columnName)
            .value
            .toString();

        final name = cellValue('name');
        final email = cellValue('email');
        final phone = cellValue('phone');
        final createdRaw = cells
            .firstWhere((c) => c.columnName == 'createdTime')
            .value;
        final status = cellValue('status');

        final formattedDate = createdRaw is DateTime &&
                createdRaw.millisecondsSinceEpoch != 0
            ? DateFormat('yyyy-MM-dd HH:mm').format(createdRaw)
            : '-';

        if (widget.showRole) {
          final role = cellValue('role');
          csvBuffer.writeln(
              '"$name","$email","$phone","$role","$formattedDate","$status"');
        } else {
          csvBuffer.writeln(
              '"$name","$email","$phone","$formattedDate","$status"');
        }
      }

      final String csvContent = csvBuffer.toString();
      final String timestamp =
          DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final String fileName =
          '${widget.navTitle.toLowerCase()}_export_$timestamp.csv';

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
                Text('CSV file "$fileName" downloaded successfully!'),
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
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            'Export ${widget.navTitle}',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading:
                    const Icon(Icons.table_chart, color: Color(0xFF1D6F42)),
                title: const Text('Export to Excel'),
                subtitle:
                    Text('${_userDataSource.rowCount} rows • .xlsx format'),
                onTap: () {
                  Navigator.pop(dialogContext);
                  _exportToExcelWeb();
                },
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.description, color: Color(0xFF1976D2)),
                title: const Text('Export to CSV'),
                subtitle:
                    Text('${_userDataSource.rowCount} rows • .csv format'),
                onTap: () {
                  Navigator.pop(dialogContext);
                  _exportToCSVWeb();
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
                      Icons.people_alt_outlined,
                      size: 20,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Total: ${_userDataSource.rowCount} ${widget.navTitle.toLowerCase()}',
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
                  label: Text(_isExporting ? 'Exporting...' : 'Export'),
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
          // DataGrid
          Expanded(
            child: SfDataGrid(
              key: _dataGridKey,
              source: _userDataSource,
              allowSorting: true,
              allowFiltering: true,
              columnWidthMode: ColumnWidthMode.fill,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              headerRowHeight: 40,
              onCellTap: (details) {
                final dataRowIndex = details.rowColumnIndex.rowIndex - 1;
                if (dataRowIndex < 0) return;
                _navigateToUser(
                    _userDataSource.documentIdForRowIndex(dataRowIndex));
              },
              columns: [
                GridColumn(
                  columnName: 'name',
                  allowSorting: true,
                  allowFiltering: true,
                  label: _buildHeaderCell('Name', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'email',
                  allowSorting: true,
                  allowFiltering: true,
                  label: _buildHeaderCell('Email', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'phone',
                  allowSorting: true,
                  allowFiltering: true,
                  label: _buildHeaderCell('Phone', Alignment.centerLeft),
                ),
                if (widget.showRole)
                  GridColumn(
                    columnName: 'role',
                    allowSorting: true,
                    allowFiltering: true,
                    label: _buildHeaderCell('Role', Alignment.centerLeft),
                  ),
                GridColumn(
                  columnName: 'createdTime',
                  allowSorting: true,
                  allowFiltering: true,
                  label: _buildHeaderCell('Joined', Alignment.centerLeft),
                ),
                GridColumn(
                  columnName: 'status',
                  allowSorting: true,
                  allowFiltering: true,
                  label: _buildHeaderCell('Status', Alignment.centerLeft),
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
