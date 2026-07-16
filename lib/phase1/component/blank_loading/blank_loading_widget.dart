import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'blank_loading_model.dart';
export 'blank_loading_model.dart';

class BlankLoadingWidget extends StatefulWidget {
  const BlankLoadingWidget({super.key});

  @override
  State<BlankLoadingWidget> createState() => _BlankLoadingWidgetState();
}

class _BlankLoadingWidgetState extends State<BlankLoadingWidget> {
  late BlankLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlankLoadingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
