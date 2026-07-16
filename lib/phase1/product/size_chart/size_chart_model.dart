import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'size_chart_widget.dart' show SizeChartWidget;
import 'package:flutter/material.dart';

class SizeChartModel extends FlutterFlowModel<SizeChartWidget> {
  ///  Local state fields for this component.

  String chartType = 'US';

  String metrics = 'Inch';

  String? image;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChartName widget.
  FocusNode? chartNameFocusNode;
  TextEditingController? chartNameTextController;
  String? Function(BuildContext, String?)? chartNameTextControllerValidator;
  String? _chartNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pmghrw6t' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading_uploadData1gh = false;
  FFUploadedFile uploadedLocalFile_uploadData1gh =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData1gh = '';

  // State field(s) for Size widget.
  FocusNode? sizeFocusNode1;
  TextEditingController? sizeTextController1;
  String? Function(BuildContext, String?)? sizeTextController1Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode1;
  TextEditingController? usTextController1;
  String? Function(BuildContext, String?)? usTextController1Validator;
  // State field(s) for Bust widget.
  FocusNode? bustFocusNode1;
  TextEditingController? bustTextController1;
  String? Function(BuildContext, String?)? bustTextController1Validator;
  // State field(s) for Waist widget.
  FocusNode? waistFocusNode1;
  TextEditingController? waistTextController1;
  String? Function(BuildContext, String?)? waistTextController1Validator;
  // State field(s) for Hip widget.
  FocusNode? hipFocusNode1;
  TextEditingController? hipTextController1;
  String? Function(BuildContext, String?)? hipTextController1Validator;
  // State field(s) for Shoulder widget.
  FocusNode? shoulderFocusNode1;
  TextEditingController? shoulderTextController1;
  String? Function(BuildContext, String?)? shoulderTextController1Validator;
  // State field(s) for Sleeve widget.
  FocusNode? sleeveFocusNode1;
  TextEditingController? sleeveTextController1;
  String? Function(BuildContext, String?)? sleeveTextController1Validator;
  // State field(s) for Size-header widget.
  FocusNode? sizeHeaderFocusNode1;
  TextEditingController? sizeHeaderTextController1;
  String? Function(BuildContext, String?)? sizeHeaderTextController1Validator;
  // State field(s) for Size-header widget.
  FocusNode? sizeHeaderFocusNode2;
  TextEditingController? sizeHeaderTextController2;
  String? Function(BuildContext, String?)? sizeHeaderTextController2Validator;
  // State field(s) for Size-header widget.
  FocusNode? sizeHeaderFocusNode3;
  TextEditingController? sizeHeaderTextController3;
  String? Function(BuildContext, String?)? sizeHeaderTextController3Validator;
  // State field(s) for Size-header widget.
  FocusNode? sizeHeaderFocusNode4;
  TextEditingController? sizeHeaderTextController4;
  String? Function(BuildContext, String?)? sizeHeaderTextController4Validator;
  // State field(s) for Size-header widget.
  FocusNode? sizeHeaderFocusNode5;
  TextEditingController? sizeHeaderTextController5;
  String? Function(BuildContext, String?)? sizeHeaderTextController5Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode2;
  TextEditingController? usTextController2;
  String? Function(BuildContext, String?)? usTextController2Validator;
  // State field(s) for Bust widget.
  FocusNode? bustFocusNode2;
  TextEditingController? bustTextController2;
  String? Function(BuildContext, String?)? bustTextController2Validator;
  // State field(s) for Waist widget.
  FocusNode? waistFocusNode2;
  TextEditingController? waistTextController2;
  String? Function(BuildContext, String?)? waistTextController2Validator;
  // State field(s) for Hip widget.
  FocusNode? hipFocusNode2;
  TextEditingController? hipTextController2;
  String? Function(BuildContext, String?)? hipTextController2Validator;
  // State field(s) for Shoulder widget.
  FocusNode? shoulderFocusNode2;
  TextEditingController? shoulderTextController2;
  String? Function(BuildContext, String?)? shoulderTextController2Validator;
  // State field(s) for Sleeve widget.
  FocusNode? sleeveFocusNode2;
  TextEditingController? sleeveTextController2;
  String? Function(BuildContext, String?)? sleeveTextController2Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode3;
  TextEditingController? usTextController3;
  String? Function(BuildContext, String?)? usTextController3Validator;
  // State field(s) for Bust widget.
  FocusNode? bustFocusNode3;
  TextEditingController? bustTextController3;
  String? Function(BuildContext, String?)? bustTextController3Validator;
  // State field(s) for Waist widget.
  FocusNode? waistFocusNode3;
  TextEditingController? waistTextController3;
  String? Function(BuildContext, String?)? waistTextController3Validator;
  // State field(s) for Hip widget.
  FocusNode? hipFocusNode3;
  TextEditingController? hipTextController3;
  String? Function(BuildContext, String?)? hipTextController3Validator;
  // State field(s) for Shoulder widget.
  FocusNode? shoulderFocusNode3;
  TextEditingController? shoulderTextController3;
  String? Function(BuildContext, String?)? shoulderTextController3Validator;
  // State field(s) for Sleeve widget.
  FocusNode? sleeveFocusNode3;
  TextEditingController? sleeveTextController3;
  String? Function(BuildContext, String?)? sleeveTextController3Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode4;
  TextEditingController? usTextController4;
  String? Function(BuildContext, String?)? usTextController4Validator;
  // State field(s) for Bust widget.
  FocusNode? bustFocusNode4;
  TextEditingController? bustTextController4;
  String? Function(BuildContext, String?)? bustTextController4Validator;
  // State field(s) for Waist widget.
  FocusNode? waistFocusNode4;
  TextEditingController? waistTextController4;
  String? Function(BuildContext, String?)? waistTextController4Validator;
  // State field(s) for Hip widget.
  FocusNode? hipFocusNode4;
  TextEditingController? hipTextController4;
  String? Function(BuildContext, String?)? hipTextController4Validator;
  // State field(s) for Shoulder widget.
  FocusNode? shoulderFocusNode4;
  TextEditingController? shoulderTextController4;
  String? Function(BuildContext, String?)? shoulderTextController4Validator;
  // State field(s) for Sleeve widget.
  FocusNode? sleeveFocusNode4;
  TextEditingController? sleeveTextController4;
  String? Function(BuildContext, String?)? sleeveTextController4Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode5;
  TextEditingController? usTextController5;
  String? Function(BuildContext, String?)? usTextController5Validator;
  // State field(s) for Bust widget.
  FocusNode? bustFocusNode5;
  TextEditingController? bustTextController5;
  String? Function(BuildContext, String?)? bustTextController5Validator;
  // State field(s) for Waist widget.
  FocusNode? waistFocusNode5;
  TextEditingController? waistTextController5;
  String? Function(BuildContext, String?)? waistTextController5Validator;
  // State field(s) for Hip widget.
  FocusNode? hipFocusNode5;
  TextEditingController? hipTextController5;
  String? Function(BuildContext, String?)? hipTextController5Validator;
  // State field(s) for Shoulder widget.
  FocusNode? shoulderFocusNode5;
  TextEditingController? shoulderTextController5;
  String? Function(BuildContext, String?)? shoulderTextController5Validator;
  // State field(s) for Sleeve widget.
  FocusNode? sleeveFocusNode5;
  TextEditingController? sleeveTextController5;
  String? Function(BuildContext, String?)? sleeveTextController5Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode6;
  TextEditingController? usTextController6;
  String? Function(BuildContext, String?)? usTextController6Validator;
  // State field(s) for Bust widget.
  FocusNode? bustFocusNode6;
  TextEditingController? bustTextController6;
  String? Function(BuildContext, String?)? bustTextController6Validator;
  // State field(s) for Waist widget.
  FocusNode? waistFocusNode6;
  TextEditingController? waistTextController6;
  String? Function(BuildContext, String?)? waistTextController6Validator;
  // State field(s) for Hip widget.
  FocusNode? hipFocusNode6;
  TextEditingController? hipTextController6;
  String? Function(BuildContext, String?)? hipTextController6Validator;
  // State field(s) for Shoulder widget.
  FocusNode? shoulderFocusNode6;
  TextEditingController? shoulderTextController6;
  String? Function(BuildContext, String?)? shoulderTextController6Validator;
  // State field(s) for Sleeve widget.
  FocusNode? sleeveFocusNode6;
  TextEditingController? sleeveTextController6;
  String? Function(BuildContext, String?)? sleeveTextController6Validator;
  // State field(s) for Size widget.
  FocusNode? sizeFocusNode2;
  TextEditingController? sizeTextController2;
  String? Function(BuildContext, String?)? sizeTextController2Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode7;
  TextEditingController? usTextController7;
  String? Function(BuildContext, String?)? usTextController7Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode8;
  TextEditingController? usTextController8;
  String? Function(BuildContext, String?)? usTextController8Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode9;
  TextEditingController? usTextController9;
  String? Function(BuildContext, String?)? usTextController9Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode10;
  TextEditingController? usTextController10;
  String? Function(BuildContext, String?)? usTextController10Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode11;
  TextEditingController? usTextController11;
  String? Function(BuildContext, String?)? usTextController11Validator;
  // State field(s) for US widget.
  FocusNode? usFocusNode12;
  TextEditingController? usTextController12;
  String? Function(BuildContext, String?)? usTextController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController51;
  String? Function(BuildContext, String?)? textController51Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController52;
  String? Function(BuildContext, String?)? textController52Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController53;
  String? Function(BuildContext, String?)? textController53Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController54;
  String? Function(BuildContext, String?)? textController54Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController55;
  String? Function(BuildContext, String?)? textController55Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController56;
  String? Function(BuildContext, String?)? textController56Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController57;
  String? Function(BuildContext, String?)? textController57Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResult;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    chartNameTextControllerValidator = _chartNameTextControllerValidator;
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    chartNameFocusNode?.dispose();
    chartNameTextController?.dispose();

