import '/flutter_flow/flutter_flow_util.dart';
import '/phase2/ui/order_action/order_action_widget.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  Local state fields for this component.

  bool status = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Model for OrderAction component.
  late OrderActionModel orderActionModel;

  @override
  void initState(BuildContext context) {
    orderActionModel = createModel(context, () => OrderActionModel());
  }

  @override
  void dispose() {
    orderActionModel.dispose();
  }
}
