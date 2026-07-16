import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'readyto_pickup_widget.dart' show ReadytoPickupWidget;
import 'package:flutter/material.dart';

class ReadytoPickupModel extends FlutterFlowModel<ReadytoPickupWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for quanity widget.
  FocusNode? quanityFocusNode;
  TextEditingController? quanityTextController;
  String? Function(BuildContext, String?)? quanityTextControllerValidator;
  // State field(s) for wieght widget.
  FocusNode? wieghtFocusNode;
  TextEditingController? wieghtTextController;
  String? Function(BuildContext, String?)? wieghtTextControllerValidator;
  // State field(s) for unit_hieght widget.
  String? unitHieghtValue;
  FormFieldController<String>? unitHieghtValueController;
  // State field(s) for package widget.
  FocusNode? packageFocusNode;
  TextEditingController? packageTextController;
  String? Function(BuildContext, String?)? packageTextControllerValidator;
  String? _packageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eoltye64' /* Package count is required */,
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
    packageTextControllerValidator = _packageTextControllerValidator;
  }

  @override
  void dispose() {
    quanityFocusNode?.dispose();
    quanityTextController?.dispose();

    wieghtFocusNode?.dispose();
    wieghtTextController?.dispose();

    packageFocusNode?.dispose();
    packageTextController?.dispose();

    methodFocusNode?.dispose();
    methodTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }
}
