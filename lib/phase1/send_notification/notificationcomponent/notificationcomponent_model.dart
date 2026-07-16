import '/flutter_flow/flutter_flow_util.dart';
import 'notificationcomponent_widget.dart' show NotificationcomponentWidget;
import 'package:flutter/material.dart';

class NotificationcomponentModel
    extends FlutterFlowModel<NotificationcomponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for method widget.
  FocusNode? methodFocusNode;
  TextEditingController? methodTextController;
  String? Function(BuildContext, String?)? methodTextControllerValidator;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    methodFocusNode?.dispose();
    methodTextController?.dispose();
  }
}
