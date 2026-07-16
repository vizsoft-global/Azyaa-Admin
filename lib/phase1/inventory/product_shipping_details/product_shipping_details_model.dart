import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'product_shipping_details_widget.dart' show ProductShippingDetailsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductShippingDetailsModel
    extends FlutterFlowModel<ProductShippingDetailsWidget> {
  ///  Local state fields for this component.

  InvitemListStruct? item;
  void updateItemStruct(Function(InvitemListStruct) updateFn) {
    updateFn(item ??= InvitemListStruct());
  }

  List<dynamic> itemsJson = [];
  void addToItemsJson(dynamic item) => itemsJson.add(item);
  void removeFromItemsJson(dynamic item) => itemsJson.remove(item);
  void removeAtIndexFromItemsJson(int index) => itemsJson.removeAt(index);
  void insertAtIndexInItemsJson(int index, dynamic item) =>
      itemsJson.insert(index, item);
  void updateItemsJsonAtIndex(int index, Function(dynamic) updateFn) =>
      itemsJson[index] = updateFn(itemsJson[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for eachwieght widget.
  FocusNode? eachwieghtFocusNode;
  TextEditingController? eachwieghtTextController;
  String? Function(BuildContext, String?)? eachwieghtTextControllerValidator;
  // State field(s) for unit_hieght widget.
  String? unitHieghtValue1;
  FormFieldController<String>? unitHieghtValueController1;
  // State field(s) for totalweight widget.
  FocusNode? totalweightFocusNode;
  TextEditingController? totalweightTextController;
  String? Function(BuildContext, String?)? totalweightTextControllerValidator;
  // State field(s) for unit_hieght widget.
  String? unitHieghtValue2;
  FormFieldController<String>? unitHieghtValueController2;
  // State field(s) for package widget.
  FocusNode? packageFocusNode;
  TextEditingController? packageTextController;
  String? Function(BuildContext, String?)? packageTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResult;
  // Stores action output result for [Backend Call - API (Create Delivery)] action in Button widget.
  ApiCallResponse? apiResultenquiryCreate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeliveryRecord? deliveryEnquiryResult;
  // Stores action output result for [Backend Call - API (Create Delivery)] action in Button widget.
  ApiCallResponse? apiResultrestockCreate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeliveryRecord? deliveryRestockResult;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    expandableExpandableController1.dispose();
    eachwieghtFocusNode?.dispose();
    eachwieghtTextController?.dispose();

    totalweightFocusNode?.dispose();
    totalweightTextController?.dispose();

    packageFocusNode?.dispose();
    packageTextController?.dispose();

    expandableExpandableController2.dispose();
  }
}
