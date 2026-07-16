import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_preview_widget.dart' show ProductPreviewWidget;
import 'package:flutter/material.dart';

class ProductPreviewModel extends FlutterFlowModel<ProductPreviewWidget> {
  ///  Local state fields for this component.

  String permissionKeyEdit = 'product_edit';

  String permissionKeyDelete = 'product_delete';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductsRecord? presentProductTranslationResult1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductsRecord? presentProductResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CategoryRecord>? categoryResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TagsRecord>? tagResult;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    themeStatusCheckerModel.dispose();
  }
}
