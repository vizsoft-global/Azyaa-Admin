import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_setting_category_model.dart';
export 'home_setting_category_model.dart';

class HomeSettingCategoryWidget extends StatefulWidget {
  const HomeSettingCategoryWidget({
    super.key,
    required this.settings,
    required this.category,
  });

  final SettingsRecord? settings;
  final CategoryRecord? category;

  @override
  State<HomeSettingCategoryWidget> createState() =>
      _HomeSettingCategoryWidgetState();
}

class _HomeSettingCategoryWidgetState extends State<HomeSettingCategoryWidget> {
  late HomeSettingCategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeSettingCategoryModel());

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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).border,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Material(
          color: Colors.transparent,
          child: SwitchListTile.adaptive(
            value: _model.catSwitchStatus1Value ??= widget
                .settings!.settingsHome.settingsCategoryidList
                .contains(widget.category?.categoryId),
            onChanged: (newValue) async {
              safeSetState(() => _model.catSwitchStatus1Value = newValue);
              if (newValue) {
                await widget.settings!.reference
                    .update(createSettingsRecordData(
                  settingsHome: createSettingsHomeStruct(
                    fieldValues: {
                      'settings_categoryid_list':
                          FieldValue.arrayUnion([widget.category?.categoryId]),
                    },
                    clearUnsetFields: false,
                  ),
                ));
              } else {
                await widget.settings!.reference
                    .update(createSettingsRecordData(
                  settingsHome: createSettingsHomeStruct(
                    fieldValues: {
                      'settings_categoryid_list': FieldValue.arrayRemove(
                          [widget.category?.categoryId]),
                    },
                    clearUnsetFields: false,
                  ),
                ));
              }
            },
            title: Text(
              widget.category!.categoryInfo.name,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      FFAppState().theme.themeMain.primaryText,
                      FlutterFlowTheme.of(context).primaryText,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            tileColor: FlutterFlowTheme.of(context).secondaryBackground,
            activeColor: FFAppState().theme.themeMain.secondaryBackground,
            activeTrackColor: FFAppState().theme.themeMain.primary,
            dense: true,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
      ),
    );
  }
}
