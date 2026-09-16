import '/backend/backend.dart';
import '/backend/store_valley/store_valley_restock_flow.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'restock_pickup_request_model.dart';
export 'restock_pickup_request_model.dart';

class RestockPickupRequestWidget extends StatefulWidget {
  const RestockPickupRequestWidget({
    super.key,
    required this.readyLogs,
  });

  final List<InventorymovementlogRecord> readyLogs;

  @override
  State<RestockPickupRequestWidget> createState() =>
      _RestockPickupRequestWidgetState();
}

class _RestockPickupRequestWidgetState extends State<RestockPickupRequestWidget> {
  late RestockPickupRequestModel _model;
  late Set<String> _selectedPaths;
  bool _submitting = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestockPickupRequestModel());
    _selectedPaths = widget.readyLogs
        .map((log) => log.reference.path)
        .toSet();
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  List<InventorymovementlogRecord> get _selectedLogs {
    return widget.readyLogs
        .where((log) => _selectedPaths.contains(log.reference.path))
        .toList();
  }

  Future<void> _submit() async {
    final selected = _selectedLogs;
    if (selected.isEmpty) {
      await _alert('Select at least one restock product');
      return;
    }
    safeSetState(() => _submitting = true);
    final result = await createRestockWarehouseIntakeForLogs(selected);
    if (!mounted) {
      return;
    }
    safeSetState(() => _submitting = false);
    if (!result.succeeded) {
      await _alert(result.message);
      return;
    }
    final otp = result.pickupOtp?.trim() ?? '';
    await _alert(
      otp.isEmpty
          ? 'Pickup request created. Store Valley will collect the selected products in one trip.'
          : 'Pickup request created. Tell the driver this OTP: $otp',
    );
    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  Future<void> _alert(String message) async {
    await showDialog<void>(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 520.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 16.0, 16.0, 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '9ov4m9sf' /* Create Pickup Request */,
                        ),
                        style: FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: _submitting
                          ? null
                          : () => Navigator.pop(context, false),
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0, 12.0, 16.0, 8.0),
              child: Text(
                'Select ready restock products to send to the warehouse in one pickup.',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.inter(),
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            if (widget.readyLogs.isEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No restock products are ready to pickup yet.',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: widget.readyLogs.length,
                  itemBuilder: (context, index) {
                    final log = widget.readyLogs[index];
                    final path = log.reference.path;
                    final selected = _selectedPaths.contains(path);
                    return CheckboxListTile(
                      value: selected,
                      onChanged: _submitting
                          ? null
                          : (value) {
                              safeSetState(() {
                                if (value == true) {
                                  _selectedPaths.add(path);
                                } else {
                                  _selectedPaths.remove(path);
                                }
                              });
                            },
                      title: Text(
                        log.productName.isNotEmpty
                            ? log.productName
                            : log.productId,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      subtitle: Text(
                        '${log.requestInfo.inventoryRequestId}  •  qty ${log.productQuantity}',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0, 8.0, 16.0, 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _submitting
                        ? null
                        : () => Navigator.pop(context, false),
                    child: Text(
                      FFLocalizations.of(context).getVariableText(
                        enText: 'Cancel',
                        arText: 'يلغي',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  FFButtonWidget(
                    onPressed: _submitting || widget.readyLogs.isEmpty
                        ? null
                        : _submit,
                    text: _submitting
                        ? 'Creating...'
                        : FFLocalizations.of(context).getText(
                            '9ov4m9sf' /* Create Pickup Request */,
                          ),
                    options: FFButtonOptions(
                      height: 36.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                ),
                                color: Colors.white,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