    sizeFocusNode1?.dispose();
    sizeTextController1?.dispose();

    usFocusNode1?.dispose();
    usTextController1?.dispose();

    bustFocusNode1?.dispose();
    bustTextController1?.dispose();

    waistFocusNode1?.dispose();
    waistTextController1?.dispose();

    hipFocusNode1?.dispose();
    hipTextController1?.dispose();

    shoulderFocusNode1?.dispose();
    shoulderTextController1?.dispose();

    sleeveFocusNode1?.dispose();
    sleeveTextController1?.dispose();

    sizeHeaderFocusNode1?.dispose();
    sizeHeaderTextController1?.dispose();

    sizeHeaderFocusNode2?.dispose();
    sizeHeaderTextController2?.dispose();

    sizeHeaderFocusNode3?.dispose();
    sizeHeaderTextController3?.dispose();

    sizeHeaderFocusNode4?.dispose();
    sizeHeaderTextController4?.dispose();

    sizeHeaderFocusNode5?.dispose();
    sizeHeaderTextController5?.dispose();

    usFocusNode2?.dispose();
    usTextController2?.dispose();

    bustFocusNode2?.dispose();
    bustTextController2?.dispose();

    waistFocusNode2?.dispose();
    waistTextController2?.dispose();

    hipFocusNode2?.dispose();
    hipTextController2?.dispose();

