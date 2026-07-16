import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import 'azyaa_header_widget.dart' show AzyaaHeaderWidget;
import 'package:flutter/material.dart';

class AzyaaHeaderModel extends FlutterFlowModel<AzyaaHeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;

  @override
  void initState(BuildContext context) {
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
  }

  @override
  void dispose() {
    notificatioAlertModel.dispose();
  }
}
