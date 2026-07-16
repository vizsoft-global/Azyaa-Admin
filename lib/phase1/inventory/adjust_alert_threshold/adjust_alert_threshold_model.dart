import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'adjust_alert_threshold_widget.dart' show AdjustAlertThresholdWidget;
import 'package:flutter/material.dart';

class AdjustAlertThresholdModel
    extends FlutterFlowModel<AdjustAlertThresholdWidget> {
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

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for QuantityControl widget.
  FocusNode? quantityControlFocusNode;
  TextEditingController? quantityControlTextController;
  String? Function(BuildContext, String?)?
      quantityControlTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  InventoryRecord? inventoryDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    quantityControlFocusNode?.dispose();
    quantityControlTextController?.dispose();
  }
}
