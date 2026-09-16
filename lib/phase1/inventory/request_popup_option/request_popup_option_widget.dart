import '/backend/backend.dart';
import '/backend/store_valley/designer_return_flow.dart';
import '/backend/store_valley/inventory_request_type.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/inventory/restock_request_edit/restock_request_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'request_popup_option_model.dart';
export 'request_popup_option_model.dart';

class RequestPopupOptionWidget extends StatefulWidget {
  const RequestPopupOptionWidget({
    super.key,
    required this.invMovementDoc,
  });

  final InventorymovementlogRecord? invMovementDoc;

  @override
  State<RequestPopupOptionWidget> createState() =>
      _RequestPopupOptionWidgetState();
}

class _RequestPopupOptionWidgetState extends State<RequestPopupOptionWidget> {
  late RequestPopupOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestPopupOptionModel());

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
      width: 150.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'b1dbq3vl' /* View Details */,
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                ),
              ),
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      barrierColor: Color(0x7B000000),
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: WebViewAware(
                            child: Container(
                              width: 600.0,
                              child: RestockRequestEditWidget(
                                invMovementDoc: widget.invMovementDoc!,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: _model.mouseRegionHovered1
                          ? FlutterFlowTheme.of(context).primaryBackground
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'rcevvu7s' /* Edit */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: valueOrDefault<Color>(
                                FFAppState().theme.themeMain.primaryText,
                                FlutterFlowTheme.of(context).primaryText,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = false);
              }),
            ),
            if (InventoryRequestType.needsSuperadminApprove(
                    widget.invMovementDoc?.requestInfo.requestType ?? '') &&
                (widget.invMovementDoc?.requestInfo.requestStatus ==
                    'Pending'))
              MouseRegion(
                opaque: false,
                cursor: MouseCursor.defer,
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final log = widget.invMovementDoc!;
                    if (InventoryRequestType.isReturnToDesigner(
                        log.requestInfo.requestType)) {
                      final result = await createDesignerReturnDelivery(log);
                      if (!result.succeeded) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                content: Text(result.message),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                        return;
                      }
                      Navigator.pop(context);
                      return;
                    }
                    await log.reference.update(
                      createInventorymovementlogRecordData(
                        updateAt: getCurrentTimestamp,
                        requestInfo: createInventoryRequestInfoStruct(
                          requestStatus: 'Accepted',
                          fulfillStatus: 'Processing',
                          clearUnsetFields: false,
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: _model.mouseRegionHovered3
                          ? FlutterFlowTheme.of(context).primaryBackground
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Approve',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                ),
                onEnter: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered3 = true);
                }),
                onExit: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered3 = false);
                }),
              ),
            if (InventoryRequestType.needsSuperadminApprove(
                    widget.invMovementDoc?.requestInfo.requestType ?? '') &&
                (widget.invMovementDoc?.requestInfo.requestStatus ==
                    'Pending'))
              MouseRegion(
                opaque: false,
                cursor: MouseCursor.defer,
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.invMovementDoc!.reference.update(
                      createInventorymovementlogRecordData(
                        updateAt: getCurrentTimestamp,
                        requestInfo: createInventoryRequestInfoStruct(
                          requestStatus: 'Declined',
                          clearUnsetFields: false,
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: _model.mouseRegionHovered4
                          ? FlutterFlowTheme.of(context).primaryBackground
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Decline',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                ),
                onEnter: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered4 = true);
                }),
                onExit: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered4 = false);
                }),
              ),
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: _model.mouseRegionHovered2
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '7pv073ql' /* Delete */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            FFAppState().theme.themeMain.primaryText,
                            FlutterFlowTheme.of(context).primaryText,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = false);
              }),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
