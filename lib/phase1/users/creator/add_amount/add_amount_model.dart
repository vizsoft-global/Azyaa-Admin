import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_amount_widget.dart' show AddAmountWidget;
import 'package:flutter/material.dart';

class AddAmountModel extends FlutterFlowModel<AddAmountWidget> {
  ///  Local state fields for this component.

  String permissionKeyEdit = 'product_edit';

  String permissionKeyDelete = 'product_delete';

  PayoutInfoStruct? payoutInfo;
  void updatePayoutInfoStruct(Function(PayoutInfoStruct) updateFn) {
    updateFn(payoutInfo ??= PayoutInfoStruct());
  }

  double? prevBalance;

  double? currBalance;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qcopsw9j' /* Enter Amount is required */,
      );
    }

    if (!RegExp('^(?!0+(\\.0+)?\$)[0-9]*[1-9][0-9]*(\\.[0-9]+)?\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Update widget.
  bool? paymentAmount;
  // Stores action output result for [Firestore Query - Query a collection] action in Update widget.
  IdMapRecord? idmapResult;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
