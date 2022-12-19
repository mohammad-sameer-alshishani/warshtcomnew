import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filter_widget.dart';
import '../components/search_component_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPageCopyWidget extends StatefulWidget {
  const SearchPageCopyWidget({Key? key}) : super(key: key);

  @override
  _SearchPageCopyWidgetState createState() => _SearchPageCopyWidgetState();
}

class _SearchPageCopyWidgetState extends State<SearchPageCopyWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  List<PostsRecord> simpleSearchResults2 = [];
  TextEditingController? searchProvideController;
  List<UsersRecord> simpleSearchResults1 = [];
  TextEditingController? searchUsersController;
  List<PostsRecord> simpleSearchResults3 = [];
  TextEditingController? searchLikedController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().searchActive2 = false;
      });
    });

    searchLikedController = TextEditingController();
    searchProvideController = TextEditingController();
    searchUsersController = TextEditingController();
  }

  @override
  void dispose() {
    searchLikedController?.dispose();
    searchProvideController?.dispose();
    searchUsersController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.orderBy('created_time'),
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
        List<UsersRecord> searchPageCopyUsersRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: min(
                            valueOrDefault<int>(
                              FFAppState().searchInitialTab,
                              0,
                            ),
                            2),
                        child: Column(
                          children: [
                            TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Noto Kufi Arabic',
                                    lineHeight: 1,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              tabs: [
                                Tab(
                                  text: 'شخص',
                                  icon: Icon(
                                    Icons.person_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                                StreamBuilder<List<PostsRecord>>(
                                  stream: queryPostsRecord(
                                    queryBuilder: (postsRecord) =>
                                        postsRecord.orderBy('time_posted'),
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
                                    List<PostsRecord> tabPostsRecordList =
                                        snapshot.data!;
                                    return Tab(
                                      text: 'خدمة',
                                      icon: Icon(
                                        Icons.miscellaneous_services_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                      ),
                                    );
                                  },
                                ),
                                Tab(
                                  text: 'المفضلة',
                                  icon: Icon(
                                    Icons.favorite_rounded,
                                    color: Color(0xCEFF0000),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.6,
                                                            child:
                                                                FilterWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 0),
                                                      child: Icon(
                                                        Icons.filter_alt,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 7, 10, 0),
                                                      child: StreamBuilder<
                                                          List<UsersRecord>>(
                                                        stream:
                                                            queryUsersRecord(
                                                          queryBuilder: (usersRecord) => usersRecord
                                                              .where('isGuest',
                                                                  isEqualTo:
                                                                      false)
                                                              .where(
                                                                  'display_name',
                                                                  isNotEqualTo:
                                                                      '' != ''
                                                                          ? ''
                                                                          : null)
                                                              .orderBy(
                                                                  'created_time'),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/WarchtcomSplashPng.png',
                                                              ),
                                                            );
                                                          }
                                                          List<UsersRecord>
                                                              searchUsersUsersRecordList =
                                                              snapshot.data!
                                                                  .where((u) =>
                                                                      u.uid !=
                                                                      currentUserUid)
                                                                  .toList();
                                                          return TextFormField(
                                                            controller:
                                                                searchUsersController,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              'searchUsersController',
                                                              Duration(
                                                                  milliseconds:
                                                                      50),
                                                              () async {
                                                                setState(() {
                                                                  simpleSearchResults1 =
                                                                      TextSearch(
                                                                    searchUsersUsersRecordList
                                                                        .map(
                                                                          (record) =>
                                                                              TextSearchItem(record, [
                                                                            record.email!,
                                                                            record.displayName!,
                                                                            record.phoneNumber!,
                                                                            record.userBio!,
                                                                            record.userLocation!,
                                                                            record.userWork!
                                                                          ]),
                                                                        )
                                                                        .toList(),
                                                                  )
                                                                          .search(searchUsersController!
                                                                              .text)
                                                                          .map((r) =>
                                                                              r.object)
                                                                          .toList();
                                                                });
                                                                setState(() {
                                                                  FFAppState()
                                                                          .searchActive2 =
                                                                      true;
                                                                });
                                                              },
                                                            ),
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              final usersUpdateData =
                                                                  {
                                                                'search_history':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  searchUsersController!
                                                                      .text
                                                                ]),
                                                              };
                                                              await currentUserReference!
                                                                  .update(
                                                                      usersUpdateData);
                                                            },
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'ابحث عن شخص ...',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Kufi Arabic',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      ),
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedErrorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .search_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                              suffixIcon:
                                                                  searchUsersController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            searchUsersController?.clear();
                                                                            setState(() {
                                                                              simpleSearchResults1 = TextSearch(
                                                                                searchUsersUsersRecordList
                                                                                    .map(
                                                                                      (record) => TextSearchItem(record, [
                                                                                        record.email!,
                                                                                        record.displayName!,
                                                                                        record.phoneNumber!,
                                                                                        record.userBio!,
                                                                                        record.userLocation!,
                                                                                        record.userWork!
                                                                                      ]),
                                                                                    )
                                                                                    .toList(),
                                                                              ).search(searchUsersController!.text).map((r) => r.object).toList();
                                                                            });
                                                                            setState(() {
                                                                              FFAppState().searchActive2 = true;
                                                                            });
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                Color(0xFF757575),
                                                                            size:
                                                                                22,
                                                                          ),
                                                                        )
                                                                      : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Kufi Arabic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final filter = functions
                                              .filterization(
                                                  FFAppState().filterByWork,
                                                  FFAppState().filterByCities)
                                              .where((e) => e != '')
                                              .toList()
                                              .take(2)
                                              .toList();
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                filter.length, (filterIndex) {
                                              final filterItem =
                                                  filter[filterIndex];
                                              return Visibility(
                                                visible: filterItem != 'الكل',
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 0),
                                                  child: Container(
                                                    width: 100,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        if (filterIndex == 0) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .filterByWork =
                                                                'الكل';
                                                          });
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                    .filterByCities =
                                                                'الكل';
                                                          });
                                                        }
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            filterItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .cancel_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                      Expanded(
                                        child: StreamBuilder<List<PostsRecord>>(
                                          stream: queryPostsRecord(),
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
                                                containerPostsRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: double.infinity,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Visibility(
                                                visible: searchUsersController!
                                                            .text !=
                                                        null &&
                                                    searchUsersController!
                                                            .text !=
                                                        '',
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final pesronSearch =
                                                          simpleSearchResults1
                                                              .where((e) => () {
                                                                    if ((FFAppState().filterByWork !=
                                                                                null &&
                                                                            FFAppState().filterByWork !=
                                                                                '') &&
                                                                        (FFAppState().filterByCities !=
                                                                                null &&
                                                                            FFAppState().filterByCities !=
                                                                                '')) {
                                                                      return ((e.userWork! ==
                                                                              FFAppState()
                                                                                  .filterByWork) &&
                                                                          (e.userLocation! ==
                                                                              FFAppState().filterByCities));
                                                                    } else if (FFAppState().filterByWork !=
                                                                            null &&
                                                                        FFAppState().filterByWork !=
                                                                            '') {
                                                                      return (e
                                                                              .userWork! ==
                                                                          FFAppState()
                                                                              .filterByWork);
                                                                    } else if (FFAppState().filterByCities !=
                                                                            null &&
                                                                        FFAppState().filterByCities !=
                                                                            '') {
                                                                      return (e
                                                                              .userLocation! ==
                                                                          FFAppState()
                                                                              .filterByCities);
                                                                    } else {
                                                                      return true;
                                                                    }
                                                                  }())
                                                              .toList();
                                                      if (pesronSearch
                                                          .isEmpty) {
                                                        return SearchComponentWidget();
                                                      }
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            pesronSearch.length,
                                                        itemBuilder: (context,
                                                            pesronSearchIndex) {
                                                          final pesronSearchItem =
                                                              pesronSearch[
                                                                  pesronSearchIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        5),
                                                            child: Container(
                                                              width: 100,
                                                              height: 115,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            10,
                                                                            20,
                                                                            10),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'UserProfilePage',
                                                                          queryParams:
                                                                              {
                                                                            'userInfo':
                                                                                serializeParam(
                                                                              pesronSearchItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: CachedNetworkImageProvider(
                                                                                        valueOrDefault<String>(
                                                                                          pesronSearchItem.photoUrl != null && pesronSearchItem.photoUrl != '' ? (pesronSearchItem.photoUrl != '' ? pesronSearchItem.photoUrl : ' ') : '  https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Visibility(
                                                                                    visible: pesronSearchItem.photoUrl != null && pesronSearchItem.photoUrl != '' ? (pesronSearchItem.photoUrl == '') : true,
                                                                                    child: Icon(
                                                                                      Icons.person_rounded,
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 24,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0, -1),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                        child: AutoSizeText(
                                                                                          pesronSearchItem.displayName!.maybeHandleOverflow(
                                                                                            maxChars: 12,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Noto Kufi Arabic',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 15,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                      child: Text(
                                                                                        '.',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Noto Kufi Arabic',
                                                                                              fontWeight: FontWeight.w900,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: StreamBuilder<List<ReveiwsRecord>>(
                                                                                  stream: queryReveiwsRecord(
                                                                                    queryBuilder: (reveiwsRecord) => reveiwsRecord.where('reviewed_person', isEqualTo: pesronSearchItem.uid),
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
                                                                                    List<ReveiwsRecord> ratingBarReveiwsRecordList = snapshot.data!;
                                                                                    return RatingBarIndicator(
                                                                                      itemBuilder: (context, index) => Icon(
                                                                                        Icons.star_rounded,
                                                                                        color: Color(0xFFDB9E25),
                                                                                      ),
                                                                                      direction: Axis.horizontal,
                                                                                      rating: valueOrDefault<double>(
                                                                                        functions.rating(ratingBarReveiwsRecordList.map((e) => e.rating!).toList()),
                                                                                        0.0,
                                                                                      ),
                                                                                      unratedColor: Color(0xFF9E9E9E),
                                                                                      itemCount: 5,
                                                                                      itemSize: 20,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5,
                                                                                0,
                                                                                5,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 10, 0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      pesronSearchItem.userLocation,
                                                                                      'ليس محدد',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                  child: AutoSizeText(
                                                                                    valueOrDefault<String>(
                                                                                      pesronSearchItem.userWork,
                                                                                      'ليس محدد',
                                                                                    ).maybeHandleOverflow(
                                                                                      maxChars: 10,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0xFF7C8791),
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
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'chatpage',
                                                                              queryParams: {
                                                                                'chatUser': serializeParam(
                                                                                  pesronSearchItem,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'chatUser': pesronSearchItem,
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                45,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            child:
                                                                                Icon(
                                                                              Icons.chat_rounded,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await launchUrl(Uri(
                                                                              scheme: 'tel',
                                                                              path: pesronSearchItem.phoneNumber!,
                                                                            ));
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                45,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            child:
                                                                                Icon(
                                                                              Icons.phone_rounded,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation2']!),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 7, 10, 0),
                                                      child: StreamBuilder<
                                                          List<PostsRecord>>(
                                                        stream:
                                                            queryPostsRecord(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                              searchProvidePostsRecordList =
                                                              snapshot.data!;
                                                          return TextFormField(
                                                            controller:
                                                                searchProvideController,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              'searchProvideController',
                                                              Duration(
                                                                  milliseconds:
                                                                      50),
                                                              () async {
                                                                setState(() {
                                                                  simpleSearchResults2 =
                                                                      TextSearch(
                                                                    searchProvidePostsRecordList
                                                                        .map(
                                                                          (record) =>
                                                                              TextSearchItem(record, [
                                                                            record.email!,
                                                                            record.displayName!,
                                                                            record.phoneNumber!,
                                                                            record.postTitle!,
                                                                            record.postDescription!,
                                                                            record.postUserName!,
                                                                            record.postType!,
                                                                            record.postUserLocation!
                                                                          ]),
                                                                        )
                                                                        .toList(),
                                                                  )
                                                                          .search(searchProvideController!
                                                                              .text)
                                                                          .map((r) =>
                                                                              r.object)
                                                                          .toList();
                                                                });
                                                                setState(() {
                                                                  FFAppState()
                                                                          .searchActive2 =
                                                                      true;
                                                                });
                                                              },
                                                            ),
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              final usersUpdateData =
                                                                  {
                                                                'search_history':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  searchProvideController!
                                                                      .text
                                                                ]),
                                                              };
                                                              await currentUserReference!
                                                                  .update(
                                                                      usersUpdateData);
                                                            },
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'ابحث عن خدمة ..',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Kufi Arabic',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      ),
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedErrorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .search_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                              suffixIcon:
                                                                  searchProvideController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            searchProvideController?.clear();
                                                                            setState(() {
                                                                              simpleSearchResults2 = TextSearch(
                                                                                searchProvidePostsRecordList
                                                                                    .map(
                                                                                      (record) => TextSearchItem(record, [
                                                                                        record.email!,
                                                                                        record.displayName!,
                                                                                        record.phoneNumber!,
                                                                                        record.postTitle!,
                                                                                        record.postDescription!,
                                                                                        record.postUserName!,
                                                                                        record.postType!,
                                                                                        record.postUserLocation!
                                                                                      ]),
                                                                                    )
                                                                                    .toList(),
                                                                              ).search(searchProvideController!.text).map((r) => r.object).toList();
                                                                            });
                                                                            setState(() {
                                                                              FFAppState().searchActive2 = true;
                                                                            });
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                Color(0xFF757575),
                                                                            size:
                                                                                22,
                                                                          ),
                                                                        )
                                                                      : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Kufi Arabic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation3']!),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Visibility(
                                            visible: searchProvideController!
                                                        .text !=
                                                    null &&
                                                searchProvideController!.text !=
                                                    '',
                                            child: Builder(
                                              builder: (context) {
                                                final serachService =
                                                    simpleSearchResults2
                                                        .map((e) => e)
                                                        .toList();
                                                if (serachService.isEmpty) {
                                                  return SearchComponentWidget();
                                                }
                                                return InkWell(
                                                  onTap: () async {
                                                    setState(() {
                                                      FFAppState()
                                                          .searchActive = false;
                                                    });
                                                  },
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        serachService.length,
                                                    itemBuilder: (context,
                                                        serachServiceIndex) {
                                                      final serachServiceItem =
                                                          serachService[
                                                              serachServiceIndex];
                                                      return Container(
                                                        width: double.infinity,
                                                        height: 90,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3,
                                                              color: Color(
                                                                  0x32000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 10, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'postPage',
                                                                queryParams: {
                                                                  'postId':
                                                                      serializeParam(
                                                                    serachServiceItem
                                                                        .postID,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/WarchtcomSplashPng.png',
                                                                              width: 60,
                                                                              height: 60,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final postPhoto = serachServiceItem.postPhoto!.toList().take(1).toList();
                                                                              return Stack(
                                                                                children: List.generate(postPhoto.length, (postPhotoIndex) {
                                                                                  final postPhotoItem = postPhoto[postPhotoIndex];
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                    child: CachedNetworkImage(
                                                                                      imageUrl: postPhotoItem,
                                                                                      width: 60,
                                                                                      height: 60,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child: StreamBuilder<
                                                                            UsersRecord>(
                                                                          stream:
                                                                              UsersRecord.getDocument(serachServiceItem.postUser!),
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
                                                                            final columnUsersRecord =
                                                                                snapshot.data!;
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                AutoSizeText(
                                                                                  serachServiceItem.postTitle!.maybeHandleOverflow(
                                                                                    maxChars: 25,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).title3.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 16,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 25,
                                                                                      height: 25,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                        image: DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: CachedNetworkImageProvider(
                                                                                            valueOrDefault<String>(
                                                                                              columnUsersRecord.photoUrl != '' ? columnUsersRecord.photoUrl : ' https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Visibility(
                                                                                        visible: columnUsersRecord.photoUrl != null && columnUsersRecord.photoUrl != '' ? (columnUsersRecord.photoUrl == '') : true,
                                                                                        child: Icon(
                                                                                          Icons.person_rounded,
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          size: 20,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                      child: AutoSizeText(
                                                                                        columnUsersRecord.displayName!.maybeHandleOverflow(
                                                                                          maxChars: 15,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF7C8791),
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.star_rounded,
                                                                                          color: Color(0xFFFFAA2B),
                                                                                          size: 15,
                                                                                        ),
                                                                                        StreamBuilder<List<ReveiwsRecord>>(
                                                                                          stream: queryReveiwsRecord(
                                                                                            queryBuilder: (reveiwsRecord) => reveiwsRecord.where('reviewed_person', isEqualTo: columnUsersRecord.uid),
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
                                                                                                  textReveiwsRecordList.length,
                                                                                                  formatType: FormatType.compactLong,
                                                                                                ),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Noto Kufi Arabic',
                                                                                                    fontSize: 12,
                                                                                                  ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                      child: Text(
                                                                                        serachServiceItem.postType!,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                      child: Text(
                                                                                        ' . ${serachServiceItem.price?.toString()}/${serachServiceItem.priceType}',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                      child: Text(
                                                                                        dateTimeFormat(
                                                                                          'relative',
                                                                                          serachServiceItem.timePosted!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
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
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation4']!);
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 7, 10, 0),
                                                      child: StreamBuilder<
                                                          List<PostsRecord>>(
                                                        stream:
                                                            queryPostsRecord(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                              searchLikedPostsRecordList =
                                                              snapshot.data!;
                                                          return TextFormField(
                                                            controller:
                                                                searchLikedController,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              'searchLikedController',
                                                              Duration(
                                                                  milliseconds:
                                                                      50),
                                                              () async {
                                                                setState(() {
                                                                  simpleSearchResults3 =
                                                                      TextSearch(
                                                                    searchLikedPostsRecordList
                                                                        .map(
                                                                          (record) =>
                                                                              TextSearchItem(record, [
                                                                            record.email!,
                                                                            record.displayName!,
                                                                            record.phoneNumber!,
                                                                            record.postTitle!,
                                                                            record.postDescription!,
                                                                            record.postUserName!,
                                                                            record.postType!,
                                                                            record.postUserLocation!
                                                                          ]),
                                                                        )
                                                                        .toList(),
                                                                  )
                                                                          .search(searchLikedController!
                                                                              .text)
                                                                          .map((r) =>
                                                                              r.object)
                                                                          .toList();
                                                                });
                                                                setState(() {
                                                                  FFAppState()
                                                                          .searchActive2 =
                                                                      true;
                                                                });
                                                              },
                                                            ),
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              final usersUpdateData =
                                                                  {
                                                                'search_history':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  searchLikedController!
                                                                      .text
                                                                ]),
                                                              };
                                                              await currentUserReference!
                                                                  .update(
                                                                      usersUpdateData);
                                                            },
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'ابحث عن خدمة بالمفضلة ..',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Kufi Arabic',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      ),
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedErrorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .search_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                              suffixIcon:
                                                                  searchLikedController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            searchLikedController?.clear();
                                                                            setState(() {
                                                                              simpleSearchResults3 = TextSearch(
                                                                                searchLikedPostsRecordList
                                                                                    .map(
                                                                                      (record) => TextSearchItem(record, [
                                                                                        record.email!,
                                                                                        record.displayName!,
                                                                                        record.phoneNumber!,
                                                                                        record.postTitle!,
                                                                                        record.postDescription!,
                                                                                        record.postUserName!,
                                                                                        record.postType!,
                                                                                        record.postUserLocation!
                                                                                      ]),
                                                                                    )
                                                                                    .toList(),
                                                                              ).search(searchLikedController!.text).map((r) => r.object).toList();
                                                                            });
                                                                            setState(() {
                                                                              FFAppState().searchActive2 = true;
                                                                            });
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                Color(0xFF757575),
                                                                            size:
                                                                                22,
                                                                          ),
                                                                        )
                                                                      : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Kufi Arabic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation5']!),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Visibility(
                                            visible: searchLikedController!
                                                        .text !=
                                                    null &&
                                                searchLikedController!.text !=
                                                    '',
                                            child: Builder(
                                              builder: (context) {
                                                final serachServiceLiked =
                                                    simpleSearchResults3
                                                        .map((e) => e)
                                                        .toList();
                                                if (serachServiceLiked
                                                    .isEmpty) {
                                                  return SearchComponentWidget();
                                                }
                                                return InkWell(
                                                  onTap: () async {
                                                    setState(() {
                                                      FFAppState()
                                                          .searchActive = false;
                                                    });
                                                  },
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        serachServiceLiked
                                                            .length,
                                                    itemBuilder: (context,
                                                        serachServiceLikedIndex) {
                                                      final serachServiceLikedItem =
                                                          serachServiceLiked[
                                                              serachServiceLikedIndex];
                                                      return Visibility(
                                                        visible:
                                                            serachServiceLikedItem
                                                                .likedBy!
                                                                .toList()
                                                                .contains(
                                                                    currentUserReference),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 90,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3,
                                                                color: Color(
                                                                    0x32000000),
                                                                offset: Offset(
                                                                    0, 1),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        10,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'postPage',
                                                                  queryParams: {
                                                                    'postId':
                                                                        serializeParam(
                                                                      serachServiceLikedItem
                                                                          .postID,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              child: Image.asset(
                                                                                'assets/images/WarchtcomSplashPng.png',
                                                                                width: 60,
                                                                                height: 60,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final postPhoto = serachServiceLikedItem.postPhoto!.toList().take(1).toList();
                                                                                return Stack(
                                                                                  children: List.generate(postPhoto.length, (postPhotoIndex) {
                                                                                    final postPhotoItem = postPhoto[postPhotoIndex];
                                                                                    return ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                      child: CachedNetworkImage(
                                                                                        imageUrl: postPhotoItem,
                                                                                        width: 60,
                                                                                        height: 60,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              StreamBuilder<UsersRecord>(
                                                                            stream:
                                                                                UsersRecord.getDocument(serachServiceLikedItem.postUser!),
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
                                                                              final columnUsersRecord = snapshot.data!;
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  AutoSizeText(
                                                                                    serachServiceLikedItem.postTitle!.maybeHandleOverflow(
                                                                                      maxChars: 25,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).title3.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 25,
                                                                                        height: 25,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.cover,
                                                                                            image: CachedNetworkImageProvider(
                                                                                              valueOrDefault<String>(
                                                                                                columnUsersRecord.photoUrl != '' ? columnUsersRecord.photoUrl : ' https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Visibility(
                                                                                          visible: columnUsersRecord.photoUrl != null && columnUsersRecord.photoUrl != '' ? (columnUsersRecord.photoUrl == '') : true,
                                                                                          child: Icon(
                                                                                            Icons.person_rounded,
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            size: 20,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                        child: AutoSizeText(
                                                                                          columnUsersRecord.displayName!.maybeHandleOverflow(
                                                                                            maxChars: 15,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: Color(0xFF7C8791),
                                                                                                fontSize: 14,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.star_rounded,
                                                                                            color: Color(0xFFFFAA2B),
                                                                                            size: 15,
                                                                                          ),
                                                                                          StreamBuilder<List<ReveiwsRecord>>(
                                                                                            stream: queryReveiwsRecord(
                                                                                              queryBuilder: (reveiwsRecord) => reveiwsRecord.where('reviewed_person', isEqualTo: columnUsersRecord.uid),
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
                                                                                                    textReveiwsRecordList.length,
                                                                                                    formatType: FormatType.compactLong,
                                                                                                  ),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Noto Kufi Arabic',
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                        child: Text(
                                                                                          serachServiceLikedItem.postType!.maybeHandleOverflow(maxChars: 10),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                        child: Text(
                                                                                          ' . ${formatNumber(
                                                                                            serachServiceLikedItem.price,
                                                                                            formatType: FormatType.compact,
                                                                                          )}/${serachServiceLikedItem.priceType}',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                        child: Text(
                                                                                          dateTimeFormat(
                                                                                            'relative',
                                                                                            serachServiceLikedItem.timePosted!,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                fontSize: 14,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  StreamBuilder<
                                                                      PostsRecord>(
                                                                    stream: PostsRecord.getDocument(
                                                                        serachServiceLikedItem
                                                                            .reference),
                                                                    builder:
                                                                        (context,
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
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final stackPostsRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Stack(
                                                                        children: [
                                                                          ToggleIcon(
                                                                            onPressed:
                                                                                () async {
                                                                              final likedByElement = currentUserReference;
                                                                              final likedByUpdate = stackPostsRecord.likedBy!.toList().contains(likedByElement)
                                                                                  ? FieldValue.arrayRemove([
                                                                                      likedByElement
                                                                                    ])
                                                                                  : FieldValue.arrayUnion([
                                                                                      likedByElement
                                                                                    ]);
                                                                              final postsUpdateData = {
                                                                                'liked_by': likedByUpdate,
                                                                              };
                                                                              await stackPostsRecord.reference.update(postsUpdateData);
                                                                            },
                                                                            value:
                                                                                stackPostsRecord.likedBy!.toList().contains(currentUserReference),
                                                                            onIcon:
                                                                                Icon(
                                                                              Icons.favorite_rounded,
                                                                              color: Color(0xFFFF0000),
                                                                              size: 25,
                                                                            ),
                                                                            offIcon:
                                                                                Icon(
                                                                              Icons.favorite_border_rounded,
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              size: 25,
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              if (serachServiceLikedItem.likedBy!.toList().contains(currentUserReference)) {
                                                                                final postsUpdateData = {
                                                                                  'liked_by': FieldValue.arrayRemove([
                                                                                    currentUserReference
                                                                                  ]),
                                                                                };
                                                                                await serachServiceLikedItem.reference.update(postsUpdateData);

                                                                                final usersUpdateData = {
                                                                                  'liked_posts': FieldValue.arrayRemove([
                                                                                    serachServiceLikedItem.reference
                                                                                  ]),
                                                                                };
                                                                                await currentUserReference!.update(usersUpdateData);
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
                                                                                  'liked_by': FieldValue.arrayUnion([
                                                                                    currentUserReference
                                                                                  ]),
                                                                                };
                                                                                await serachServiceLikedItem.reference.update(postsUpdateData);

                                                                                final usersUpdateData = {
                                                                                  'liked_posts': FieldValue.arrayUnion([
                                                                                    serachServiceLikedItem.reference
                                                                                  ]),
                                                                                };
                                                                                await currentUserReference!.update(usersUpdateData);
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
                                                                            child:
                                                                                Container(
                                                                              width: 45,
                                                                              height: 45,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x00FFFFFF),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation6']!),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
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
          ),
        );
      },
    );
  }
}
