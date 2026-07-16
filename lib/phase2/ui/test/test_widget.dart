import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase2/ui/order_action/order_action_widget.dart';
import 'package:flutter/material.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late TestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MouseRegion(
          opaque: false,
          cursor: MouseCursor.defer ?? MouseCursor.defer,
          child: Icon(
            Icons.more_vert,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          onEnter: ((event) async {
            safeSetState(() => _model.mouseRegionHovered1 = true);
            _model.status = true;
            safeSetState(() {});
          }),
          onExit: ((event) async {
            safeSetState(() => _model.mouseRegionHovered1 = false);
            _model.status = false;
            safeSetState(() {});
          }),
        ),
        if (_model.status)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 4.0),
            child: Container(
              width: 125.0,
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: MouseRegion(
                opaque: false,
                cursor: MouseCursor.defer ?? MouseCursor.defer,
                child: wrapWithModel(
                  model: _model.orderActionModel,
                  updateCallback: () => safeSetState(() {}),
                  child: OrderActionWidget(),
                ),
                onEnter: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered2 = true);
                  _model.status = true;
                  safeSetState(() {});
                }),
                onExit: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered2 = false);
                  _model.status = false;
                  safeSetState(() {});
                }),
              ),
            ),
          ),
      ],
    );
  }
}
