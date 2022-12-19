import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostPageWidget extends StatefulWidget {
  const PostPageWidget({
    Key? key,
    this.postId,
  }) : super(key: key);

  final String? postId;

  @override
  _PostPageWidgetState createState() => _PostPageWidgetState();
}

class _PostPageWidgetState extends State<PostPageWidget> {
  TextEditingController? commentBoxWriteController;
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: StreamBuilder<List<PostsRecord>>(
          stream: queryPostsRecord(
            queryBuilder: (postsRecord) =>
                postsRecord.where('post_ID', isEqualTo: widget.postId),
            singleRecord: true,
          ),
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
            List<PostsRecord> stackPostsRecordList = snapshot.data!;
            // Return an empty Container when the item does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final stackPostsRecord = stackPostsRecordList.isNotEmpty
                ? stackPostsRecordList.first
                : null;
            return Stack(
              children: [
                StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(stackPostsRecord!.postUser!),
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
                    final listViewUsersRecord = snapshot.data!;
                    return ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        StreamBuilder<List<CommentsRecord>>(
                          stream: queryCommentsRecord(
                            queryBuilder: (commentsRecord) =>
                                commentsRecord.where('commented_post_id',
                                    isEqualTo: widget.postId != ''
                                        ? widget.postId
                                        : null),
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
                            List<CommentsRecord> containerCommentsRecordList =
                                snapshot.data!;
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.85,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'UserProfilePage',
                                          queryParams: {
                                            'userInfo': serializeParam(
                                              listViewUsersRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 75,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'UserProfilePage',
                                              queryParams: {
                                                'userInfo': serializeParam(
                                                  listViewUsersRecord.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      listViewUsersRecord
                                                          .photoUrl,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                    ),
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        stackPostsRecord!
                                                            .postUserName!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          'relative',
                                                          stackPostsRecord!
                                                              .timePosted!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  StreamBuilder<
                                                      List<ReveiwsRecord>>(
                                                    stream: queryReveiwsRecord(
                                                      queryBuilder: (reveiwsRecord) =>
                                                          reveiwsRecord.where(
                                                              'reviewed_person',
                                                              isEqualTo:
                                                                  listViewUsersRecord
                                                                      .uid),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    .map((e) =>
                                                                        e.rating!)
                                                                    .toList()),
                                                            formatType:
                                                                FormatType
                                                                    .compactLong,
                                                          ),
                                                          '-',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      );
                                                    },
                                                  ),
                                                  Icon(
                                                    Icons.star_rate_rounded,
                                                    color: Color(0xFFFF8E00),
                                                    size: 30,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SelectionArea(
                                        child: Text(
                                      stackPostsRecord!.postTitle!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Noto Kufi Arabic',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    )),
                                    Expanded(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.75,
                                        decoration: BoxDecoration(),
                                        child: DefaultTabController(
                                          length: 2,
                                          initialIndex: 0,
                                          child: Column(
                                            children: [
                                              TabBar(
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                tabs: [
                                                  Tab(
                                                    text: 'الوصف',
                                                  ),
                                                  Tab(
                                                    text: 'التعليقات',
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  children: [
                                                    ListView(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      12, 0, 0),
                                                          child: Text(
                                                            stackPostsRecord!
                                                                .postDescription!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Kufi Arabic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          ),
                                                        ),
                                                        if (stackPostsRecord!
                                                                .postPhoto!
                                                                .toList()
                                                                .length !=
                                                            0)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 350,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxHeight: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    1,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Visibility(
                                                                visible: stackPostsRecord!
                                                                        .postPhoto!
                                                                        .toList()
                                                                        .length !=
                                                                    null,
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final postPhotos = stackPostsRecord!
                                                                        .postPhoto!
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e)
                                                                        .toList();
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      itemCount:
                                                                          postPhotos
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              postPhotosIndex) {
                                                                        final postPhotosItem =
                                                                            postPhotos[postPhotosIndex];
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.9,
                                                                          height:
                                                                              100,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: CachedNetworkImageProvider(
                                                                                valueOrDefault<String>(
                                                                                  postPhotosItem,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                                                ),
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
                                                          ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        12,
                                                                        0,
                                                                        0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    ReveiwsRecord>>(
                                                              stream:
                                                                  queryReveiwsRecord(
                                                                queryBuilder: (reveiwsRecord) => reveiwsRecord.where(
                                                                    'reviewed_post',
                                                                    isEqualTo: widget.postId !=
                                                                            ''
                                                                        ? widget
                                                                            .postId
                                                                        : null),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 24,
                                                                      height:
                                                                          24,
                                                                      child:
                                                                          SpinKitFadingCube(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ReveiwsRecord>
                                                                    rowReveiwsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final rowReveiwsRecord =
                                                                    rowReveiwsRecordList
                                                                            .isNotEmpty
                                                                        ? rowReveiwsRecordList
                                                                            .first
                                                                        : null;
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            final likedByElement =
                                                                                currentUserReference;
                                                                            final likedByUpdate = stackPostsRecord!.likedBy!.toList().contains(likedByElement)
                                                                                ? FieldValue.arrayRemove([
                                                                                    likedByElement
                                                                                  ])
                                                                                : FieldValue.arrayUnion([
                                                                                    likedByElement
                                                                                  ]);
                                                                            final postsUpdateData =
                                                                                {
                                                                              'liked_by': likedByUpdate,
                                                                            };
                                                                            await stackPostsRecord!.reference.update(postsUpdateData);
                                                                          },
                                                                          value: stackPostsRecord!
                                                                              .likedBy!
                                                                              .toList()
                                                                              .contains(currentUserReference),
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.favorite_rounded,
                                                                            color:
                                                                                Color(0xFFFF0000),
                                                                            size:
                                                                                25,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.favorite_border_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            size:
                                                                                25,
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            if (stackPostsRecord!.likedBy!.toList().contains(currentUserReference)) {
                                                                              final postsUpdateData = {
                                                                                'liked_by': FieldValue.arrayRemove([
                                                                                  currentUserReference
                                                                                ]),
                                                                              };
                                                                              await stackPostsRecord!.reference.update(postsUpdateData);

                                                                              final usersUpdateData = {
                                                                                'liked_posts': FieldValue.arrayRemove([
                                                                                  stackPostsRecord!.reference
                                                                                ]),
                                                                              };
                                                                              await listViewUsersRecord.reference.update(usersUpdateData);
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'تم ازالة  المنشورمن المفضلة',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 3000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              final postsUpdateData = {
                                                                                'liked_by': FieldValue.arrayUnion([
                                                                                  currentUserReference
                                                                                ]),
                                                                              };
                                                                              await stackPostsRecord!.reference.update(postsUpdateData);

                                                                              final usersUpdateData = {
                                                                                'liked_posts': FieldValue.arrayUnion([
                                                                                  stackPostsRecord!.reference
                                                                                ]),
                                                                              };
                                                                              await listViewUsersRecord.reference.update(usersUpdateData);
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'تم اضافة المنشور للمفضلة',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 3000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                45,
                                                                            height:
                                                                                45,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00FFFFFF),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            stackPostsRecord!.likedBy!.toList().length,
                                                                            formatType:
                                                                                FormatType.compact,
                                                                          ),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              24,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .mode_comment_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                    if (rowReveiwsRecord !=
                                                                        null)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child: StreamBuilder<
                                                                            ReveiwsRecord>(
                                                                          stream:
                                                                              ReveiwsRecord.getDocument(rowReveiwsRecord!.reference),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            final textReveiwsRecord =
                                                                                snapshot.data!;
                                                                            return Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  containerCommentsRecordList.length,
                                                                                  formatType: FormatType.compact,
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyText1,
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
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          16,
                                                                          0,
                                                                          12),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      CommentsRecord>>(
                                                                stream:
                                                                    queryCommentsRecord(
                                                                  queryBuilder: (commentsRecord) => commentsRecord
                                                                      .where(
                                                                          'commented_post_id',
                                                                          isEqualTo: widget.postId != ''
                                                                              ? widget
                                                                                  .postId
                                                                              : null)
                                                                      .orderBy(
                                                                          'created_at'),
                                                                ),
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
                                                                  List<CommentsRecord>
                                                                      listViewCommentsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listViewCommentsRecordList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listViewIndex) {
                                                                      final listViewCommentsRecord =
                                                                          listViewCommentsRecordList[
                                                                              listViewIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            12),
                                                                        child: StreamBuilder<
                                                                            List<UsersRecord>>(
                                                                          stream:
                                                                              queryUsersRecord(
                                                                            queryBuilder: (usersRecord) =>
                                                                                usersRecord.where('uid', isEqualTo: listViewCommentsRecord.commentedById),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<UsersRecord>
                                                                                rowUsersRecordList =
                                                                                snapshot.data!;
                                                                            // Return an empty Container when the item does not exist.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container();
                                                                            }
                                                                            final rowUsersRecord = rowUsersRecordList.isNotEmpty
                                                                                ? rowUsersRecordList.first
                                                                                : null;
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 40,
                                                                                  height: 40,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(40),
                                                                                    child: Image.network(
                                                                                      rowUsersRecord!.photoUrl!,
                                                                                      width: 40,
                                                                                      height: 40,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                          borderRadius: BorderRadius.circular(12),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    rowUsersRecord!.displayName!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        if (rowUsersRecord!.reference == currentUserReference)
                                                                                                          InkWell(
                                                                                                            onTap: () async {
                                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                                    context: context,
                                                                                                                    builder: (alertDialogContext) {
                                                                                                                      return AlertDialog(
                                                                                                                        title: Text('اعدادات التعليقات'),
                                                                                                                        content: Text('هل تريد حذف التعليق؟'),
                                                                                                                        actions: [
                                                                                                                          TextButton(
                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                            child: Text('الغاء'),
                                                                                                                          ),
                                                                                                                          TextButton(
                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                            child: Text('حذف التعليق'),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ) ??
                                                                                                                  false;
                                                                                                              if (confirmDialogResponse) {
                                                                                                                await listViewCommentsRecord.reference.delete();
                                                                                                              }
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              width: 30,
                                                                                                              height: 30,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Icon(
                                                                                                                Icons.delete_forever_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                size: 20,
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
                                                                                                decoration: BoxDecoration(),
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  listViewCommentsRecord.commentText!,
                                                                                                  maxLines: 35,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText2,
                                                                                                )),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 0, 0),
                                                                                      child: Text(
                                                                                        dateTimeFormat(
                                                                                          'relative',
                                                                                          listViewCommentsRecord.createdAt!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText2,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
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
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 120,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
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
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            80,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0),
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 4, 0),
                                                                                  child: TextFormField(
                                                                                    controller: commentBoxWriteController,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'اضافة تعليق ..',
                                                                                      labelStyle: FlutterFlowTheme.of(context).bodyText2,
                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyText1,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                      ),
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    maxLines: 4,
                                                                                    keyboardType: TextInputType.multiline,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    final commentsCreateData = createCommentsRecordData(
                                                                                      createdAt: getCurrentTimestamp,
                                                                                      commentText: commentBoxWriteController!.text,
                                                                                      commentedByRef: currentUserReference,
                                                                                      commentedPost: stackPostsRecord!.reference,
                                                                                      commentedPostUserRef: stackPostsRecord!.postUser,
                                                                                      commentedByUserPhoto: currentUserPhoto,
                                                                                      commentedPostId: stackPostsRecord!.postID,
                                                                                      commentedById: currentUserUid,
                                                                                    );
                                                                                    await CommentsRecord.collection.doc().set(commentsCreateData);
                                                                                    setState(() {
                                                                                      commentBoxWriteController?.clear();
                                                                                    });
                                                                                  },
                                                                                  text: 'نشر',
                                                                                  options: FFButtonOptions(
                                                                                    width: 55,
                                                                                    height: 35,
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                          color: Color(0xFEEEEEEE),
                                                                                          fontSize: 13,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                    elevation: 2,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(50),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
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
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
