import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/phase1/media/image_upload/image_upload_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_list_model.dart';
export 'image_list_model.dart';

class ImageListWidget extends StatefulWidget {
  const ImageListWidget({
    super.key,
    String? type,
  }) : this.type = type ?? 'default';

  final String type;

  @override
  State<ImageListWidget> createState() => _ImageListWidgetState();
}

class _ImageListWidgetState extends State<ImageListWidget> {
  late ImageListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageListModel());

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
      padding: EdgeInsets.all(16.0),
      child: StreamBuilder<List<ImagesRecord>>(
        stream: queryImagesRecord(
          queryBuilder: (imagesRecord) =>
              imagesRecord.orderBy('created_at', descending: true),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<ImagesRecord> containerImagesRecordList = snapshot.data!;

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'pe5rkl9w' /* Select Image here */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FFAppState().theme.themeMain.primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                        ),
                        if (FFAppState()
                                .currentUserPermission
                                .contains(_model.permissionKey) ==
                            true)
                          FFButtonWidget(
                            onPressed: () async {
                              _model.show = !_model.show;
                              safeSetState(() {});
                            },
                            text: _model.show
                                ? FFLocalizations.of(context).getVariableText(
                                    enText: 'Cancel upload',
                                    arText: 'إلغاء التحميل',
                                  )
                                : FFLocalizations.of(context).getVariableText(
                                    enText: 'Upload Image',
                                    arText: 'تحميل الصورة',
                                  ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FFAppState()
                                  .theme
                                  .themeMain
                                  .primaryButtoncolor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FFAppState()
                                        .theme
                                        .themeMain
                                        .primaryButtonTextColor,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FFAppState()
                                    .theme
                                    .themeMain
                                    .primaryButtonBorder!,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: FFAppState().theme.themeMain.primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                  if (_model.show)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.imageUploadModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ImageUploadWidget(),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final containerVar = containerImagesRecordList
                              .where((e) =>
                                  FFAppState().currentUserRoleKey == 'designer'
                                      ? (e.imageUid == currentUserUid)
                                      : true)
                              .toList();

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 1.3,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: containerVar.length,
                            itemBuilder: (context, containerVarIndex) {
                              final containerVarItem =
                                  containerVar[containerVarIndex];
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (widget.type == 'feature') {
                                      FFAppState().updateAdminFlowStruct(
                                        (e) => e
                                          ..updateProduct(
                                            (e) => e
                                              ..updateProductInfo(
                                                (e) => e
                                                  ..featureImage =
                                                      containerVarItem
                                                          .featureImage
                                                  ..featureImageId =
                                                      containerVarItem.imageUid,
                                              ),
                                          ),
                                      );
                                      Navigator.pop(context);
                                    } else {
                                      if (widget.type == 'default') {
                                        if (FFAppState()
                                            .adminFlow
                                            .product
                                            .productInfo
                                            .galleryImage
                                            .contains(containerVarItem
                                                .featureImage)) {
                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateProduct(
                                                (e) => e
                                                  ..updateProductInfo(
                                                    (e) => e
                                                      ..updateGalleryImage(
                                                        (e) => e.remove(
                                                            containerVarItem
                                                                .featureImage),
                                                      ),
                                                  ),
                                              ),
                                          );
                                          safeSetState(() {});
                                        } else {
                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateProduct(
                                                (e) => e
                                                  ..updateProductInfo(
                                                    (e) => e
                                                      ..updateGalleryImage(
                                                        (e) => e.add(
                                                            containerVarItem
                                                                .featureImage),
                                                      ),
                                                  ),
                                              ),
                                          );
                                          safeSetState(() {});
                                        }
                                      } else {
                                        if (widget.type == 'notification') {
                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..notificationImageId =
                                                  containerVarItem.imageUid
                                              ..notificationImagePath =
                                                  containerVarItem.featureImage,
                                          );
                                          Navigator.pop(context);
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 140.0,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Container(
                                            height: 140.0,
                                            decoration: BoxDecoration(
                                              color: FFAppState()
                                                      .adminFlow
                                                      .product
                                                      .productInfo
                                                      .galleryImage
                                                      .contains(containerVarItem
                                                          .featureImage)
                                                  ? FFAppState()
                                                      .theme
                                                      .themeMain
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  getCORSProxyUrl(
                                                    containerVarItem
                                                        .featureImage,
                                                  ),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        FFButtonWidget(
                          onPressed: () {
                            print('Cancel pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'g8mndiym' /* Cancel */,
                          ),
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).border,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().updateAdminFlowStruct(
                            (e) => e..incrementRefresh(1),
                          );
                          _model.updatePage(() {});
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'a2qhxhy4' /* Done */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FFAppState().theme.themeMain.primaryButtoncolor,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FFAppState()
                                        .theme
                                        .themeMain
                                        .primaryButtonTextColor,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FFAppState()
                                .theme
                                .themeMain
                                .primaryButtonBorder!,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