    shoulderFocusNode2?.dispose();
    shoulderTextController2?.dispose();

    sleeveFocusNode2?.dispose();
    sleeveTextController2?.dispose();

    usFocusNode3?.dispose();
    usTextController3?.dispose();

    bustFocusNode3?.dispose();
    bustTextController3?.dispose();

    waistFocusNode3?.dispose();
    waistTextController3?.dispose();

    hipFocusNode3?.dispose();
    hipTextController3?.dispose();

    shoulderFocusNode3?.dispose();
    shoulderTextController3?.dispose();

    sleeveFocusNode3?.dispose();
    sleeveTextController3?.dispose();

    usFocusNode4?.dispose();
    usTextController4?.dispose();

    bustFocusNode4?.dispose();
    bustTextController4?.dispose();

    waistFocusNode4?.dispose();
    waistTextController4?.dispose();

    hipFocusNode4?.dispose();
    hipTextController4?.dispose();

    shoulderFocusNode4?.dispose();
    shoulderTextController4?.dispose();

    sleeveFocusNode4?.dispose();
    sleeveTextController4?.dispose();

    usFocusNode5?.dispose();
    usTextController5?.dispose();

    bustFocusNode5?.dispose();
    bustTextController5?.dispose();

    waistFocusNode5?.dispose();
    waistTextController5?.dispose();

    hipFocusNode5?.dispose();
    hipTextController5?.dispose();

    shoulderFocusNode5?.dispose();
    shoulderTextController5?.dispose();

    sleeveFocusNode5?.dispose();
    sleeveTextController5?.dispose();

    usFocusNode6?.dispose();
    usTextController6?.dispose();

    bustFocusNode6?.dispose();
    bustTextController6?.dispose();

    waistFocusNode6?.dispose();
    waistTextController6?.dispose();

    hipFocusNode6?.dispose();
    hipTextController6?.dispose();

    shoulderFocusNode6?.dispose();
    shoulderTextController6?.dispose();

    sleeveFocusNode6?.dispose();
    sleeveTextController6?.dispose();

    sizeFocusNode2?.dispose();
    sizeTextController2?.dispose();

    usFocusNode7?.dispose();
    usTextController7?.dispose();

    usFocusNode8?.dispose();
    usTextController8?.dispose();

    usFocusNode9?.dispose();
    usTextController9?.dispose();

    usFocusNode10?.dispose();
    usTextController10?.dispose();

    usFocusNode11?.dispose();
    usTextController11?.dispose();

    usFocusNode12?.dispose();
    usTextController12?.dispose();

    textFieldFocusNode1?.dispose();
    textController51?.dispose();

    textFieldFocusNode2?.dispose();
    textController52?.dispose();

    textFieldFocusNode3?.dispose();
    textController53?.dispose();

    textFieldFocusNode4?.dispose();
    textController54?.dispose();

    textFieldFocusNode5?.dispose();
    textController55?.dispose();

    textFieldFocusNode6?.dispose();
    textController56?.dispose();

    textFieldFocusNode7?.dispose();
    textController57?.dispose();

    themeStatusCheckerModel.dispose();
  }
}
