import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPostWidget extends StatefulWidget {
  const EditPostWidget({
    Key? key,
    this.editPost,
  }) : super(key: key);

  final DocumentReference? editPost;

  @override
  _EditPostWidgetState createState() => _EditPostWidgetState();
}

class _EditPostWidgetState extends State<EditPostWidget>
    with TickerProviderStateMixin {
  bool isMediaUploading = false;
  List<String> uploadedFileUrls = [];

  TextEditingController? postDescriptionController;
  String? postTypeValue;
  TextEditingController? postPriceController;
  String? priceTypeValue;
  TextEditingController? forEveryController;
  TextEditingController? postPriceCustomizeController;
  TextEditingController? workTypeCustomizeController;
  String? dropDownValue;
  TextEditingController? postTitleController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = {
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        SaturateEffect(
          curve: Curves.elasticOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.39,
          end: 1,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    forEveryController?.dispose();
    postPriceCustomizeController?.dispose();
    workTypeCustomizeController?.dispose();
    postPriceController?.dispose();
    postDescriptionController?.dispose();
    postTitleController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.editPost!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: SpinKitFadingCube(
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 24,
              ),
            ),
          );
        }
        final editPostPostsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pop();
                                      setState(() {
                                        FFAppState().customizeTriger = false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.cancel_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 0),
                                      child: StreamBuilder<List<PostsRecord>>(
                                        stream: queryPostsRecord(
                                          queryBuilder: (postsRecord) =>
                                              postsRecord.orderBy('time_posted',
                                                  descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: SpinKitFadingCube(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  size: 24,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PostsRecord>
                                              buttonPostsRecordList =
                                              snapshot.data!;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                FFAppState().customizeTriger =
                                                    false;
                                              });
                                              if (FFAppState()
                                                  .customizeTriger) {
                                                final postsUpdateData = {
                                                  ...createPostsRecordData(
                                                    postTitle:
                                                        postTitleController
                                                                ?.text ??
                                                            '',
                                                    postDescription:
                                                        postDescriptionController
                                                                ?.text ??
                                                            '',
                                                    postUser:
                                                        currentUserReference,
                                                    price: double.tryParse(
                                                        postPriceCustomizeController
                                                                ?.text ??
                                                            ''),
                                                    postType:
                                                        workTypeCustomizeController
                                                                ?.text ??
                                                            '',
                                                    postUserLocation:
                                                        dropDownValue,
                                                    priceType:
                                                        forEveryController
                                                                ?.text ??
                                                            '',
                                                    timeEdited:
                                                        getCurrentTimestamp,
                                                  ),
                                                  'post_photo':
                                                      uploadedFileUrls,
                                                };
                                                await editPostPostsRecord
                                                    .reference
                                                    .update(postsUpdateData);
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed('HomePage');
                                              } else {
                                                final postsUpdateData = {
                                                  ...createPostsRecordData(
                                                    postTitle:
                                                        postTitleController
                                                                ?.text ??
                                                            '',
                                                    postDescription:
                                                        postDescriptionController
                                                                ?.text ??
                                                            '',
                                                    postUser:
                                                        currentUserReference,
                                                    price: double.tryParse(
                                                        postPriceController
                                                                ?.text ??
                                                            ''),
                                                    postType: postTypeValue,
                                                    postUserLocation:
                                                        dropDownValue,
                                                    priceType: priceTypeValue,
                                                    timeEdited:
                                                        getCurrentTimestamp,
                                                  ),
                                                  'post_photo':
                                                      uploadedFileUrls,
                                                };
                                                await editPostPostsRecord
                                                    .reference
                                                    .update(postsUpdateData);
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed('HomePage');
                                              }
                                            },
                                            text: 'تعديل',
                                            options: FFButtonOptions(
                                              width: 70,
                                              height: 30,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Noto Kufi Arabic',
                                                        color:
                                                            Color(0xFEEEEEEE),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Color(0x00212121),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'buttonOnPageLoadAnimation']!);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 80,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: AlignmentDirectional(
                                              0, 0.050000000000000044),
                                          child: Stack(
                                            children: [
                                              if (currentUserPhoto != null &&
                                                  currentUserPhoto != '')
                                                AuthUserStreamWidget(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1000),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          currentUserPhoto,
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              if (currentUserPhoto == null ||
                                                  currentUserPhoto == '')
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0.05),
                                                  child: AuthUserStreamWidget(
                                                    child: Icon(
                                                      Icons.person_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: postTitleController ??=
                                              TextEditingController(
                                            text: editPostPostsRecord.postTitle,
                                          ),
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'العنوان',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily:
                                                          'Noto Kufi Arabic',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      lineHeight: 1,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x0095A1AC),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x0095A1AC),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryColor,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Noto Kufi Arabic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                lineHeight: 1,
                                              ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.53,
                              decoration: BoxDecoration(),
                              child: AuthUserStreamWidget(
                                child: TextFormField(
                                  controller: postDescriptionController ??=
                                      TextEditingController(
                                    text: editPostPostsRecord.postDescription,
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: valueOrDefault<bool>(
                                                currentUserDocument?.provider,
                                                false) ==
                                            true
                                        ? 'ما هي الخدمة التي تريد تقديمها؟'
                                        : 'ما هي الخدمة التي تريد طلبها؟',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Noto Kufi Arabic',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x0095A1AC),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x0095A1AC),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Noto Kufi Arabic',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 14,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: null,
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    imageQuality: 100,
                                                    mediaSource: MediaSource
                                                        .photoGallery,
                                                    multiImage: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    setState(() =>
                                                        isMediaUploading =
                                                            true);
                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      showUploadMessage(
                                                        context,
                                                        'Uploading file...',
                                                        showLoading: true,
                                                      );
                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                      isMediaUploading = false;
                                                    }
                                                    if (downloadUrls.length ==
                                                        selectedMedia.length) {
                                                      setState(() =>
                                                          uploadedFileUrls =
                                                              downloadUrls);
                                                      showUploadMessage(
                                                          context, 'Success!');
                                                    } else {
                                                      setState(() {});
                                                      showUploadMessage(context,
                                                          'Failed to upload media');
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.photo_camera_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 128,
                                              height: 40,
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final photosPreview =
                                                      editPostPostsRecord
                                                          .postPhoto!
                                                          .toList()
                                                          .take(5)
                                                          .toList();
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        photosPreview.length,
                                                        (photosPreviewIndex) {
                                                      final photosPreviewItem =
                                                          photosPreview[
                                                              photosPreviewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 2, 0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            photosPreviewItem,
                                                            width: 40,
                                                            height: 40,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (uploadedFileUrls.length > 3)
                                        Text(
                                          functions.imageCountPlus(
                                              uploadedFileUrls.length),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              indent: 1,
                              endIndent: 1,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Stack(
                                  children: [
                                    if (!FFAppState().customizeTriger)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 5, 18, 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                initialOption: postTypeValue ??=
                                                    editPostPostsRecord
                                                        .postType,
                                                options: [
                                                  'سائق',
                                                  'حداد',
                                                  'دهين',
                                                  'بليط',
                                                  'نجار',
                                                  'مواسرجي',
                                                  'مصلح',
                                                  'منسق',
                                                  'ديكور',
                                                  'مقاول',
                                                  'تنظيف',
                                                  'صيانة'
                                                ],
                                                onChanged: (val) => setState(
                                                    () => postTypeValue = val),
                                                width: 180,
                                                height: 47,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                hintText: 'الفئة',
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                elevation: 2,
                                                borderColor: Color(0x0095A1AC),
                                                borderWidth: 0,
                                                borderRadius: 10,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: TextFormField(
                                                  controller:
                                                      postPriceController ??=
                                                          TextEditingController(
                                                    text: editPostPostsRecord
                                                        .price
                                                        ?.toString(),
                                                  ),
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'السعر',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Kufi Arabic',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x0095A1AC),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x0095A1AC),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Noto Kufi Arabic',
                                                        fontSize: 12,
                                                      ),
                                                  minLines: 1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                initialOption:
                                                    priceTypeValue ??=
                                                        editPostPostsRecord
                                                            .priceType,
                                                options: [
                                                  'ساعة',
                                                  'يوم',
                                                  'متر',
                                                  'قطعة',
                                                  'طلب'
                                                ],
                                                onChanged: (val) => setState(
                                                    () => priceTypeValue = val),
                                                width: 130,
                                                height: 47,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                hintText: 'لكل',
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                elevation: 2,
                                                borderColor: Color(0x0095A1AC),
                                                borderWidth: 0,
                                                borderRadius: 10,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 0),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().customizeTriger)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 5, 18, 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    workTypeCustomizeController ??=
                                                        TextEditingController(
                                                  text: editPostPostsRecord
                                                      .postType,
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'نوع العمل',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Noto Kufi Arabic',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                      ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: TextFormField(
                                                  controller:
                                                      postPriceCustomizeController ??=
                                                          TextEditingController(
                                                    text: editPostPostsRecord
                                                        .price
                                                        ?.toString(),
                                                  ),
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'السعر',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Kufi Arabic',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x0095A1AC),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x0095A1AC),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Noto Kufi Arabic',
                                                        fontSize: 12,
                                                      ),
                                                  minLines: 1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    forEveryController ??=
                                                        TextEditingController(
                                                  text: editPostPostsRecord
                                                      .priceType,
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'لكل',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Noto Kufi Arabic',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                      ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                  indent: 1,
                                  endIndent: 1,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 5, 19, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AuthUserStreamWidget(
                                    child: FlutterFlowDropDown<String>(
                                      initialOption: dropDownValue ??=
                                          valueOrDefault<String>(
                                        valueOrDefault(
                                            currentUserDocument?.userLocation,
                                            ''),
                                        'عمان',
                                      ),
                                      options: FFAppState().cities.toList(),
                                      onChanged: (val) =>
                                          setState(() => dropDownValue = val),
                                      width: 115,
                                      height: 47,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Noto Kufi Arabic',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      elevation: 2,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 10,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ),
                                  Container(
                                    width: 110,
                                    height: 47,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: AuthUserStreamWidget(
                                        child: InkWell(
                                          onTap: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.provider,
                                                                      false) ==
                                                                  true
                                                              ? 'انت مقدم خدمة'
                                                              : 'انت طالب لخدمة'),
                                                          content: Text(valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.provider,
                                                                      false) ==
                                                                  true
                                                              ? 'انت مقدم خدمة هل تريد أن تصبح طالب لخدمة؟'
                                                              : 'انت طالب لخدمة هل تريد أن تصبح مقدم خدمة؟'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text('لا'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('نعم'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.provider,
                                                      false) ==
                                                  true) {
                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  provider: false,
                                                );
                                                await currentUserReference!
                                                    .update(usersUpdateData);
                                              } else {
                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  provider: true,
                                                );
                                                await currentUserReference!
                                                    .update(usersUpdateData);
                                              }
                                            }
                                          },
                                          child: Text(
                                            valueOrDefault<String>(
                                              valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.provider,
                                                          false) ==
                                                      true
                                                  ? 'تقديم خدمة'
                                                  : 'طلب خدمة',
                                              'تقديم خدمة',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          if (FFAppState().customizeTriger) {
                                            setState(() {
                                              FFAppState().customizeTriger =
                                                  false;
                                            });
                                          } else {
                                            setState(() {
                                              FFAppState().customizeTriger =
                                                  true;
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: 47,
                                          height: 47,
                                          decoration: BoxDecoration(
                                            color: FFAppState()
                                                        .customizeTriger ==
                                                    true
                                                ? Color(0xFFAE1518)
                                                : FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Stack(
                                            children: [
                                              if (FFAppState()
                                                      .customizeTriger ==
                                                  false)
                                                Icon(
                                                  Icons.edit_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  size: 24,
                                                ),
                                              if (FFAppState()
                                                      .customizeTriger ==
                                                  true)
                                                Icon(
                                                  Icons.cancel_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ).animateOnActionTrigger(
                                          animationsMap[
                                              'containerOnActionTriggerAnimation']!,
                                          hasBeenTriggered:
                                              hasContainerTriggered),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
