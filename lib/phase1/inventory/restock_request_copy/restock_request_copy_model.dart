import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'restock_request_copy_widget.dart' show RestockRequestCopyWidget;
import 'package:flutter/material.dart';

class RestockRequestCopyModel
    extends FlutterFlowModel<RestockRequestCopyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  String? _quantityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '381virfq' /* Quantity is required */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for method widget.
  FocusNode? methodFocusNode;
  TextEditingController? methodTextController;
  String? Function(BuildContext, String?)? methodTextControllerValidator;
  // State field(s) for Notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapresult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InventorymovementlogRecord? createDoc;

  @override
  void initState(BuildContext context) {
    quantityTextControllerValidator = _quantityTextControllerValidator;
  }

  @override
  void dispose() {
    quantityFocusNode?.dispose();
    quantityTextController?.dispose();

    methodFocusNode?.dispose();
    methodTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }
}
