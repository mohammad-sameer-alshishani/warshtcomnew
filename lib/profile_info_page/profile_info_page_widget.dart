import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileInfoPageWidget extends StatefulWidget {
  const ProfileInfoPageWidget({Key? key}) : super(key: key);

  @override
  _ProfileInfoPageWidgetState createState() => _ProfileInfoPageWidgetState();
}

class _ProfileInfoPageWidgetState extends State<ProfileInfoPageWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0x00212121),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
          child: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.more_vert_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        title: Text(
          'الصفحة الشخصية',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Noto Kufi Arabic',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional(0, 0),
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() =>
                                                    isMediaUploading = true);
                                                var downloadUrls = <String>[];
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
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  isMediaUploading = false;
                                                }
                                                if (downloadUrls.length ==
                                                    selectedMedia.length) {
                                                  setState(() =>
                                                      uploadedFileUrl =
                                                          downloadUrls.first);
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
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/Photo_1667408356874.png',
                                                  ).image,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      StreamBuilder<List<PostsRecord>>(
                                        stream: queryPostsRecord(
                                          queryBuilder: (postsRecord) =>
                                              postsRecord.where('post_user',
                                                  isEqualTo:
                                                      currentUserReference),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PostsRecord>
                                              stackPostsRecordList =
                                              snapshot.data!;
                                          return Stack(
                                            children: List.generate(
                                                stackPostsRecordList.length,
                                                (stackIndex) {
                                              final stackPostsRecord =
                                                  stackPostsRecordList[
                                                      stackIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      'الخدمات',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: AuthUserStreamWidget(
                                                      child: SelectionArea(
                                                          child: Text(
                                                        formatNumber(
                                                          (currentUserDocument
                                                                      ?.allPosts
                                                                      ?.toList() ??
                                                                  [])
                                                              .length,
                                                          formatType: FormatType
                                                              .compact,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 0, 0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      'المفضلة',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: AuthUserStreamWidget(
                                                      child: SelectionArea(
                                                          child: Text(
                                                        formatNumber(
                                                          (currentUserDocument
                                                                      ?.likedPosts
                                                                      ?.toList() ??
                                                                  [])
                                                              .length,
                                                          formatType: FormatType
                                                              .compact,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: AuthUserStreamWidget(
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        currentUserDisplayName,
                                                        'اسم المستخدم',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 15,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Kufi Arabic',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 20,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.provider,
                                                        false) ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: AuthUserStreamWidget(
                                                      child: Container(
                                                        width: 100,
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate
                                                            ],
                                                            stops: [0, 1],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0.07, -1),
                                                            end:
                                                                AlignmentDirectional(
                                                                    -0.07, 1),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        alignment: AlignmentDirectional(
                                                            0.050000000000000044,
                                                            0.050000000000000044),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          valueOrDefault<bool>(
                                                                      currentUserDocument
                                                                          ?.provider,
                                                                      false) ==
                                                                  false
                                                              ? 'باحث عن خدمة'
                                                              : 'مزود خدمة',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Kufi Arabic',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                              ),
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onLongPress: () async {
                                                      await Share.share(
                                                          currentUserUid);
                                                    },
                                                    child: SelectionArea(
                                                        child: Text(
                                                      valueOrDefault<String>(
                                                        currentUserUid,
                                                        'الرقم المعرف',
                                                      ),
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Kufi Arabic',
                                                                fontSize: 12,
                                                              ),
                                                    )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                3, 0, 3, 0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      ': ID',
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          currentUserEmail,
                                          'البريد الالكتروني',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Noto Kufi Arabic',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.phone_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child: InkWell(
                                          onLongPress: () async {
                                            await launchUrl(Uri(
                                              scheme: 'tel',
                                              path: currentPhoneNumber,
                                            ));
                                          },
                                          child: SelectionArea(
                                              child: Text(
                                            valueOrDefault<String>(
                                              currentPhoneNumber,
                                              'لا يوجد',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      'Noto Kufi Arabic',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.category_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child: SelectionArea(
                                            child: AutoSizeText(
                                          valueOrDefault<String>(
                                            valueOrDefault(
                                                currentUserDocument?.userWork,
                                                ''),
                                            'لا يوجد',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Noto Kufi Arabic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.info_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 24,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: AuthUserStreamWidget(
                                          child: SelectionArea(
                                              child: AutoSizeText(
                                            valueOrDefault<String>(
                                              valueOrDefault(
                                                  currentUserDocument?.userBio,
                                                  ''),
                                              'لا يوجد',
                                            ).maybeHandleOverflow(
                                              maxChars: 150,
                                              replacement: '…',
                                            ),
                                            maxLines: 5,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      'Noto Kufi Arabic',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                        'EditProfile',
                                        queryParams: {
                                          'userRecordRef': serializeParam(
                                            currentUserReference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    text: 'تعديل البيانات',
                                    options: FFButtonOptions(
                                      width: 150,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Noto Kufi Arabic',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      borderSide: BorderSide(
                                        color: Color(0x00212121),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.provider,
                                            false) ==
                                        false)
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: AuthUserStreamWidget(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if ((currentUserEmail != null &&
                                                      currentUserEmail != '') &&
                                                  (currentUserDisplayName != null &&
                                                      currentUserDisplayName !=
                                                          '') &&
                                                  (currentPhoneNumber != null &&
                                                      currentPhoneNumber !=
                                                          '') &&
                                                  (valueOrDefault(currentUserDocument?.userGender, '') != null &&
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.userGender,
                                                              '') !=
                                                          '') &&
                                                  (valueOrDefault(currentUserDocument?.userLocation, '') != null &&
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.userLocation,
                                                              '') !=
                                                          '') &&
                                                  (valueOrDefault(currentUserDocument?.userWork, '') !=
                                                          null &&
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.userWork,
                                                              '') !=
                                                          '') &&
                                                  (valueOrDefault(currentUserDocument?.userBio, '') !=
                                                          null &&
                                                      valueOrDefault(currentUserDocument?.userBio, '') != '')) {
                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  provider: true,
                                                );
                                                await currentUserReference!
                                                    .update(usersUpdateData);
                                              } else {
                                                context.pushNamed(
                                                    'ChangeToProvider');
                                              }
                                            },
                                            text: 'تحويل لمزود خدمة',
                                            options: FFButtonOptions(
                                              width: 150,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Noto Kufi Arabic',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.provider,
                                            false) ==
                                        true)
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: AuthUserStreamWidget(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final usersUpdateData =
                                                  createUsersRecordData(
                                                provider: false,
                                              );
                                              await currentUserReference!
                                                  .update(usersUpdateData);
                                            },
                                            text: 'تحويل لباحث ',
                                            options: FFButtonOptions(
                                              width: 150,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Noto Kufi Arabic',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'MyProfilePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.topToBottom,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_up_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 18,
                                ),
                                SelectionArea(
                                    child: Text(
                                  'اسحب للأعلى',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Noto Kufi Arabic',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 12,
                                      ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
