import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_request_add_widget.dart' show NewRequestAddWidget;
import 'package:flutter/material.dart';

class NewRequestAddModel extends FlutterFlowModel<NewRequestAddWidget> {
  ///  Local state fields for this component.

  String? productID;

  DocumentReference? productRef;

  int? inhandStock;

  int? lowstock;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for productDropdown widget.
  String? productDropdownValue;
  FormFieldController<String>? productDropdownValueController;
  // Stores action output result for [Backend Call - Read Document] action in productDropdown widget.
  InventoryRecord? inventoryDoc;
  // State field(s) for PlatformRate widget.
  String? platformRateValue;
  FormFieldController<String>? platformRateValueController;
  // State field(s) for quanity widget.
  FocusNode? quanityFocusNode;
  TextEditingController? quanityTextController;
  String? Function(BuildContext, String?)? quanityTextControllerValidator;
  String? _quanityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eu50qo8a' /* product_quantity is required */,
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
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapresult;

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
