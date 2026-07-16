import '/flutter_flow/flutter_flow_util.dart';
import 'message_widget.dart' show MessageWidget;
import 'package:flutter/material.dart';

class MessageModel extends FlutterFlowModel<MessageWidget> {
  ///  Local state fields for this component.

  List<String> thresholdReason = ['Threshold change'];
  void addToThresholdReason(String item) => thresholdReason.add(item);
  void removeFromThresholdReason(String item) => thresholdReason.remove(item);
  void removeAtIndexFromThresholdReason(int index) =>
      thresholdReason.removeAt(index);
  void insertAtIndexInThresholdReason(int index, String item) =>
      thresholdReason.insert(index, item);
  void updateThresholdReasonAtIndex(int index, Function(String) updateFn) =>
      thresholdReason[index] = updateFn(thresholdReason[index]);

  List<String> stockReason = ['Restocking', 'Stock Adjustment'];
  void addToStockReason(String item) => stockReason.add(item);
  void removeFromStockReason(String item) => stockReason.remove(item);
  void removeAtIndexFromStockReason(int index) => stockReason.removeAt(index);
  void insertAtIndexInStockReason(int index, String item) =>
      stockReason.insert(index, item);
  void updateStockReasonAtIndex(int index, Function(String) updateFn) =>
      stockReason[index] = updateFn(stockReason[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
