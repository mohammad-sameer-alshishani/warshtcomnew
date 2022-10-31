import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({Key? key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  Completer<List<UsersRecord>>? _firestoreRequestCompleter1;
  Completer<List<UsersRecord>>? _firestoreRequestCompleter2;
  Completer<List<UsersRecord>>? _firestoreRequestCompleter3;
  TextEditingController? textController;
  PagingController<DocumentSnapshot?, UsersRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'ابحث عن خدمة',
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
          child: FutureBuilder<List<PostsRecord>>(
            future: queryPostsRecordOnce(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              List<PostsRecord> containerPostsRecordList = snapshot.data!;
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FutureBuilder<List<UsersRecord>>(
                  future: (_firestoreRequestCompleter2 ??=
                          Completer<List<UsersRecord>>()
                            ..complete(queryUsersRecordOnce(
                              singleRecord: true,
                            )))
                      .future,
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<UsersRecord> listViewUsersRecordList = snapshot.data!;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final listViewUsersRecord =
                        listViewUsersRecordList.isNotEmpty
                            ? listViewUsersRecordList.first
                            : null;
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() => _firestoreRequestCompleter2 = null);
                        await waitForFirestoreRequestCompleter2();
                      },
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: textController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'textController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() =>
                                            _firestoreRequestCompleter3 = null);
                                        await waitForFirestoreRequestCompleter3(
                                            maxWait: 300);
                                      },
                                    ),
                                    onFieldSubmitted: (_) async {
                                      final usersUpdateData = {
                                        'search_history': FieldValue.arrayUnion(
                                            [textController!.text]),
                                      };
                                      await currentUserReference!
                                          .update(usersUpdateData);
                                    },
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'ابحث...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      suffixIcon:
                                          textController!.text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    textController?.clear();
                                                    setState(() =>
                                                        _firestoreRequestCompleter3 =
                                                            null);
                                                    await waitForFirestoreRequestCompleter3(
                                                        maxWait: 300);
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: Color(0xFF757575),
                                                    size: 22,
                                                  ),
                                                )
                                              : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Noto Kufi Arabic',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: FutureBuilder<UsersRecord>(
                                future: UsersRecord.getDocumentOnce(
                                    currentUserReference!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  final columnUsersRecord = snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Icon(
                                                  Icons.history,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.95, 0),
                                                child: Text(
                                                  'سجل البحث',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2,
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'محو السجل'),
                                                            content: Text(
                                                                'هل تريد محو سجل البحث  ؟'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'الغاء'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'تأكيد'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                final usersUpdateData = {
                                                  'search_history':
                                                      FieldValue.delete(),
                                                };
                                                await currentUserReference!
                                                    .update(usersUpdateData);
                                              } else {
                                                context.pop();
                                              }
                                            },
                                            child: Text(
                                              'محو السجل',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child:
                                              FutureBuilder<List<UsersRecord>>(
                                            future: (_firestoreRequestCompleter3 ??=
                                                    Completer<
                                                        List<UsersRecord>>()
                                                      ..complete(
                                                          queryUsersRecordOnce(
                                                        queryBuilder: (usersRecord) =>
                                                            usersRecord.whereArrayContainsAny(
                                                                'search_history',
                                                                columnUsersRecord
                                                                            .searchHistory!
                                                                            .toList() !=
                                                                        ''
                                                                    ? columnUsersRecord
                                                                        .searchHistory!
                                                                        .toList()
                                                                    : null),
                                                        singleRecord: true,
                                                      )))
                                                .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRecord>
                                                  listViewUsersRecordList =
                                                  snapshot.data!;
                                              if (listViewUsersRecordList
                                                  .isEmpty) {
                                                return Image.network(
                                                  '',
                                                );
                                              }
                                              final listViewUsersRecord =
                                                  listViewUsersRecordList
                                                          .isNotEmpty
                                                      ? listViewUsersRecordList
                                                          .first
                                                      : null;
                                              return Builder(
                                                builder: (context) {
                                                  final searchH =
                                                      columnUsersRecord
                                                          .searchHistory!
                                                          .toList();
                                                  if (searchH.isEmpty) {
                                                    return Image.network(
                                                      '',
                                                    );
                                                  }
                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      setState(() =>
                                                          _firestoreRequestCompleter1 =
                                                              null);
                                                      await waitForFirestoreRequestCompleter1();
                                                      setState(() =>
                                                          _firestoreRequestCompleter3 =
                                                              null);
                                                      await waitForFirestoreRequestCompleter3();
                                                    },
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: searchH.length,
                                                      itemBuilder: (context,
                                                          searchHIndex) {
                                                        final searchHItem =
                                                            searchH[
                                                                searchHIndex];
                                                        return FutureBuilder<
                                                            UsersRecord>(
                                                          future: UsersRecord
                                                              .getDocumentOnce(
                                                                  listViewUsersRecord!
                                                                      .reference),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final rowUsersRecord =
                                                                snapshot.data!;
                                                            return Row(
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
                                                                          2,
                                                                          2,
                                                                          2,
                                                                          2),
                                                                  child: Text(
                                                                    columnUsersRecord
                                                                        .searchHistory!
                                                                        .toList()
                                                                        .contains(columnUsersRecord
                                                                            .searchHistory!
                                                                            .toList()
                                                                            .where((e) =>
                                                                                columnUsersRecord !=
                                                                                null)
                                                                            .toList()
                                                                            .length)
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Kufi Arabic',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                        ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    final usersUpdateData =
                                                                        {
                                                                      'search_history':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        columnUsersRecord
                                                                            .searchHistory!
                                                                            .toList()
                                                                            .where((e) =>
                                                                                columnUsersRecord !=
                                                                                null)
                                                                            .toList()
                                                                            .length
                                                                            .toString()
                                                                      ]),
                                                                    };
                                                                    await columnUsersRecord
                                                                        .reference
                                                                        .update(
                                                                            usersUpdateData);
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
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
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1.5,
                            indent: 15,
                            endIndent: 15,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                            child: Text(
                              'نتائج البحث',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Noto Kufi Arabic',
                                    fontSize: 15,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                            child: PagedListView<DocumentSnapshot<Object?>?,
                                UsersRecord>(
                              pagingController: () {
                                final Query<Object?> Function(Query<Object?>)
                                    queryBuilder = (usersRecord) => usersRecord
                                        .where('display_name',
                                            isGreaterThanOrEqualTo:
                                                textController!.text != ''
                                                    ? textController!.text
                                                    : null)
                                        .where('uid',
                                            isEqualTo:
                                                textController!.text != ''
                                                    ? textController!.text
                                                    : null)
                                        .where('email',
                                            isEqualTo:
                                                textController!.text != ''
                                                    ? textController!.text
                                                    : null)
                                        .where('phone_number',
                                            isEqualTo:
                                                textController!.text != ''
                                                    ? textController!.text
                                                    : null)
                                        .orderBy('created_time');
                                if (_pagingController != null) {
                                  final query =
                                      queryBuilder(UsersRecord.collection);
                                  if (query != _pagingQuery) {
                                    // The query has changed
                                    _pagingQuery = query;
                                    _streamSubscriptions
                                        .forEach((s) => s?.cancel());
                                    _streamSubscriptions.clear();
                                    _pagingController!.refresh();
                                  }
                                  return _pagingController!;
                                }

                                _pagingController =
                                    PagingController(firstPageKey: null);
                                _pagingQuery =
                                    queryBuilder(UsersRecord.collection);
                                _pagingController!
                                    .addPageRequestListener((nextPageMarker) {
                                  queryUsersRecordPage(
                                    queryBuilder: (usersRecord) => usersRecord
                                        .where('display_name',
                                            isGreaterThanOrEqualTo:
                                                textController!.text != ''
                                                    ? textController!.text
                                                    : null)
                                        .where('uid',
                                            isEqualTo:
                                                textController!.text != ''
                                                    ? textController!.text
                                                    : null)
                                        .where('email',
                                            isEqualTo:
                                                textController!.text != ''
                                                    ? textController!.text
                                                    : null)
                                        .where('phone_number',
                                            isEqualTo:
                                                textController!.text != ''
                                                    ? textController!.text
                                                    : null)
                                        .orderBy('created_time'),
                                    nextPageMarker: nextPageMarker,
                                    pageSize: 25,
                                    isStream: true,
                                  ).then((page) {
                                    _pagingController!.appendPage(
                                      page.data,
                                      page.nextPageMarker,
                                    );
                                    final streamSubscription =
                                        page.dataStream?.listen((data) {
                                      final itemIndexes = _pagingController!
                                          .itemList!
                                          .asMap()
                                          .map((k, v) =>
                                              MapEntry(v.reference.id, k));
                                      data.forEach((item) {
                                        final index =
                                            itemIndexes[item.reference.id];
                                        final items =
                                            _pagingController!.itemList!;
                                        if (index != null) {
                                          items.replaceRange(
                                              index, index + 1, [item]);
                                          _pagingController!.itemList = {
                                            for (var item in items)
                                              item.reference: item
                                          }.values.toList();
                                        }
                                      });
                                      setState(() {});
                                    });
                                    _streamSubscriptions
                                        .add(streamSubscription);
                                  });
                                });
                                return _pagingController!;
                              }(),
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              builderDelegate:
                                  PagedChildBuilderDelegate<UsersRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                ),

                                itemBuilder: (context, _, listViewIndex) {
                                  final listViewUsersRecord = _pagingController!
                                      .itemList![listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 4, 16, 8),
                                    child: FutureBuilder<List<UsersRecord>>(
                                      future: (_firestoreRequestCompleter1 ??=
                                              Completer<List<UsersRecord>>()
                                                ..complete(
                                                    queryUsersRecordOnce()))
                                          .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord>
                                            usersCardUsersRecordList = snapshot
                                                .data!
                                                .where((u) =>
                                                    u.uid != currentUserUid)
                                                .toList();
                                        return Container(
                                          width: double.infinity,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE0E3E7),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x32000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(26),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        listViewUsersRecord
                                                            .photoUrl!,
                                                    width: 36,
                                                    height: 36,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewUsersRecord
                                                              .displayName!,
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              listViewUsersRecord
                                                                  .email!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      'UserProfilePage',
                                                      queryParams: {
                                                        'userInfo':
                                                            serializeParam(
                                                          listViewUsersRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: 'عرض',
                                                  options: FFButtonOptions(
                                                    width: 70,
                                                    height: 36,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color:
                                                              Color(0xFFE0E3E7),
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future waitForFirestoreRequestCompleter1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
