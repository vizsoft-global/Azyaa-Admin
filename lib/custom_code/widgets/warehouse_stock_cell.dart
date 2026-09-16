// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/store_valley/store_valley_inventory_record.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

enum WarehouseStockField {
  stored,
  available,
  availableForOrder,
}

class WarehouseStockCell extends StatelessWidget {
  const WarehouseStockCell({
    super.key,
    required this.productId,
    this.sku,
    required this.field,
    this.showLabel = false,
    this.reserved = 0,
    this.unavailable = 0,
    this.width,
    this.height,
  });

  final String productId;
  final String? sku;
  final WarehouseStockField field;
  final bool showLabel;
  final int reserved;
  final int unavailable;
  final double? width;
  final double? height;

  String get _label {
    switch (field) {
      case WarehouseStockField.stored:
        return 'Warehouse stored';
      case WarehouseStockField.available:
        return 'Warehouse available';
      case WarehouseStockField.availableForOrder:
        return 'Available for order';
    }
  }

  String _valueText(StoreValleyInventoryRecord record) {
    switch (field) {
      case WarehouseStockField.stored:
        return record.storedQuantity.toString();
      case WarehouseStockField.available:
        return record.available.toString();
      case WarehouseStockField.availableForOrder:
        return StoreValleyInventoryRecord.availableForOrder(
          stored: record.storedQuantity,
          reserved: reserved,
          unavailable: unavailable,
        ).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StoreValleyInventoryRecord?>(
      stream: StoreValleyInventoryRecord.watch(
        productId: productId,
        sku: sku,
      ),
      builder: (context, snapshot) {
        final record = snapshot.data;
        final text = record == null ? '-' : _valueText(record);
        final updated = record?.updatedAt ?? record?.asOf;
        final tooltip = updated == null
            ? _label
            : '$_label · ${DateFormat('MMM d, HH:mm').format(updated)}';
        final valueStyle = FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              fontSize: showLabel ? 16.0 : 12.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            );
        final child = showLabel
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _label,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(text, style: valueStyle),
                ],
              )
            : Text(text, style: valueStyle);
        return SizedBox(
          width: width,
          height: height,
          child: Tooltip(message: tooltip, child: child),
        );
      },
    );
  }
}
