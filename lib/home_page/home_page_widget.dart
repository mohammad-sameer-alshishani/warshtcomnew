import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/about_widget.dart';
import '../components/bottom_sheet_post_widget.dart';
import '../components/bottom_sheet_request_post_widget.dart';
import '../components/filter_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/permissions_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.authenticatedUserRecieveDoc,
    this.postRecordRef,
  }) : super(key: key);

  final DocumentReference? authenticatedUserRecieveDoc;
  final DocumentReference? postRecordRef;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -100),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-100, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-100, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(photoLibraryPermission);
      await requestPermission(contactsPermission);
      await requestPermission(notificationsPermission);
      setState(() {
        FFAppState().filterizationDefault = FFAppState().jobsTypes.toList();
      });
      setState(() {
        FFAppState().searchInitialTab = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed('ServiceProvide');
        },
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        elevation: 8,
        child: Icon(
          Icons.add_rounded,
          color: FlutterFlowTheme.of(context).secondaryColor,
          size: 40,
        ),
      ).animateOnPageLoad(
          animationsMap['floatingActionButtonOnPageLoadAnimation']!),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
              ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: AuthUserStreamWidget(
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  valueOrDefault<String>(
                                    currentUserPhoto != null &&
                                            currentUserPhoto != ''
                                        ? valueOrDefault<String>(
                                            currentUserPhoto != ''
                                                ? currentUserPhoto
                                                : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                          )
                                        : ' https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                  ),
                                ),
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'مرحباً',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Noto Kufi Arabic',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation1']!),
                              ],
                            ),
                            AuthUserStreamWidget(
                              child: GradientText(
                                valueOrDefault<String>(
                                  currentUserDisplayName,
                                  'بكم',
                                ).maybeHandleOverflow(maxChars: 20),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Noto Kufi Arabic',
                                      fontSize: 23,
                                    ),
                                colors: [
                                  FlutterFlowTheme.of(context).tertiaryColor,
                                  FlutterFlowTheme.of(context).secondaryText
                                ],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation2']!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 50,
                          height: 60,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            onTap: () async {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.75,
                                      child: FilterWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Icon(
                              Icons.filter_alt,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              onTap: () async {
                                context.pushNamed('SearchPageCopy');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Icon(
                                      Icons.search_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      size: 24,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'ابحث ..',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Noto Kufi Arabic',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
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
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.7,
                  ),
                  decoration: BoxDecoration(),
                  child: DefaultTabController(
                    length: 4,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          labelColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          labelStyle: FlutterFlowTheme.of(context).bodyText1,
                          indicatorColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                          tabs: [
                            AuthUserStreamWidget(
                              child: Tab(
                                text: valueOrDefault<bool>(
                                            currentUserDocument?.provider,
                                            false) ==
                                        true
                                    ? 'الطلبات'
                                    : 'الخدمات',
                                icon: Icon(
                                  Icons.miscellaneous_services_rounded,
                                ),
                              ),
                            ),
                            Tab(
                              text: 'المفضلة',
                              icon: Icon(
                                Icons.favorite_rounded,
                                color: Color(0xFFCF1F23),
                              ),
                            ),
                            Tab(
                              text: 'المحفوظات',
                              icon: Icon(
                                Icons.save_alt_rounded,
                              ),
                            ),
                            Tab(
                              text: 'الورشة',
                              icon: Icon(
                                Icons.settings_rounded,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              KeepAliveWidgetWrapper(
                                builder: (context) => Stack(
                                  children: [
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.provider,
                                            false) ==
                                        false)
                                      AuthUserStreamWidget(
                                        child: StreamBuilder<List<PostsRecord>>(
                                          stream: queryPostsRecord(
                                            queryBuilder: (postsRecord) => postsRecord
                                                .where('post_type',
                                                    isEqualTo: FFAppState()
                                                                .filterByWork !=
                                                            ''
                                                        ? FFAppState()
                                                            .filterByWork
                                                        : null)
                                                .where('post_user_location',
                                                    isEqualTo: FFAppState()
                                                                .filterByCities !=
                                                            ''
                                                        ? FFAppState()
                                                            .filterByCities
                                                        : null)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    size: 24,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<PostsRecord>
                                                listViewProvidingPostsRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewProvidingPostsRecordList
                                                      .length,
                                              itemBuilder: (context,
                                                  listViewProvidingIndex) {
                                                final listViewProvidingPostsRecord =
                                                    listViewProvidingPostsRecordList[
                                                        listViewProvidingIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 5, 5),
                                                  child: StreamBuilder<
                                                      UsersRecord>(
                                                    stream: UsersRecord.getDocument(
                                                        listViewProvidingPostsRecord
                                                            .postUser!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        30),
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
                                                          ),
                                                        );
                                                      }
                                                      final socialPostUsersRecord =
                                                          snapshot.data!;
                                                      return InkWell(
                                                        onLongPress: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.5,
                                                                  child:
                                                                      BottomSheetPostWidget(
                                                                    postRefForBottomSheet:
                                                                        listViewProvidingPostsRecord
                                                                            .reference,
                                                                    userRefForBottomSheet:
                                                                        socialPostUsersRecord
                                                                            .reference,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        4,
                                                                        4,
                                                                        4),
                                                            child: StreamBuilder<
                                                                List<
                                                                    UsersRecord>>(
                                                              stream:
                                                                  queryUsersRecord(
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
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              30),
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
                                                                    ),
                                                                  );
                                                                }
                                                                List<UsersRecord>
                                                                    columnUsersRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final columnUsersRecord =
                                                                    columnUsersRecordList
                                                                            .isNotEmpty
                                                                        ? columnUsersRecordList
                                                                            .first
                                                                        : null;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              8,
                                                                              10,
                                                                              4),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(socialPostUsersRecord.reference),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                                                                                      child: SizedBox(
                                                                                        width: 24,
                                                                                        height: 24,
                                                                                        child: SpinKitFadingCube(
                                                                                          color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                          size: 24,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                final rowUsersRecord = snapshot.data!;
                                                                                return InkWell(
                                                                                  onTap: () async {
                                                                                    if (rowUsersRecord.reference == currentUserReference) {
                                                                                      context.pushNamed(
                                                                                        'MyProfilePage',
                                                                                        queryParams: {
                                                                                          'userRefRecieve': serializeParam(
                                                                                            currentUserReference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    } else {
                                                                                      context.pushNamed(
                                                                                        'UserProfilePage',
                                                                                        queryParams: {
                                                                                          'userInfo': serializeParam(
                                                                                            rowUsersRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          kTransitionInfoKey: TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.fade,
                                                                                            duration: Duration(milliseconds: 300),
                                                                                          ),
                                                                                        },
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                        child: Container(
                                                                                          width: 50,
                                                                                          height: 50,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0, 0.050000000000000044),
                                                                                          child: Stack(
                                                                                            children: [
                                                                                              if (rowUsersRecord.photoUrl != null && rowUsersRecord.photoUrl != '')
                                                                                                Container(
                                                                                                  width: 101,
                                                                                                  height: 101,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                      width: 2,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Visibility(
                                                                                                    visible: rowUsersRecord.photoUrl != null && rowUsersRecord.photoUrl != '',
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(50),
                                                                                                      child: CachedNetworkImage(
                                                                                                        imageUrl: rowUsersRecord.photoUrl!,
                                                                                                        width: 100,
                                                                                                        height: 100,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              if (rowUsersRecord.photoUrl == '')
                                                                                                Container(
                                                                                                  width: 101,
                                                                                                  height: 101,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    shape: BoxShape.circle,
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                      width: 2,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Visibility(
                                                                                                    visible: rowUsersRecord.photoUrl == '',
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(0, 0.05),
                                                                                                      child: Icon(
                                                                                                        Icons.person_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                        size: 30,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: AutoSizeText(
                                                                                                      socialPostUsersRecord.displayName!.maybeHandleOverflow(
                                                                                                        maxChars: 20,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                            fontFamily: 'Noto Kufi Arabic',
                                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                            fontSize: 18,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                                                                        child: Icon(
                                                                                                          Icons.star_rate_rounded,
                                                                                                          color: Color(0xFFFF8E00),
                                                                                                          size: 24,
                                                                                                        ),
                                                                                                      ),
                                                                                                      StreamBuilder<List<ReveiwsRecord>>(
                                                                                                        stream: queryReveiwsRecord(
                                                                                                          queryBuilder: (reveiwsRecord) => reveiwsRecord.where('reviewed_person', isEqualTo: socialPostUsersRecord.uid),
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
                                                                                                          List<ReveiwsRecord> textReveiwsRecordList = snapshot.data!;
                                                                                                          return Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              formatNumber(
                                                                                                                functions.rating(textReveiwsRecordList.map((e) => e.rating!).toList()),
                                                                                                                formatType: FormatType.compactLong,
                                                                                                              ),
                                                                                                              '-',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                                  fontSize: 14,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        InkWell(
                                                                                                          onTap: () async {
                                                                                                            showModalBottomSheet(
                                                                                                              isScrollControlled: true,
                                                                                                              backgroundColor: Colors.transparent,
                                                                                                              context: context,
                                                                                                              builder: (context) {
                                                                                                                return Padding(
                                                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                                                  child: Container(
                                                                                                                    height: MediaQuery.of(context).size.height * 0.65,
                                                                                                                    child: BottomSheetPostWidget(
                                                                                                                      postRefForBottomSheet: listViewProvidingPostsRecord.reference,
                                                                                                                      userRefForBottomSheet: socialPostUsersRecord.reference,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => setState(() {}));
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 30,
                                                                                                            height: 30,
                                                                                                            decoration: BoxDecoration(
                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                            ),
                                                                                                            child: Icon(
                                                                                                              Icons.more_vert_rounded,
                                                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                              size: 28,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewProvidingPostsRecord.postType!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          fontSize: 14,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                    child: Text(
                                                                                                      '•',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                            fontFamily: 'Noto Kufi Arabic',
                                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                            fontSize: 14,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                    child: Text(
                                                                                                      dateTimeFormat(
                                                                                                        'relative',
                                                                                                        listViewProvidingPostsRecord.timePosted!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                            fontFamily: 'Noto Kufi Arabic',
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            fontSize: 14,
                                                                                                            fontWeight: FontWeight.normal,
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
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              8),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                'postPage',
                                                                                queryParams: {
                                                                                  'postId': serializeParam(
                                                                                    listViewProvidingPostsRecord.postID,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.topToBottom,
                                                                                  ),
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 10),
                                                                                  child: Text(
                                                                                    listViewProvidingPostsRecord.postTitle!,
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 14,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Divider(),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                        child: Text(
                                                                                          listViewProvidingPostsRecord.postDescription!.maybeHandleOverflow(
                                                                                            maxChars: 50,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Noto Kufi Arabic',
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                if (listViewProvidingPostsRecord.postPhoto!.toList().length != 0)
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: 100,
                                                                                          height: 110,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.rectangle,
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0, 0),
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final postPhotos = listViewProvidingPostsRecord.postPhoto!.toList().map((e) => e).toList().take(3).toList();
                                                                                              return Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: List.generate(postPhotos.length, (postPhotosIndex) {
                                                                                                  final postPhotosItem = postPhotos[postPhotosIndex];
                                                                                                  return Container(
                                                                                                    width: 100,
                                                                                                    height: 100,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                                    ),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                                      child: CachedNetworkImage(
                                                                                                        imageUrl: postPhotosItem,
                                                                                                        width: 100,
                                                                                                        height: 100,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.attach_money_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    size: 24,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewProvidingPostsRecord.price?.toString(),
                                                                                                      '-',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                                                    child: Text(
                                                                                                      '/',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    listViewProvidingPostsRecord.priceType!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                              child: InkWell(
                                                                                                onTap: () async {
                                                                                                  context.pushNamed(
                                                                                                    'postPage',
                                                                                                    queryParams: {
                                                                                                      'postId': serializeParam(
                                                                                                        listViewProvidingPostsRecord.postID,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                },
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                                                                      child: Icon(
                                                                                                        Icons.mode_comment_outlined,
                                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                        size: 24,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          formatNumber(
                                                                                                            listViewProvidingPostsRecord.numComments,
                                                                                                            formatType: FormatType.compact,
                                                                                                          ),
                                                                                                          '0',
                                                                                                        ),
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
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Stack(
                                                                                                    children: [
                                                                                                      ToggleIcon(
                                                                                                        onPressed: () async {
                                                                                                          final likedByElement = currentUserReference;
                                                                                                          final likedByUpdate = listViewProvidingPostsRecord.likedBy!.toList().contains(likedByElement) ? FieldValue.arrayRemove([likedByElement]) : FieldValue.arrayUnion([likedByElement]);
                                                                                                          final postsUpdateData = {
                                                                                                            'liked_by': likedByUpdate,
                                                                                                          };
                                                                                                          await listViewProvidingPostsRecord.reference.update(postsUpdateData);
                                                                                                        },
                                                                                                        value: listViewProvidingPostsRecord.likedBy!.toList().contains(currentUserReference),
                                                                                                        onIcon: Icon(
                                                                                                          Icons.favorite_rounded,
                                                                                                          color: Color(0xFFFF0000),
                                                                                                          size: 25,
                                                                                                        ),
                                                                                                        offIcon: Icon(
                                                                                                          Icons.favorite_border_rounded,
                                                                                                          color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          size: 25,
                                                                                                        ),
                                                                                                      ),
                                                                                                      InkWell(
                                                                                                        onTap: () async {
                                                                                                          if (socialPostUsersRecord.likedPosts!.toList().contains(listViewProvidingPostsRecord.reference)) {
                                                                                                            final postsUpdateData = {
                                                                                                              'liked_by': FieldValue.arrayRemove([currentUserReference]),
                                                                                                            };
                                                                                                            await listViewProvidingPostsRecord.reference.update(postsUpdateData);

                                                                                                            final usersUpdateData = {
                                                                                                              'liked_posts': FieldValue.arrayRemove([
                                                                                                                listViewProvidingPostsRecord.reference
                                                                                                              ]),
                                                                                                            };
                                                                                                            await socialPostUsersRecord.reference.update(usersUpdateData);
                                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                                              SnackBar(
                                                                                                                content: Text(
                                                                                                                  'تم ازالة  المنشورمن المفضلة',
                                                                                                                  style: TextStyle(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                duration: Duration(milliseconds: 1500),
                                                                                                                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                              ),
                                                                                                            );
                                                                                                          } else {
                                                                                                            final postsUpdateData = {
                                                                                                              'liked_by': FieldValue.arrayUnion([currentUserReference]),
                                                                                                            };
                                                                                                            await listViewProvidingPostsRecord.reference.update(postsUpdateData);

                                                                                                            final usersUpdateData = {
                                                                                                              'liked_posts': FieldValue.arrayUnion([
                                                                                                                listViewProvidingPostsRecord.reference
                                                                                                              ]),
                                                                                                            };
                                                                                                            await socialPostUsersRecord.reference.update(usersUpdateData);
                                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                                              SnackBar(
                                                                                                                content: Text(
                                                                                                                  'تم اضافة المنشور للمفضلة',
                                                                                                                  style: TextStyle(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                duration: Duration(milliseconds: 1500),
                                                                                                                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 45,
                                                                                                          height: 45,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0x00FFFFFF),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      formatNumber(
                                                                                                        listViewProvidingPostsRecord.likedBy!.toList().length,
                                                                                                        formatType: FormatType.compact,
                                                                                                      ),
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
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
                                                                        ],
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
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.provider,
                                            false) ==
                                        true)
                                      AuthUserStreamWidget(
                                        child: StreamBuilder<
                                            List<RequestPostRecord>>(
                                          stream: queryRequestPostRecord(
                                            queryBuilder: (requestPostRecord) =>
                                                requestPostRecord
                                                    .where('post_type',
                                                        isEqualTo: FFAppState()
                                                                    .filterByWork !=
                                                                ''
                                                            ? FFAppState()
                                                                .filterByWork
                                                            : null)
                                                    .where('post_user_location',
                                                        isEqualTo: FFAppState()
                                                                    .filterByCities !=
                                                                ''
                                                            ? FFAppState()
                                                                .filterByCities
                                                            : null)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    size: 24,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<RequestPostRecord>
                                                listViewRequestingRequestPostRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewRequestingRequestPostRecordList
                                                      .length,
                                              itemBuilder: (context,
                                                  listViewRequestingIndex) {
                                                final listViewRequestingRequestPostRecord =
                                                    listViewRequestingRequestPostRecordList[
                                                        listViewRequestingIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 5, 5),
                                                  child: StreamBuilder<
                                                      UsersRecord>(
                                                    stream: UsersRecord.getDocument(
                                                        listViewRequestingRequestPostRecord
                                                            .postUser!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        30),
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
                                                          ),
                                                        );
                                                      }
                                                      final socialPostUsersRecord =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      4, 4, 4),
                                                          child: StreamBuilder<
                                                              List<
                                                                  UsersRecord>>(
                                                            stream:
                                                                queryUsersRecord(
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
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            30),
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
                                                                  ),
                                                                );
                                                              }
                                                              List<UsersRecord>
                                                                  columnUsersRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final columnUsersRecord =
                                                                  columnUsersRecordList
                                                                          .isNotEmpty
                                                                      ? columnUsersRecordList
                                                                          .first
                                                                      : null;
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            10,
                                                                            4),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              StreamBuilder<UsersRecord>(
                                                                            stream:
                                                                                UsersRecord.getDocument(socialPostUsersRecord.reference),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                                                                                    child: SizedBox(
                                                                                      width: 24,
                                                                                      height: 24,
                                                                                      child: SpinKitFadingCube(
                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                        size: 24,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final rowUsersRecord = snapshot.data!;
                                                                              return InkWell(
                                                                                onTap: () async {
                                                                                  if (rowUsersRecord.reference == currentUserReference) {
                                                                                    context.pushNamed(
                                                                                      'MyProfilePage',
                                                                                      queryParams: {
                                                                                        'userRefRecieve': serializeParam(
                                                                                          currentUserReference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  } else {
                                                                                    context.pushNamed(
                                                                                      'UserProfilePage',
                                                                                      queryParams: {
                                                                                        'userInfo': serializeParam(
                                                                                          socialPostUsersRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                          hasTransition: true,
                                                                                          transitionType: PageTransitionType.fade,
                                                                                          duration: Duration(milliseconds: 300),
                                                                                        ),
                                                                                      },
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                      child: Container(
                                                                                        width: 50,
                                                                                        height: 50,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                            width: 2,
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0, 0.050000000000000044),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            if (rowUsersRecord.photoUrl != null && rowUsersRecord.photoUrl != '')
                                                                                              Container(
                                                                                                width: 101,
                                                                                                height: 101,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                    width: 2,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Visibility(
                                                                                                  visible: rowUsersRecord.photoUrl != null && rowUsersRecord.photoUrl != '',
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(50),
                                                                                                    child: CachedNetworkImage(
                                                                                                      imageUrl: rowUsersRecord.photoUrl!,
                                                                                                      width: 100,
                                                                                                      height: 100,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (rowUsersRecord.photoUrl == '')
                                                                                              Container(
                                                                                                width: 101,
                                                                                                height: 101,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  shape: BoxShape.circle,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                    width: 2,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Visibility(
                                                                                                  visible: rowUsersRecord.photoUrl == '',
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0, 0.05),
                                                                                                    child: Icon(
                                                                                                      Icons.person_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                      size: 30,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                    socialPostUsersRecord.displayName!.maybeHandleOverflow(
                                                                                                      maxChars: 20,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                                          color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          fontSize: 18,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                                                                      child: Icon(
                                                                                                        Icons.star_rate_rounded,
                                                                                                        color: Color(0xFFFF8E00),
                                                                                                        size: 24,
                                                                                                      ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<ReveiwsRecord>>(
                                                                                                      stream: queryReveiwsRecord(
                                                                                                        queryBuilder: (reveiwsRecord) => reveiwsRecord.where('reviewed_person', isEqualTo: rowUsersRecord.uid),
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
                                                                                                        List<ReveiwsRecord> textReveiwsRecordList = snapshot.data!;
                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            formatNumber(
                                                                                                              functions.rating(textReveiwsRecordList.map((e) => e.rating!).toList()),
                                                                                                              formatType: FormatType.compactLong,
                                                                                                            ),
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Noto Kufi Arabic',
                                                                                                                fontSize: 14,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        onTap: () async {
                                                                                                          showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return Padding(
                                                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                                                child: Container(
                                                                                                                  height: MediaQuery.of(context).size.height * 0.65,
                                                                                                                  child: BottomSheetRequestPostWidget(
                                                                                                                    userRefForBottomSheet: socialPostUsersRecord.reference,
                                                                                                                    requestPostRefForBottomSheet: listViewRequestingRequestPostRecord.reference,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => setState(() {}));
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 30,
                                                                                                          height: 30,
                                                                                                          decoration: BoxDecoration(
                                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                                          ),
                                                                                                          child: Icon(
                                                                                                            Icons.more_vert_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                            size: 28,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      listViewRequestingRequestPostRecord.postType!,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                            fontFamily: 'Noto Kufi Arabic',
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            fontSize: 14,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                      child: Text(
                                                                                                        '•',
                                                                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                              fontFamily: 'Noto Kufi Arabic',
                                                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                              fontSize: 14,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                      child: Text(
                                                                                                        dateTimeFormat(
                                                                                                          'relative',
                                                                                                          listViewRequestingRequestPostRecord.timePosted!,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                              fontFamily: 'Noto Kufi Arabic',
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              fontSize: 14,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Text(
                                                                                                  'مطلوب',
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
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
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            8),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'RequestPostPage',
                                                                              queryParams: {
                                                                                'requestpostId': serializeParam(
                                                                                  listViewRequestingRequestPostRecord.postID,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                kTransitionInfoKey: TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.topToBottom,
                                                                                ),
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 10),
                                                                                child: Text(
                                                                                  listViewRequestingRequestPostRecord.postTitle!,
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Divider(),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                      child: Text(
                                                                                        listViewRequestingRequestPostRecord.postDescription!.maybeHandleOverflow(
                                                                                          maxChars: 50,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Noto Kufi Arabic',
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              if (listViewRequestingRequestPostRecord.postPhoto!.toList().length != 0)
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: 100,
                                                                                        height: 110,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.rectangle,
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0, 0),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final postPhotos = listViewRequestingRequestPostRecord.postPhoto!.toList().map((e) => e).toList().take(3).toList();
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: List.generate(postPhotos.length, (postPhotosIndex) {
                                                                                                final postPhotosItem = postPhotos[postPhotosIndex];
                                                                                                return Container(
                                                                                                  width: 100,
                                                                                                  height: 100,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                  ),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                    child: CachedNetworkImage(
                                                                                                      imageUrl: postPhotosItem,
                                                                                                      width: 100,
                                                                                                      height: 100,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0, 0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.attach_money_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                  size: 24,
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    listViewRequestingRequestPostRecord.price?.toString(),
                                                                                                    '-',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                                                  child: Text(
                                                                                                    '/',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  listViewRequestingRequestPostRecord.priceType!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                            child: InkWell(
                                                                                              onTap: () async {
                                                                                                context.pushNamed(
                                                                                                  'postPage',
                                                                                                  queryParams: {
                                                                                                    'postId': serializeParam(
                                                                                                      listViewRequestingRequestPostRecord.postID,
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              },
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                                                                    child: Icon(
                                                                                                      Icons.mode_comment_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                      size: 24,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                                    child: StreamBuilder<List<CommentsRecord>>(
                                                                                                      stream: queryCommentsRecord(
                                                                                                        queryBuilder: (commentsRecord) => commentsRecord.where('commented_request_post', isEqualTo: listViewRequestingRequestPostRecord.reference),
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
                                                                                                        List<CommentsRecord> textCommentsRecordList = snapshot.data!;
                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            formatNumber(
                                                                                                              textCommentsRecordList.length,
                                                                                                              formatType: FormatType.compact,
                                                                                                            ),
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                fontSize: 14,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Stack(
                                                                                                  children: [
                                                                                                    ToggleIcon(
                                                                                                      onPressed: () async {
                                                                                                        final likedByElement = currentUserReference;
                                                                                                        final likedByUpdate = listViewRequestingRequestPostRecord.likedBy!.toList().contains(likedByElement) ? FieldValue.arrayRemove([likedByElement]) : FieldValue.arrayUnion([likedByElement]);
                                                                                                        final requestPostUpdateData = {
                                                                                                          'liked_by': likedByUpdate,
                                                                                                        };
                                                                                                        await listViewRequestingRequestPostRecord.reference.update(requestPostUpdateData);
                                                                                                      },
                                                                                                      value: listViewRequestingRequestPostRecord.likedBy!.toList().contains(currentUserReference),
                                                                                                      onIcon: Icon(
                                                                                                        Icons.favorite_rounded,
                                                                                                        color: Color(0xFFFF0000),
                                                                                                        size: 25,
                                                                                                      ),
                                                                                                      offIcon: Icon(
                                                                                                        Icons.favorite_border_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                        size: 25,
                                                                                                      ),
                                                                                                    ),
                                                                                                    InkWell(
                                                                                                      onTap: () async {
                                                                                                        if (socialPostUsersRecord.likedRequestPosts!.toList().contains(listViewRequestingRequestPostRecord.reference)) {
                                                                                                          final requestPostUpdateData = {
                                                                                                            'liked_by': FieldValue.arrayRemove([currentUserReference]),
                                                                                                          };
                                                                                                          await listViewRequestingRequestPostRecord.reference.update(requestPostUpdateData);

                                                                                                          final usersUpdateData = {
                                                                                                            'liked_request_posts': FieldValue.arrayRemove([
                                                                                                              listViewRequestingRequestPostRecord.reference
                                                                                                            ]),
                                                                                                          };
                                                                                                          await socialPostUsersRecord.reference.update(usersUpdateData);
                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                            SnackBar(
                                                                                                              content: Text(
                                                                                                                'تم ازالة  المنشورمن المفضلة',
                                                                                                                style: TextStyle(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                ),
                                                                                                              ),
                                                                                                              duration: Duration(milliseconds: 1500),
                                                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                            ),
                                                                                                          );
                                                                                                        } else {
                                                                                                          final requestPostUpdateData = {
                                                                                                            'liked_by': FieldValue.arrayUnion([currentUserReference]),
                                                                                                          };
                                                                                                          await listViewRequestingRequestPostRecord.reference.update(requestPostUpdateData);

                                                                                                          final usersUpdateData = {
                                                                                                            'liked_request_posts': FieldValue.arrayUnion([
                                                                                                              listViewRequestingRequestPostRecord.reference
                                                                                                            ]),
                                                                                                          };
                                                                                                          await socialPostUsersRecord.reference.update(usersUpdateData);
                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                            SnackBar(
                                                                                                              content: Text(
                                                                                                                'تم اضافة المنشور للمفضلة',
                                                                                                                style: TextStyle(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                ),
                                                                                                              ),
                                                                                                              duration: Duration(milliseconds: 1500),
                                                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                            ),
                                                                                                          );
                                                                                                        }
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 45,
                                                                                                        height: 45,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0x00FFFFFF),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      listViewRequestingRequestPostRecord.likedBy!.toList().length,
                                                                                                      formatType: FormatType.compact,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
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
                                  ],
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) =>
                                    StreamBuilder<List<PostsRecord>>(
                                  stream: queryPostsRecord(
                                    queryBuilder: (postsRecord) => postsRecord
                                        .where('liked_by',
                                            arrayContains: currentUserReference)
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
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 24,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PostsRecord> listViewPostsRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewPostsRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewPostsRecord =
                                            listViewPostsRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 5, 5),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                listViewPostsRecord.postUser!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 30),
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
                                                  ),
                                                );
                                              }
                                              final socialPostUsersRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                onLongPress: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          child:
                                                              BottomSheetPostWidget(
                                                            postRefForBottomSheet:
                                                                listViewPostsRecord
                                                                    .reference,
                                                            userRefForBottomSheet:
                                                                socialPostUsersRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 4, 4, 4),
                                                    child: StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          30),
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
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord>
                                                            columnUsersRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final columnUsersRecord =
                                                            columnUsersRecordList
                                                                    .isNotEmpty
                                                                ? columnUsersRecordList
                                                                    .first
                                                                : null;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          10,
                                                                          4),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child: StreamBuilder<
                                                                        UsersRecord>(
                                                                      stream: UsersRecord.getDocument(
                                                                          socialPostUsersRecord
                                                                              .reference),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                                                                              child: SizedBox(
                                                                                width: 24,
                                                                                height: 24,
                                                                                child: SpinKitFadingCube(
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  size: 24,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final rowUsersRecord =
                                                                            snapshot.data!;
                                                                        return InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            if (rowUsersRecord.reference ==
                                                                                currentUserReference) {
                                                                              context.pushNamed(
                                                                                'MyProfilePage',
                                                                                queryParams: {
                                                                                  'userRefRecieve': serializeParam(
                                                                                    currentUserReference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            } else {
                                                                              context.pushNamed(
                                                                                'UserProfilePage',
                                                                                queryParams: {
                                                                                  'userInfo': serializeParam(
                                                                                    rowUsersRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 300),
                                                                                  ),
                                                                                },
                                                                              );
                                                                            }
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      width: 2,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0, 0.050000000000000044),
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (rowUsersRecord.photoUrl != null && rowUsersRecord.photoUrl != '')
                                                                                        Container(
                                                                                          width: 101,
                                                                                          height: 101,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                              width: 2,
                                                                                            ),
                                                                                          ),
                                                                                          child: Visibility(
                                                                                            visible: rowUsersRecord.photoUrl != null && rowUsersRecord.photoUrl != '',
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(50),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: rowUsersRecord.photoUrl!,
                                                                                                width: 100,
                                                                                                height: 100,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (rowUsersRecord.photoUrl == '')
                                                                                        Container(
                                                                                          width: 101,
                                                                                          height: 101,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                              width: 2,
                                                                                            ),
                                                                                          ),
                                                                                          child: Visibility(
                                                                                            visible: rowUsersRecord.photoUrl == '',
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0, 0.05),
                                                                                              child: Icon(
                                                                                                Icons.person_rounded,
                                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                size: 30,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: AutoSizeText(
                                                                                              socialPostUsersRecord.displayName!.maybeHandleOverflow(
                                                                                                maxChars: 20,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                    fontFamily: 'Noto Kufi Arabic',
                                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    fontSize: 18,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                                                                child: Icon(
                                                                                                  Icons.star_rate_rounded,
                                                                                                  color: Color(0xFFFF8E00),
                                                                                                  size: 24,
                                                                                                ),
                                                                                              ),
                                                                                              StreamBuilder<List<ReveiwsRecord>>(
                                                                                                stream: queryReveiwsRecord(
                                                                                                  queryBuilder: (reveiwsRecord) => reveiwsRecord.where('reviewed_person', isEqualTo: rowUsersRecord.uid),
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
                                                                                                  List<ReveiwsRecord> textReveiwsRecordList = snapshot.data!;
                                                                                                  return Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      formatNumber(
                                                                                                        functions.rating(textReveiwsRecordList.map((e) => e.rating!).toList()),
                                                                                                        formatType: FormatType.compactLong,
                                                                                                      ),
                                                                                                      '-',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                                          fontSize: 14,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                InkWell(
                                                                                                  onTap: () async {
                                                                                                    showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      context: context,
                                                                                                      builder: (context) {
                                                                                                        return Padding(
                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                          child: Container(
                                                                                                            height: MediaQuery.of(context).size.height * 0.65,
                                                                                                            child: BottomSheetPostWidget(
                                                                                                              postRefForBottomSheet: listViewPostsRecord.reference,
                                                                                                              userRefForBottomSheet: socialPostUsersRecord.reference,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 30,
                                                                                                    height: 30,
                                                                                                    decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                                    ),
                                                                                                    child: Icon(
                                                                                                      Icons.more_vert_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                      size: 28,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            listViewPostsRecord.postType!,
                                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                  fontSize: 14,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                            child: Text(
                                                                                              '•',
                                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                    fontFamily: 'Noto Kufi Arabic',
                                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                            child: Text(
                                                                                              dateTimeFormat(
                                                                                                'relative',
                                                                                                listViewPostsRecord.timePosted!,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                    fontFamily: 'Noto Kufi Arabic',
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.normal,
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
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          8),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'postPage',
                                                                        queryParams:
                                                                            {
                                                                          'postId':
                                                                              serializeParam(
                                                                            listViewPostsRecord.postID,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.topToBottom,
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              4,
                                                                              10),
                                                                          child:
                                                                              Text(
                                                                            listViewPostsRecord.postTitle!,
                                                                            textAlign:
                                                                                TextAlign.end,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Divider(),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                child: Text(
                                                                                  listViewPostsRecord.postDescription!.maybeHandleOverflow(
                                                                                    maxChars: 50,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (listViewPostsRecord.postPhoto!.toList().length !=
                                                                            0)
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  height: 110,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.rectangle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0, 0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final postPhotos = listViewPostsRecord.postPhoto!.toList().map((e) => e).toList().take(3).toList();
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: List.generate(postPhotos.length, (postPhotosIndex) {
                                                                                          final postPhotosItem = postPhotos[postPhotosIndex];
                                                                                          return Container(
                                                                                            width: 100,
                                                                                            height: 100,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                            ),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: postPhotosItem,
                                                                                                width: 100,
                                                                                                height: 100,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                4,
                                                                                4,
                                                                                0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.attach_money_rounded,
                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                            size: 24,
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              listViewPostsRecord.price?.toString(),
                                                                                              '-',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                                            child: Text(
                                                                                              '/',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            listViewPostsRecord.priceType!,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                      child: InkWell(
                                                                                        onTap: () async {
                                                                                          context.pushNamed(
                                                                                            'postPage',
                                                                                            queryParams: {
                                                                                              'postId': serializeParam(
                                                                                                listViewPostsRecord.postID,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                                                              child: Icon(
                                                                                                Icons.mode_comment_outlined,
                                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                size: 24,
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                              child: StreamBuilder<List<CommentsRecord>>(
                                                                                                stream: queryCommentsRecord(
                                                                                                  queryBuilder: (commentsRecord) => commentsRecord.where('commented_post', isEqualTo: listViewPostsRecord.reference),
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
                                                                                                  List<CommentsRecord> textCommentsRecordList = snapshot.data!;
                                                                                                  return Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      formatNumber(
                                                                                                        textCommentsRecordList.length,
                                                                                                        formatType: FormatType.compact,
                                                                                                      ),
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          fontSize: 14,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Stack(
                                                                                            children: [
                                                                                              ToggleIcon(
                                                                                                onPressed: () async {
                                                                                                  final likedByElement = currentUserReference;
                                                                                                  final likedByUpdate = listViewPostsRecord.likedBy!.toList().contains(likedByElement) ? FieldValue.arrayRemove([likedByElement]) : FieldValue.arrayUnion([likedByElement]);
                                                                                                  final postsUpdateData = {
                                                                                                    'liked_by': likedByUpdate,
                                                                                                  };
                                                                                                  await listViewPostsRecord.reference.update(postsUpdateData);
                                                                                                },
                                                                                                value: listViewPostsRecord.likedBy!.toList().contains(currentUserReference),
                                                                                                onIcon: Icon(
                                                                                                  Icons.favorite_rounded,
                                                                                                  color: Color(0xFFFF0000),
                                                                                                  size: 25,
                                                                                                ),
                                                                                                offIcon: Icon(
                                                                                                  Icons.favorite_border_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                  size: 25,
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  if (socialPostUsersRecord.likedPosts!.toList().contains(listViewPostsRecord.reference)) {
                                                                                                    final postsUpdateData = {
                                                                                                      'liked_by': FieldValue.arrayRemove([currentUserReference]),
                                                                                                    };
                                                                                                    await listViewPostsRecord.reference.update(postsUpdateData);

                                                                                                    final usersUpdateData = {
                                                                                                      'liked_posts': FieldValue.arrayRemove([
                                                                                                        listViewPostsRecord.reference
                                                                                                      ]),
                                                                                                    };
                                                                                                    await socialPostUsersRecord.reference.update(usersUpdateData);
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          'تم ازالة  المنشورمن المفضلة',
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        duration: Duration(milliseconds: 1500),
                                                                                                        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                      ),
                                                                                                    );
                                                                                                  } else {
                                                                                                    final postsUpdateData = {
                                                                                                      'liked_by': FieldValue.arrayUnion([currentUserReference]),
                                                                                                    };
                                                                                                    await listViewPostsRecord.reference.update(postsUpdateData);

                                                                                                    final usersUpdateData = {
                                                                                                      'liked_posts': FieldValue.arrayUnion([
                                                                                                        listViewPostsRecord.reference
                                                                                                      ]),
                                                                                                    };
                                                                                                    await socialPostUsersRecord.reference.update(usersUpdateData);
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          'تم اضافة المنشور للمفضلة',
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        duration: Duration(milliseconds: 1500),
                                                                                                        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 45,
                                                                                                  height: 45,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0x00FFFFFF),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              formatNumber(
                                                                                                listViewPostsRecord.likedBy!.toList().length,
                                                                                                formatType: FormatType.compact,
                                                                                              ),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
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
                                                                ],
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) =>
                                    StreamBuilder<List<RequestPostRecord>>(
                                  stream: queryRequestPostRecord(
                                    queryBuilder: (requestPostRecord) =>
                                        requestPostRecord
                                            .where('liked_by',
                                                arrayContains:
                                                    currentUserReference)
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
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 24,
                                          ),
                                        ),
                                      );
                                    }
                                    List<RequestPostRecord>
                                        listViewRequestPostRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewRequestPostRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewRequestPostRecord =
                                            listViewRequestPostRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 5, 5),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                listViewRequestPostRecord
                                                    .postUser!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 30),
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
                                                  ),
                                                );
                                              }
                                              final socialPostUsersRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                onLongPress: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          child:
                                                              BottomSheetPostWidget(
                                                            userRefForBottomSheet:
                                                                socialPostUsersRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 4, 4, 4),
                                                    child: StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          30),
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
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord>
                                                            columnUsersRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final columnUsersRecord =
                                                            columnUsersRecordList
                                                                    .isNotEmpty
                                                                ? columnUsersRecordList
                                                                    .first
                                                                : null;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          10,
                                                                          4),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child: StreamBuilder<
                                                                        UsersRecord>(
                                                                      stream: UsersRecord.getDocument(
                                                                          socialPostUsersRecord
                                                                              .reference),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                                                                              child: SizedBox(
                                                                                width: 24,
                                                                                height: 24,
                                                                                child: SpinKitFadingCube(
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  size: 24,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final rowUsersRecord =
                                                                            snapshot.data!;
                                                                        return InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            if (rowUsersRecord.reference ==
                                                                                currentUserReference) {
                                                                              context.pushNamed(
                                                                                'MyProfilePage',
                                                                                queryParams: {
                                                                                  'userRefRecieve': serializeParam(
                                                                                    currentUserReference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            } else {
                                                                              context.pushNamed(
                                                                                'UserProfilePage',
                                                                                queryParams: {
                                                                                  'userInfo': serializeParam(
                                                                                    rowUsersRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 300),
                                                                                  ),
                                                                                },
                                                                              );
                                                                            }
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      width: 2,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0, 0.050000000000000044),
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (rowUsersRecord.photoUrl != null && rowUsersRecord.photoUrl != '')
                                                                                        Container(
                                                                                          width: 101,
                                                                                          height: 101,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                              width: 2,
                                                                                            ),
                                                                                          ),
                                                                                          child: Visibility(
                                                                                            visible: rowUsersRecord.photoUrl != null && rowUsersRecord.photoUrl != '',
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(50),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: rowUsersRecord.photoUrl!,
                                                                                                width: 100,
                                                                                                height: 100,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (rowUsersRecord.photoUrl == '')
                                                                                        Container(
                                                                                          width: 101,
                                                                                          height: 101,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                              width: 2,
                                                                                            ),
                                                                                          ),
                                                                                          child: Visibility(
                                                                                            visible: rowUsersRecord.photoUrl == '',
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0, 0.05),
                                                                                              child: Icon(
                                                                                                Icons.person_rounded,
                                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                size: 30,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: AutoSizeText(
                                                                                              socialPostUsersRecord.displayName!.maybeHandleOverflow(
                                                                                                maxChars: 20,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                    fontFamily: 'Noto Kufi Arabic',
                                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    fontSize: 18,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                                                                child: Icon(
                                                                                                  Icons.star_rate_rounded,
                                                                                                  color: Color(0xFFFF8E00),
                                                                                                  size: 24,
                                                                                                ),
                                                                                              ),
                                                                                              StreamBuilder<List<ReveiwsRecord>>(
                                                                                                stream: queryReveiwsRecord(
                                                                                                  queryBuilder: (reveiwsRecord) => reveiwsRecord.where('reviewed_person', isEqualTo: socialPostUsersRecord.uid),
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
                                                                                                  List<ReveiwsRecord> textReveiwsRecordList = snapshot.data!;
                                                                                                  return Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      formatNumber(
                                                                                                        functions.rating(textReveiwsRecordList.map((e) => e.rating!).toList()),
                                                                                                        formatType: FormatType.compactLong,
                                                                                                      ),
                                                                                                      '-',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                                          fontSize: 14,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                InkWell(
                                                                                                  onTap: () async {
                                                                                                    showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      context: context,
                                                                                                      builder: (context) {
                                                                                                        return Padding(
                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                          child: Container(
                                                                                                            height: MediaQuery.of(context).size.height * 0.65,
                                                                                                            child: BottomSheetRequestPostWidget(
                                                                                                              userRefForBottomSheet: socialPostUsersRecord.reference,
                                                                                                              requestPostRefForBottomSheet: listViewRequestPostRecord.reference,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 30,
                                                                                                    height: 30,
                                                                                                    decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                                    ),
                                                                                                    child: Icon(
                                                                                                      Icons.more_vert_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                      size: 28,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              Text(
                                                                                                listViewRequestPostRecord.postType!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                      fontFamily: 'Noto Kufi Arabic',
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                child: Text(
                                                                                                  '•',
                                                                                                  style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                        fontSize: 14,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat(
                                                                                                    'relative',
                                                                                                    listViewRequestPostRecord.timePosted!,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                        fontSize: 14,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Text(
                                                                                            'مطلوب',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
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
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          8),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'postPage',
                                                                        queryParams:
                                                                            {
                                                                          'postId':
                                                                              serializeParam(
                                                                            listViewRequestPostRecord.postID,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.topToBottom,
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              4,
                                                                              10),
                                                                          child:
                                                                              Text(
                                                                            listViewRequestPostRecord.postTitle!,
                                                                            textAlign:
                                                                                TextAlign.end,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Divider(),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                child: Text(
                                                                                  listViewRequestPostRecord.postDescription!.maybeHandleOverflow(
                                                                                    maxChars: 50,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Noto Kufi Arabic',
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (listViewRequestPostRecord.postPhoto!.toList().length !=
                                                                            0)
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  height: 110,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.rectangle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0, 0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final postPhotos = listViewRequestPostRecord.postPhoto!.toList().map((e) => e).toList().take(3).toList();
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: List.generate(postPhotos.length, (postPhotosIndex) {
                                                                                          final postPhotosItem = postPhotos[postPhotosIndex];
                                                                                          return Container(
                                                                                            width: 100,
                                                                                            height: 100,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                            ),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: postPhotosItem,
                                                                                                width: 100,
                                                                                                height: 100,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                4,
                                                                                4,
                                                                                0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.attach_money_rounded,
                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                            size: 24,
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              listViewRequestPostRecord.price?.toString(),
                                                                                              '-',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                                            child: Text(
                                                                                              '/',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            listViewRequestPostRecord.priceType!,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                      child: InkWell(
                                                                                        onTap: () async {
                                                                                          context.pushNamed(
                                                                                            'postPage',
                                                                                            queryParams: {
                                                                                              'postId': serializeParam(
                                                                                                listViewRequestPostRecord.postID,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                                                              child: Icon(
                                                                                                Icons.mode_comment_outlined,
                                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                size: 24,
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                              child: StreamBuilder<List<CommentsRecord>>(
                                                                                                stream: queryCommentsRecord(
                                                                                                  queryBuilder: (commentsRecord) => commentsRecord.where('commented_request_post', isEqualTo: listViewRequestPostRecord.reference),
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
                                                                                                  List<CommentsRecord> textCommentsRecordList = snapshot.data!;
                                                                                                  return Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      formatNumber(
                                                                                                        textCommentsRecordList.length,
                                                                                                        formatType: FormatType.compact,
                                                                                                      ),
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          fontSize: 14,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Stack(
                                                                                            children: [
                                                                                              ToggleIcon(
                                                                                                onPressed: () async {
                                                                                                  final likedByElement = currentUserReference;
                                                                                                  final likedByUpdate = listViewRequestPostRecord.likedBy!.toList().contains(likedByElement) ? FieldValue.arrayRemove([likedByElement]) : FieldValue.arrayUnion([likedByElement]);
                                                                                                  final requestPostUpdateData = {
                                                                                                    'liked_by': likedByUpdate,
                                                                                                  };
                                                                                                  await listViewRequestPostRecord.reference.update(requestPostUpdateData);
                                                                                                },
                                                                                                value: listViewRequestPostRecord.likedBy!.toList().contains(currentUserReference),
                                                                                                onIcon: Icon(
                                                                                                  Icons.favorite_rounded,
                                                                                                  color: Color(0xFFFF0000),
                                                                                                  size: 25,
                                                                                                ),
                                                                                                offIcon: Icon(
                                                                                                  Icons.favorite_border_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                  size: 25,
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  if (socialPostUsersRecord.likedRequestPosts!.toList().contains(listViewRequestPostRecord.reference)) {
                                                                                                    final requestPostUpdateData = {
                                                                                                      'liked_by': FieldValue.arrayRemove([currentUserReference]),
                                                                                                    };
                                                                                                    await listViewRequestPostRecord.reference.update(requestPostUpdateData);

                                                                                                    final usersUpdateData = {
                                                                                                      'liked_request_posts': FieldValue.arrayRemove([
                                                                                                        listViewRequestPostRecord.reference
                                                                                                      ]),
                                                                                                    };
                                                                                                    await socialPostUsersRecord.reference.update(usersUpdateData);
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          'تم ازالة  المنشورمن المفضلة',
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        duration: Duration(milliseconds: 1500),
                                                                                                        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                      ),
                                                                                                    );
                                                                                                  } else {
                                                                                                    final requestPostUpdateData = {
                                                                                                      'liked_by': FieldValue.arrayUnion([currentUserReference]),
                                                                                                    };
                                                                                                    await listViewRequestPostRecord.reference.update(requestPostUpdateData);

                                                                                                    final usersUpdateData = {
                                                                                                      'liked_request_posts': FieldValue.arrayUnion([
                                                                                                        listViewRequestPostRecord.reference
                                                                                                      ]),
                                                                                                    };
                                                                                                    await socialPostUsersRecord.reference.update(usersUpdateData);
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          'تم اضافة المنشور للمفضلة',
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        duration: Duration(milliseconds: 1500),
                                                                                                        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 45,
                                                                                                  height: 45,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0x00FFFFFF),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              formatNumber(
                                                                                                listViewRequestPostRecord.likedBy!.toList().length,
                                                                                                formatType: FormatType.compact,
                                                                                              ),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
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
                                                                ],
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) => SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.info_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 24,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                'معلوماتك',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    34, 0, 0, 0),
                                            child: Container(
                                              width: 2,
                                              height: 240,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 5),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    AuthUserStreamWidget(
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              currentUserPhoto !=
                                                                          null &&
                                                                      currentUserPhoto !=
                                                                          ''
                                                                  ? (currentUserPhoto !=
                                                                          ''
                                                                      ? currentUserPhoto
                                                                      : ' ')
                                                                  : ' ',
                                                            ).image,
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Visibility(
                                                          visible: () {
                                                            if (currentUserPhoto !=
                                                                    null &&
                                                                currentUserPhoto !=
                                                                    '') {
                                                              return (currentUserPhoto ==
                                                                  '');
                                                            } else if (currentUserPhoto ==
                                                                    null ||
                                                                currentUserPhoto ==
                                                                    '') {
                                                              return true;
                                                            } else {
                                                              return false;
                                                            }
                                                          }(),
                                                          child: Icon(
                                                            Icons
                                                                .person_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            currentUserDisplayName,
                                                            'لا يوجد',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.edit_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .miscellaneous_services_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.userWork,
                                                                ''),
                                                            'لا يوجد',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Icon(
                                                        Icons.edit_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                28, 0, 0, 0),
                                                    child: Container(
                                                      width: 2,
                                                      height: 140,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                    ),
                                                  ),
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
                                                                .fromSTEB(10, 0,
                                                                    10, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .sort_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 20,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    (currentUserDocument?.allPosts?.toList() ?? []).length !=
                                                                            0
                                                                        ? '${valueOrDefault<String>(
                                                                            formatNumber(
                                                                              (currentUserDocument?.allPosts?.toList() ?? []).length,
                                                                              formatType: FormatType.compact,
                                                                            ),
                                                                            '0',
                                                                          )} خدمات'
                                                                        : '0 خدمات',
                                                                    '0 خدمات',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                size: 24,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .star_rate_rounded,
                                                                color: Color(
                                                                    0xFFDB9E25),
                                                                size: 20,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      ReveiwsRecord>>(
                                                                stream:
                                                                    queryReveiwsRecord(
                                                                  queryBuilder: (reveiwsRecord) => reveiwsRecord.where(
                                                                      'reviewed_person',
                                                                      isEqualTo:
                                                                          currentUserUid),
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
                                                                  List<ReveiwsRecord>
                                                                      textReveiwsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Text(
                                                                    'التقييم ${valueOrDefault<String>(
                                                                      functions
                                                                          .rating(textReveiwsRecordList
                                                                              .map((e) => e.rating!)
                                                                              .toList())
                                                                          .toString(),
                                                                      '0',
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .format_list_numbered_rtl,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 20,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                child: Text(
                                                                  '${valueOrDefault<String>(
                                                                    (currentUserDocument?.allReviewsAboutMe?.toList() ??
                                                                            [])
                                                                        .length
                                                                        .toString(),
                                                                    '0',
                                                                  )} مقيمين',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons.style,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 20,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    valueOrDefault<bool>(currentUserDocument?.provider,
                                                                                false) ==
                                                                            true
                                                                        ? 'مقدم خدمة'
                                                                        : 'باحث خدمة',
                                                                    'لا يوجد',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  if (valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.provider,
                                                                          false) ==
                                                                      true) {
                                                                    final usersUpdateData =
                                                                        createUsersRecordData(
                                                                      provider:
                                                                          false,
                                                                    );
                                                                    await currentUserReference!
                                                                        .update(
                                                                            usersUpdateData);
                                                                  } else {
                                                                    final usersUpdateData =
                                                                        createUsersRecordData(
                                                                      provider:
                                                                          true,
                                                                    );
                                                                    await currentUserReference!
                                                                        .update(
                                                                            usersUpdateData);
                                                                  }

                                                                  if (Navigator.of(
                                                                          context)
                                                                      .canPop()) {
                                                                    context
                                                                        .pop();
                                                                  }
                                                                  context
                                                                      .pushNamed(
                                                                    'HomePage',
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .repeat_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  size: 24,
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
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.help_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 24,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                'من نحن؟',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    34, 0, 0, 0),
                                            child: Container(
                                              width: 2,
                                              height: 240,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 5),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/WarchtcomSplashPng.png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Text(
                                                        'ورشتكم',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.9,
                                                                  child:
                                                                      AboutWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Text(
                                                          'المزيد',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Kufi Arabic',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.people,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Text(
                                                        'القائمين على العمل',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                28, 0, 0, 0),
                                                    child: Container(
                                                      width: 2,
                                                      height: 140,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                    ),
                                                  ),
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
                                                                .fromSTEB(10, 0,
                                                                    10, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/IMG_20220809_100710.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'مصطفى صلاح الدين سليمان',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/WhatsApp_Image_2022-12-13_at_21.11.45.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      ReveiwsRecord>>(
                                                                stream:
                                                                    queryReveiwsRecord(
                                                                  queryBuilder: (reveiwsRecord) => reveiwsRecord.where(
                                                                      'reviewed_person',
                                                                      isEqualTo:
                                                                          currentUserUid),
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
                                                                  List<ReveiwsRecord>
                                                                      textReveiwsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Text(
                                                                    'محمد سمير مولود أبو بكر',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/WhatsApp_Image_2022-12-13_at_21.15.23.jpg',
                                                                  ).image,
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'مجد جمال عبد اللطيف فودة',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .cancel_outlined,
                                                                color: Color(
                                                                    0xFFCF1F23),
                                                                size: 20,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'NULL CHECK',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
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
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
