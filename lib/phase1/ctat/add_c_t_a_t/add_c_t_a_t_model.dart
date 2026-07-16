import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_c_t_a_t_widget.dart' show AddCTATWidget;
import 'package:flutter/material.dart';

class AddCTATModel extends FlutterFlowModel<AddCTATWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SITextField widget.
  FocusNode? sITextFieldFocusNode;
  TextEditingController? sITextFieldTextController;
  String? Function(BuildContext, String?)? sITextFieldTextControllerValidator;
  String? _sITextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nxfyszea' /* Field is required */,
      );
    }

    if (val.length > 5) {
      return 'Maximum 5 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[0-99999]*\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'f0uniz9v' /* Serial number not more then 5 ... */,
      );
    }
    return null;
  }

  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n1xuysj0' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l45sf5r7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  Color? colorPicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idMapCat;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idMapTag;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idMapTerm;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BrandsRecord? termResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idMapAttr;

  @override
  void initState(BuildContext context) {
    sITextFieldTextControllerValidator = _sITextFieldTextControllerValidator;
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    textController3Validator = _textController3Validator;
  }

  @override
  void dispose() {
    sITextFieldFocusNode?.dispose();
    sITextFieldTextController?.dispose();

    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
