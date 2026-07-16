import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/index.dart';
import 'error404_widget.dart' show Error404Widget;
import 'package:flutter/material.dart';

class Error404Model extends FlutterFlowModel<Error404Widget> {
  ///  Local state fields for this page.

  String customerFilters = 'All Customers';

  String searchStatus = 'Hide';

  String permissionKey = 'dashboard';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;

  @override
  void initState(BuildContext context) {
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
  }

  @override
  void dispose() {
    azyaaResponsiveModel.dispose();
  }
}
