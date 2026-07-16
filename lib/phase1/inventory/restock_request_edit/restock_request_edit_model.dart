import '/flutter_flow/flutter_flow_util.dart';
import 'restock_request_edit_widget.dart' show RestockRequestEditWidget;
import 'package:flutter/material.dart';

class RestockRequestEditModel
    extends FlutterFlowModel<RestockRequestEditWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for quanity widget.
  FocusNode? quanityFocusNode;
  TextEditingController? quanityTextController;
  String? Function(BuildContext, String?)? quanityTextControllerValidator;
  String? _quanityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '38wquncj' /* product_quantity is required */,
      );
    }

    return null;
  }

  // State field(s) for method widget.
  FocusNode? methodFocusNode;
  TextEditingController? methodTextController;
  String? Function(BuildContext, String?)? methodTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;

  @override
  void initState(BuildContext context) {
    quanityTextControllerValidator = _quanityTextControllerValidator;
  }

  @override
  void dispose() {
    quanityFocusNode?.dispose();
    quanityTextController?.dispose();

    methodFocusNode?.dispose();
    methodTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }
}
