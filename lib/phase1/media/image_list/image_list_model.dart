import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/media/image_upload/image_upload_widget.dart';
import 'image_list_widget.dart' show ImageListWidget;
import 'package:flutter/material.dart';

class ImageListModel extends FlutterFlowModel<ImageListWidget> {
  ///  Local state fields for this component.

  bool show = false;

  int? count;

  String permissionKey = 'media_add';

  ///  State fields for stateful widgets in this component.

  // Model for Image_Upload component.
  late ImageUploadModel imageUploadModel;

  @override
  void initState(BuildContext context) {
    imageUploadModel = createModel(context, () => ImageUploadModel());
  }

  @override
  void dispose() {
    imageUploadModel.dispose();
  }
}
