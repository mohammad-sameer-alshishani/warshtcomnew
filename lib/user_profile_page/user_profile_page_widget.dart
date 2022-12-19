import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class UserProfilePageWidget extends StatefulWidget {
  const UserProfilePageWidget({
    Key? key,
    this.userInfo,
  }) : super(key: key);

  final DocumentReference? userInfo;

  @override
  _UserProfilePageWidgetState createState() => _UserProfilePageWidgetState();
}

class _UserProfilePageWidgetState extends State<UserProfilePageWidget>
    with TickerProviderStateMixin {
  TextEditingController? commentBoxWriteController;
  double? ratingBarValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    commentBoxWriteController = TextEditingController();
  }

  @override
  void dispose() {
    commentBoxWriteController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userInfo!),
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
        final userProfilePageUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(
                    userProfilePageUsersRecord.reference),
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
                  final columnUsersRecord = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 2),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Container(
                                    width: 81,
                                    height: 81,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1, 1, 1, 1),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: CachedNetworkImage(
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    columnUsersRecord.photoUrl,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                  ),
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: true,
                                                tag: valueOrDefault<String>(
                                                  columnUsersRecord.photoUrl,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                ),
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: valueOrDefault<String>(
                                            columnUsersRecord.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                          ),
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                columnUsersRecord.photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                              ),
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              columnUsersRecord.displayName!,
                                              textAlign: TextAlign.end,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title3
                                                  .override(
                                                    fontFamily:
                                                        'Noto Kufi Arabic',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if (columnUsersRecord
                                                              .userWork !=
                                                          null &&
                                                      columnUsersRecord
                                                              .userWork !=
                                                          '')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, -0.05),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.050000000000000044,
                                                                  0),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          5,
                                                                          0),
                                                              child: Text(
                                                                columnUsersRecord
                                                                    .userWork!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Kufi Arabic',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    20, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'chatpage',
                                                              queryParams: {
                                                                'chatUser':
                                                                    serializeParam(
                                                                  columnUsersRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'chatUser':
                                                                    columnUsersRecord,
                                                              },
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .chat_bubble_outline_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          await Share.share(
                                                              columnUsersRecord
                                                                  .phoneNumber!);
                                                        },
                                                        child: Icon(
                                                          Icons.phone_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectionArea(
                                child: AutoSizeText(
                              userProfilePageUsersRecord.email!,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Noto Kufi Arabic',
                                    fontSize: 12,
                                  ),
                            )),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<ReveiwsRecord>>(
                                    stream: queryReveiwsRecord(
                                      queryBuilder: (reveiwsRecord) =>
                                          reveiwsRecord.where('reviewed_person',
                                              isEqualTo:
                                                  userProfilePageUsersRecord
                                                      .uid),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: SpinKitFadingCube(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 24,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ReveiwsRecord>
                                          ratingBarReveiwsRecordList =
                                          snapshot.data!;
                                      return RatingBarIndicator(
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFFF8E00),
                                        ),
                                        direction: Axis.horizontal,
                                        rating: valueOrDefault<double>(
                                          functions.rating(
                                              ratingBarReveiwsRecordList
                                                  .map((e) => e.rating!)
                                                  .toList()),
                                          0.0,
                                        ),
                                        unratedColor: Color(0xFF9E9E9E),
                                        itemCount: 5,
                                        itemSize: 22,
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: StreamBuilder<List<ReveiwsRecord>>(
                                      stream: queryReveiwsRecord(
                                        queryBuilder: (reveiwsRecord) =>
                                            reveiwsRecord.where(
                                                'reviewed_person',
                                                isEqualTo:
                                                    columnUsersRecord.uid),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: SpinKitFadingCube(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 24,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ReveiwsRecord>
                                            textReveiwsRecordList =
                                            snapshot.data!;
                                        return Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              functions.rating(
                                                  textReveiwsRecordList
                                                      .map((e) => e.rating!)
                                                      .toList()),
                                              formatType:
                                                  FormatType.compactLong,
                                            ),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الوصف',
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SelectionArea(
                                  child: AutoSizeText(
                                columnUsersRecord.userBio!,
                                maxLines: 5,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Noto Kufi Arabic',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: StreamBuilder<List<ReveiwsRecord>>(
                          stream: queryReveiwsRecord(
                            queryBuilder: (reveiwsRecord) =>
                                reveiwsRecord.where('reviewed_person',
                                    isEqualTo: columnUsersRecord.uid),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SpinKitFadingCube(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 24,
                                  ),
                                ),
                              );
                            }
                            List<ReveiwsRecord> tabBarReveiwsRecordList =
                                snapshot.data!;
                            return DefaultTabController(
                              length: 2,
                              initialIndex: 0,
                              child: Column(
                                children: [
                                  TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    indicatorColor: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    tabs: [
                                      Tab(
                                        text: 'أعمال سابقة',
                                      ),
                                      Tab(
                                        text: 'المراجعات',
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child:
                                              StreamBuilder<List<PostsRecord>>(
                                            stream: queryPostsRecord(
                                              queryBuilder: (postsRecord) =>
                                                  postsRecord
                                                      .where(
                                                          'post_user',
                                                          isEqualTo:
                                                              columnUsersRecord
                                                                  .reference)
                                                      .orderBy('time_posted',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      size: 24,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PostsRecord>
                                                  listViewPostsRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewPostsRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewPostsRecord =
                                                      listViewPostsRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 16, 12),
                                                    child: StreamBuilder<
                                                        List<PostsRecord>>(
                                                      stream:
                                                          queryPostsRecord(),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 24,
                                                              height: 24,
                                                              child:
                                                                  SpinKitFadingCube(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                size: 24,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<PostsRecord>
                                                            containerPostsRecordList =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'postPage',
                                                              queryParams: {
                                                                'postId':
                                                                    serializeParam(
                                                                  listViewPostsRecord
                                                                      .postID,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .scale,
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomCenter,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          5,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final postPhoto = listViewPostsRecord
                                                                          .postPhoto!
                                                                          .toList()
                                                                          .take(
                                                                              1)
                                                                          .toList();
                                                                      return Stack(
                                                                        children: List.generate(
                                                                            postPhoto.length,
                                                                            (postPhotoIndex) {
                                                                          final postPhotoItem =
                                                                              postPhoto[postPhotoIndex];
                                                                          return Container(
                                                                            width:
                                                                                90,
                                                                            height:
                                                                                90,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.cover,
                                                                                image: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    postPhotoItem,
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                                                  ),
                                                                                ).image,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          listViewPostsRecord
                                                                              .postTitle!
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                25,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'Noto Kufi Arabic',
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                              child: Text(
                                                                                'تاريخ النشر',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Noto Kufi Arabic',
                                                                                      fontSize: 10,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 0),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  'relative',
                                                                                  listViewPostsRecord.timePosted!,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      color: Color(0xFF57636C),
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                'مكان العمل',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Noto Kufi Arabic',
                                                                                      fontSize: 11,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                child: Text(
                                                                                  userProfilePageUsersRecord.userLocation!,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: StreamBuilder<
                                                        List<ReveiwsRecord>>(
                                                      stream:
                                                          queryReveiwsRecord(
                                                        queryBuilder: (reveiwsRecord) =>
                                                            reveiwsRecord.where(
                                                                'reviewed_person',
                                                                isEqualTo: columnUsersRecord
                                                                            .uid !=
                                                                        ''
                                                                    ? columnUsersRecord
                                                                        .uid
                                                                    : null),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 24,
                                                              height: 24,
                                                              child:
                                                                  SpinKitFadingCube(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                size: 24,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ReveiwsRecord>
                                                            listViewReveiwsRecordList =
                                                            snapshot.data!;
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewReveiwsRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewReveiwsRecord =
                                                                listViewReveiwsRecordList[
                                                                    listViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          12),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      ReveiwsRecord>>(
                                                                stream:
                                                                    queryReveiwsRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            24,
                                                                        height:
                                                                            24,
                                                                        child:
                                                                            SpinKitFadingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<ReveiwsRecord>
                                                                      containerReveiwsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              2,
                                                                              2,
                                                                              2,
                                                                              2),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              UsersRecord>>(
                                                                        stream:
                                                                            queryUsersRecord(
                                                                          queryBuilder: (usersRecord) => usersRecord.where(
                                                                              'uid',
                                                                              isEqualTo: listViewReveiwsRecord.reviewedBy),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<UsersRecord>
                                                                              columnUsersRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final columnUsersRecord = columnUsersRecordList.isNotEmpty
                                                                              ? columnUsersRecordList.first
                                                                              : null;
                                                                          return SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                                          child: Container(
                                                                                                            width: 40,
                                                                                                            height: 40,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                              image: DecorationImage(
                                                                                                                fit: BoxFit.cover,
                                                                                                                image: Image.network(
                                                                                                                  columnUsersRecord!.photoUrl != null && columnUsersRecord!.photoUrl != '' ? (columnUsersRecord!.photoUrl != '' ? columnUsersRecord!.photoUrl! : ' ') : ' ',
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              shape: BoxShape.circle,
                                                                                                            ),
                                                                                                            child: Visibility(
                                                                                                              visible: () {
                                                                                                                if (columnUsersRecord!.photoUrl != null && columnUsersRecord!.photoUrl != '') {
                                                                                                                  return (columnUsersRecord!.photoUrl == '');
                                                                                                                } else if (columnUsersRecord!.photoUrl == null || columnUsersRecord!.photoUrl == '') {
                                                                                                                  return true;
                                                                                                                } else {
                                                                                                                  return false;
                                                                                                                }
                                                                                                              }(),
                                                                                                              child: Icon(
                                                                                                                Icons.person_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                size: 24,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                                          child: Text(
                                                                                                            columnUsersRecord!.displayName!.maybeHandleOverflow(
                                                                                                              maxChars: 15,
                                                                                                              replacement: '…',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 18,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                                          child: RatingBarIndicator(
                                                                                                            itemBuilder: (context, index) => Icon(
                                                                                                              Icons.star_rounded,
                                                                                                              color: Color(0xFFFFA130),
                                                                                                            ),
                                                                                                            direction: Axis.horizontal,
                                                                                                            rating: listViewReveiwsRecord.rating!,
                                                                                                            unratedColor: FlutterFlowTheme.of(context).alternate,
                                                                                                            itemCount: 5,
                                                                                                            itemSize: 20,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (columnUsersRecord!.uid == currentUserUid)
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                                child: InkWell(
                                                                                                                  onTap: () async {
                                                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                                                          context: context,
                                                                                                                          builder: (alertDialogContext) {
                                                                                                                            return AlertDialog(
                                                                                                                              title: Text('حذف المراجعة'),
                                                                                                                              content: Text('هل تريد حذف المراجعة؟'),
                                                                                                                              actions: [
                                                                                                                                TextButton(
                                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                  child: Text('الغاء'),
                                                                                                                                ),
                                                                                                                                TextButton(
                                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                  child: Text('تأكيد'),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ) ??
                                                                                                                        false;
                                                                                                                    if (confirmDialogResponse) {
                                                                                                                      final usersUpdateData = {
                                                                                                                        'reviewed_by': FieldValue.arrayRemove([currentUserReference]),
                                                                                                                      };
                                                                                                                      await userProfilePageUsersRecord.reference.update(usersUpdateData);
                                                                                                                      await Future.delayed(const Duration(milliseconds: 500));
                                                                                                                      await listViewReveiwsRecord.reference.delete();
                                                                                                                    }
                                                                                                                  },
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Icon(
                                                                                                                      Icons.delete_forever_rounded,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                      size: 24,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      dateTimeFormat(
                                                                                                        'relative',
                                                                                                        listViewReveiwsRecord.createdAt!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Noto Kufi Arabic',
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          listViewReveiwsRecord.reviewText!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                fontSize: 14,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                if (columnUsersRecord
                                                        .reviewedBy!
                                                        .toList()
                                                        .contains(
                                                            currentUserReference) ==
                                                    false)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child:
                                                            RatingBar.builder(
                                                          onRatingUpdate: (newValue) =>
                                                              setState(() =>
                                                                  ratingBarValue3 =
                                                                      newValue),
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Icon(
                                                            Icons.star_rounded,
                                                            color: Color(
                                                                0xFFFF8E00),
                                                          ),
                                                          direction:
                                                              Axis.horizontal,
                                                          initialRating:
                                                              ratingBarValue3 ??=
                                                                  3,
                                                          unratedColor:
                                                              Color(0x75329DC9),
                                                          itemCount: 5,
                                                          itemSize: 30,
                                                          glowColor:
                                                              Color(0xFFFF8E00),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            commentBoxWriteController,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'اترك مراجعة ..',
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).bodyText2,
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              16,
                                                                              0,
                                                                              0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                        maxLines:
                                                                            4,
                                                                        keyboardType:
                                                                            TextInputType.multiline,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        final reveiwsCreateData =
                                                                            createReveiwsRecordData(
                                                                          reviewText:
                                                                              commentBoxWriteController!.text,
                                                                          reviewUserPhoto:
                                                                              currentUserPhoto,
                                                                          reviewedBy:
                                                                              currentUserUid,
                                                                          reviewedPerson:
                                                                              userProfilePageUsersRecord.uid,
                                                                          createdAt:
                                                                              getCurrentTimestamp,
                                                                          rating:
                                                                              ratingBarValue3,
                                                                          reviewedByRef:
                                                                              currentUserReference,
                                                                        );
                                                                        await ReveiwsRecord
                                                                            .collection
                                                                            .doc()
                                                                            .set(reveiwsCreateData);

                                                                        final usersUpdateData =
                                                                            {
                                                                          'reviewed_by':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        };
                                                                        await userProfilePageUsersRecord
                                                                            .reference
                                                                            .update(usersUpdateData);
                                                                        setState(
                                                                            () {
                                                                          commentBoxWriteController
                                                                              ?.clear();
                                                                        });
                                                                      },
                                                                      text:
                                                                          'نشر',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            55,
                                                                        height:
                                                                            35,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .subtitle2
                                                                            .override(
                                                                              fontFamily: 'Noto Kufi Arabic',
                                                                              color: Color(0xFEEEEEEE),
                                                                              fontSize: 13,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                        elevation:
                                                                            2,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(50),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
