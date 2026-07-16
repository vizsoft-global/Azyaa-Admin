import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'enquiry_widget.dart' show EnquiryWidget;
import 'package:flutter/material.dart';

class EnquiryModel extends FlutterFlowModel<EnquiryWidget> {
  ///  Local state fields for this component.

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PlatformRate widget.
  String? platformRateValue;
  FormFieldController<String>? platformRateValueController;
  // State field(s) for quanity widget.
  FocusNode? quanityFocusNode;
  TextEditingController? quanityTextController;
  String? Function(BuildContext, String?)? quanityTextControllerValidator;
  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  bool isDataUploading_uploadData82a = false;
  FFUploadedFile uploadedLocalFile_uploadData82a =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData82a = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapresult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    quanityFocusNode?.dispose();
    quanityTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }
}
