import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'role_switch_model.dart';
export 'role_switch_model.dart';

class RoleSwitchWidget extends StatefulWidget {
  const RoleSwitchWidget({
    super.key,
    required this.permission,
    required this.role,
  });

  final PermissionsRecord? permission;
  final RolesRecord? role;

  @override
  State<RoleSwitchWidget> createState() => _RoleSwitchWidgetState();
}

class _RoleSwitchWidgetState extends State<RoleSwitchWidget> {
  late RoleSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoleSwitchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: SwitchListTile.adaptive(
          value: _model.switchListTileValue ??= widget.role!.permissionsList
              .contains(widget.permission?.permissionKey),
          onChanged: (newValue) async {
            safeSetState(() => _model.switchListTileValue = newValue);
            if (newValue) {
              await widget.role!.reference.update({
                ...mapToFirestore(
                  {
                    'permissions_list': FieldValue.arrayUnion(
                        [widget.permission?.permissionKey]),
                  },
                ),
              });
            } else {
              await widget.role!.reference.update({
                ...mapToFirestore(
                  {
                    'permissions_list': FieldValue.arrayRemove(
                        [widget.permission?.permissionKey]),
                  },
                ),
              });
            }
          },
          title: Text(
            widget.permission!.permissionInfo.name,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          tileColor: FlutterFlowTheme.of(context).secondaryBackground,
          activeColor: FFAppState().theme.themeMain.secondaryBackground,
          activeTrackColor: FFAppState().theme.themeMain.primary,
          dense: true,
          controlAffinity: ListTileControlAffinity.trailing,
          contentPadding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }
}
