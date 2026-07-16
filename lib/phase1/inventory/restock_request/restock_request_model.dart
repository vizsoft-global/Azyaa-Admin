import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'restock_request_widget.dart' show RestockRequestWidget;
import 'package:flutter/material.dart';

class RestockRequestModel extends FlutterFlowModel<RestockRequestWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  String? _quantityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h8hs8e1b' /* Quantity is required */,
      );
    }

    return null;
  }

  // State field(s) for package widget.
  FocusNode? packageFocusNode;
  TextEditingController? packageTextController;
  String? Function(BuildContext, String?)? packageTextControllerValidator;
  String? _packageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'phachvfs' /* Enter package count */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for unit_hieght widget.
  String? unitHieghtValue;
  FormFieldController<String>? unitHieghtValueController;
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
  SettingsRecord? settingsDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapresult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InventorymovementlogRecord? createDoc;

  @override
  void initState(BuildContext context) {
    quantityTextControllerValidator = _quantityTextControllerValidator;
    packageTextControllerValidator = _packageTextControllerValidator;
  }

  @override
  void dispose() {
    quantityFocusNode?.dispose();
    quantityTextController?.dispose();

    packageFocusNode?.dispose();
    packageTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    methodFocusNode?.dispose();
    methodTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }
}
