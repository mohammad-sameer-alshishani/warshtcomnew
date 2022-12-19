import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/about_widget.dart';
import '../components/bottom_sheet_post_widget.dart';
import '../components/bottom_sheet_request_post_widget.dart';
import '../components/q_r_code_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfilePageWidget extends StatefulWidget {
  const MyProfilePageWidget({
    Key? key,
    this.userRefRecieve,
  }) : super(key: key);

  final DocumentReference? userRefRecieve;

  @override
  _MyProfilePageWidgetState createState() => _MyProfilePageWidgetState();
}

class _MyProfilePageWidgetState extends State<MyProfilePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 200.ms,
          begin: Offset(19, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 200.ms,
          begin: Offset(20, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 200.ms,
          begin: Offset(20, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 200.ms,
          begin: Offset(20, 0),
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
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  bool? switchValue;
  var scanner = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        if (valueOrDefault<bool>(currentUserDocument?.isGuest, false) ==
            false) {
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'يرجى تسجيل الدخول للقيام بالنشر',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );

        context.pushNamed('LoginPage');

        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'يرجى تسجيل الدخول للقيام بالنشر',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );

        context.pushNamed('LoginPage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final myProfilePageUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              context.pushNamed(
                'ServiceProvide',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                  ),
                },
              );
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
          drawer: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Drawer(
              elevation: 16,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectionArea(
                              child: Text(
                            'الوضع الليلي',
                            style: FlutterFlowTheme.of(context).title3,
                          )),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wb_sunny,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                                Switch(
                                  value: switchValue ??=
                                      (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? false
                                          : true,
                                  onChanged: (newValue) async {
                                    setState(() => switchValue = newValue!);
                                    if (newValue!) {
                                      setDarkModeSetting(
                                          context, ThemeMode.dark);
                                    } else {
                                      setDarkModeSetting(
                                          context, ThemeMode.light);
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.solidMoon,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 2, 0, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await signOut();

                                      context.goNamedAuth('LoginPage', mounted);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Text(
                                                'تسجيل الخروج',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: Icon(
                                              Icons.logout,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'EditProfile',
                                        queryParams: {
                                          'userRecordRef': serializeParam(
                                            myProfilePageUsersRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Text(
                                                'تعديل الملف الشخصي',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: Icon(
                                              Icons.edit_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Text(
                                                'قائمة المفضلة',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: Icon(
                                              Icons.favorite_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed('messagePage');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Text(
                                                'دردشاتي',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: Icon(
                                              Icons.chat_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'ServiceProvide',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.leftToRight,
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Text(
                                                'اضافة منشور',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: Icon(
                                              Icons.add_circle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.65,
                                              child: QRCodeWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Text(
                                                'بار كود الايميل',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: Icon(
                                              Icons.qr_code_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      scanner = await FlutterBarcodeScanner
                                          .scanBarcode(
                                        '#C62828', // scanning line color
                                        'Cancel', // cancel button text
                                        true, // whether to show the flash icon
                                        ScanMode.BARCODE,
                                      );

                                      setState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Text(
                                                'ماسح الباركود',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: Icon(
                                              Icons.qr_code_scanner_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.9,
                                              child: AboutWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Text(
                                                'من نحن',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: Icon(
                                              Icons.help_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                await deleteUser(context);

                                context.goNamed('LoginPage');
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF1313),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Text(
                                          'حذف الحساب',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Noto Kufi Arabic',
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 20, 20),
                                      child: Icon(
                                        Icons.delete_forever_rounded,
                                        color: Colors.black,
                                        size: 30,
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
                  ],
                ),
              ),
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                expandedHeight: 415,
                collapsedHeight: 415,
                pinned: false,
                floating: true,
                snap: false,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 54, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 50,
                                icon: Icon(
                                  Icons.menu_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 40,
                                ),
                                onPressed: () async {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ),
                            Text(
                              'الصفحة الشخصية',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Noto Kufi Arabic',
                                    fontSize: 25,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 100,
                                                      allowPhoto: true,
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
                                                        isMediaUploading =
                                                            false;
                                                      }
                                                      if (downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                        setState(() =>
                                                            uploadedFileUrl =
                                                                downloadUrls
                                                                    .first);
                                                        showUploadMessage(
                                                            context,
                                                            'Success!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Failed to upload media');
                                                        return;
                                                      }
                                                    }

                                                    if (uploadedFileUrl != '') {
                                                      final usersUpdateData =
                                                          createUsersRecordData(
                                                        photoUrl:
                                                            uploadedFileUrl,
                                                      );
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData);
                                                    }
                                                  },
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    children: [
                                                      if (myProfilePageUsersRecord
                                                                  .photoUrl ==
                                                              null ||
                                                          myProfilePageUsersRecord
                                                                  .photoUrl ==
                                                              '')
                                                        Container(
                                                          width: 71,
                                                          height: 71,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              width: 3,
                                                            ),
                                                          ),
                                                          child: Visibility(
                                                            visible: myProfilePageUsersRecord
                                                                        .photoUrl ==
                                                                    null ||
                                                                myProfilePageUsersRecord
                                                                        .photoUrl ==
                                                                    '',
                                                            child: Icon(
                                                              Icons
                                                                  .person_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                      if (currentUserPhoto !=
                                                              null &&
                                                          currentUserPhoto !=
                                                              '')
                                                        AuthUserStreamWidget(
                                                          child: Container(
                                                            width: 71,
                                                            height: 71,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                width: 3,
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible: currentUserPhoto !=
                                                                      null &&
                                                                  currentUserPhoto !=
                                                                      '',
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    currentUserPhoto,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/0fx5uqsamw0c/WarchtcomSplashPng.png',
                                                                  ),
                                                                  width: 70,
                                                                  height: 70,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          StreamBuilder<
                                                              List<
                                                                  ReveiwsRecord>>(
                                                            stream:
                                                                queryReveiwsRecord(
                                                              queryBuilder: (reveiwsRecord) =>
                                                                  reveiwsRecord.where(
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
                                                                  ratingBarReveiwsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return RatingBarIndicator(
                                                                itemBuilder:
                                                                    (context,
                                                                            index) =>
                                                                        Icon(
                                                                  Icons
                                                                      .star_rounded,
                                                                  color: Color(
                                                                      0xFFFF8E00),
                                                                ),
                                                                direction: Axis
                                                                    .horizontal,
                                                                rating:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  functions.rating(ratingBarReveiwsRecordList
                                                                      .map((e) =>
                                                                          e.rating!)
                                                                      .toList()),
                                                                  0.0,
                                                                ),
                                                                unratedColor: Color(
                                                                    0xFF9E9E9E),
                                                                itemCount: 5,
                                                                itemSize: 28,
                                                              );
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        10,
                                                                        0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    ReveiwsRecord>>(
                                                              stream:
                                                                  queryReveiwsRecord(
                                                                queryBuilder: (reveiwsRecord) =>
                                                                    reveiwsRecord.where(
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
                                                                    textReveiwsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    formatNumber(
                                                                      functions.rating(textReveiwsRecordList
                                                                          .map((e) =>
                                                                              e.rating!)
                                                                          .toList()),
                                                                      formatType:
                                                                          FormatType
                                                                              .compactLong,
                                                                    ),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Kufi Arabic',
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StreamBuilder<
                                                          List<PostsRecord>>(
                                                        stream:
                                                            queryPostsRecord(
                                                          queryBuilder: (postsRecord) =>
                                                              postsRecord.where(
                                                                  'post_user',
                                                                  isEqualTo:
                                                                      currentUserReference),
                                                        ),
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
                                                              stackPostsRecordList =
                                                              snapshot.data!;
                                                          return Stack(
                                                            children: List.generate(
                                                                stackPostsRecordList
                                                                    .length,
                                                                (stackIndex) {
                                                              final stackPostsRecord =
                                                                  stackPostsRecordList[
                                                                      stackIndex];
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: SelectionArea(
                                                                        child: Text(
                                                                      'الخدمات',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    )),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      child: SelectionArea(
                                                                          child: Text(
                                                                        formatNumber(
                                                                          (currentUserDocument?.allPosts?.toList() ?? [])
                                                                              .length,
                                                                          formatType:
                                                                              FormatType.compact,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      )),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: SelectionArea(
                                                                        child: Text(
                                                                      'المفضلة',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    )),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      child: SelectionArea(
                                                                          child: Text(
                                                                        formatNumber(
                                                                          (currentUserDocument?.likedPosts?.toList() ?? [])
                                                                              .length,
                                                                          formatType:
                                                                              FormatType.compact,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
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
                                                  ).animateOnPageLoad(animationsMap[
                                                      'columnOnPageLoadAnimation']!),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 10, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
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
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              child:
                                                                  AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  currentUserDisplayName,
                                                                  'اسم المستخدم',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 15,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Kufi Arabic',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Container(
                                                              width: 100,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              alignment: AlignmentDirectional(
                                                                  0.050000000000000044,
                                                                  0.050000000000000044),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                child:
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                  valueOrDefault<bool>(
                                                                              currentUserDocument?.provider,
                                                                              false) ==
                                                                          false
                                                                      ? 'باحث عن خدمة'
                                                                      : 'مزود خدمة',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Kufi Arabic',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                      ),
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              onLongPress:
                                                                  () async {
                                                                await Share.share(
                                                                    currentUserUid);
                                                              },
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  currentUserUid,
                                                                  'الرقم المعرف',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Kufi Arabic',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3,
                                                                          0,
                                                                          3,
                                                                          0),
                                                              child:
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                ': ID',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              )),
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.email,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 24,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      currentUserEmail,
                                                      'البريد الالكتروني',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation1']!),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.phone_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 24,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: AuthUserStreamWidget(
                                                    child: InkWell(
                                                      onLongPress: () async {
                                                        await launchUrl(Uri(
                                                          scheme: 'tel',
                                                          path:
                                                              currentPhoneNumber,
                                                        ));
                                                      },
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          currentPhoneNumber,
                                                          'لا يوجد',
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
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation2']!),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.category_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 24,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: AuthUserStreamWidget(
                                                    child: SelectionArea(
                                                        child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.userWork,
                                                            ''),
                                                        'لا يوجد',
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
                                                                    .primaryText,
                                                              ),
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation3']!),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.info_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 24,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: AuthUserStreamWidget(
                                                      child: SelectionArea(
                                                          child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.userBio,
                                                              ''),
                                                          'لا يوجد',
                                                        ).maybeHandleOverflow(
                                                          maxChars: 150,
                                                          replacement: '…',
                                                        ),
                                                        maxLines: 5,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation4']!),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'EditProfile',
                                                          queryParams: {
                                                            'userRecordRef':
                                                                serializeParam(
                                                              currentUserReference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.edit_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 0, 0, 0),
                                                    child: Stack(
                                                      children: [
                                                        if (valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.provider,
                                                                false) ==
                                                            false)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if ((currentUserEmail != null && currentUserEmail != '') &&
                                                                      (currentUserDisplayName !=
                                                                              null &&
                                                                          currentUserDisplayName !=
                                                                              '') &&
                                                                      (currentPhoneNumber !=
                                                                              null &&
                                                                          currentPhoneNumber !=
                                                                              '') &&
                                                                      (valueOrDefault(currentUserDocument?.userGender, '') !=
                                                                              null &&
                                                                          valueOrDefault(currentUserDocument?.userGender, '') !=
                                                                              '') &&
                                                                      (valueOrDefault(currentUserDocument?.userLocation, '') !=
                                                                              null &&
                                                                          valueOrDefault(currentUserDocument?.userLocation, '') !=
                                                                              '') &&
                                                                      (valueOrDefault(currentUserDocument?.userWork, '') !=
                                                                              null &&
                                                                          valueOrDefault(currentUserDocument?.userWork, '') !=
                                                                              '') &&
                                                                      (valueOrDefault(currentUserDocument?.userBio, '') !=
                                                                              null &&
                                                                          valueOrDefault(currentUserDocument?.userBio, '') !=
                                                                              '')) {
                                                                    final usersUpdateData =
                                                                        createUsersRecordData(
                                                                      provider:
                                                                          true,
                                                                    );
                                                                    await currentUserReference!
                                                                        .update(
                                                                            usersUpdateData);
                                                                    if (Navigator.of(
                                                                            context)
                                                                        .canPop()) {
                                                                      context
                                                                          .pop();
                                                                    }
                                                                    context
                                                                        .pushNamed(
                                                                      'MyProfilePage',
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
                                                                  } else {
                                                                    context.pushNamed(
                                                                        'ChangeToProvider');
                                                                  }
                                                                },
                                                                text:
                                                                    'تحويل لمزود خدمة',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 150,
                                                                  height: 40,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Kufi Arabic',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.provider,
                                                                false) ==
                                                            true)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    final usersUpdateData =
                                                                        createUsersRecordData(
                                                                      provider:
                                                                          false,
                                                                    );
                                                                    await currentUserReference!
                                                                        .update(
                                                                            usersUpdateData);
                                                                    if (Navigator.of(
                                                                            context)
                                                                        .canPop()) {
                                                                      context
                                                                          .pop();
                                                                    }
                                                                    context
                                                                        .pushNamed(
                                                                      'MyProfilePage',
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
                                                                  text:
                                                                      'تحويل لباحث ',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 150,
                                                                    height: 40,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Kufi Arabic',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                ),
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation6']!),
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                toolbarHeight: 415,
                elevation: 0,
              )
            ],
            body: Builder(
              builder: (context) {
                return SafeArea(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(),
                            child: DefaultTabController(
                              length: 4,
                              initialIndex: 1,
                              child: Column(
                                children: [
                                  TabBar(
                                    isScrollable: true,
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    indicatorColor: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    tabs: [
                                      AuthUserStreamWidget(
                                        child: Tab(
                                          text: valueOrDefault<String>(
                                            valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.provider,
                                                    false)
                                                ? 'خدماتي'
                                                : 'طلباتي',
                                            'منشوراتي',
                                          ),
                                          icon: Icon(
                                            Icons
                                                .miscellaneous_services_rounded,
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        text: 'المفضلة ',
                                        icon: Icon(
                                          Icons.favorite_rounded,
                                          color: Color(0xFFFF0000),
                                        ),
                                      ),
                                      Tab(
                                        text: 'المحفوظات',
                                        icon: Icon(
                                          Icons.save_alt_rounded,
                                        ),
                                      ),
                                      Tab(
                                        text: 'مراجعات',
                                        icon: Icon(
                                          Icons.rate_review_rounded,
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
                                                  false))
                                                AuthUserStreamWidget(
                                                  child: StreamBuilder<
                                                      List<PostsRecord>>(
                                                    stream: queryPostsRecord(
                                                      queryBuilder: (postsRecord) =>
                                                          postsRecord
                                                              .where(
                                                                  'post_user',
                                                                  isEqualTo:
                                                                      myProfilePageUsersRecord
                                                                          .reference)
                                                              .orderBy(
                                                                  'time_posted',
                                                                  descending:
                                                                      true),
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
                                                      List<PostsRecord>
                                                          columnScrollPostsRecordList =
                                                          snapshot.data!;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnScrollPostsRecordList
                                                                  .length,
                                                              (columnScrollIndex) {
                                                            final columnScrollPostsRecord =
                                                                columnScrollPostsRecordList[
                                                                    columnScrollIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          5,
                                                                          15),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      PostsRecord>>(
                                                                stream:
                                                                    queryPostsRecord(),
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
                                                                  List<PostsRecord>
                                                                      socialPostPostsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              4,
                                                                              4,
                                                                              4),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'postPage',
                                                                            queryParams:
                                                                                {
                                                                              'postId': serializeParam(
                                                                                columnScrollPostsRecord.postID,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 4),
                                                                                        child: Text(
                                                                                          columnScrollPostsRecord.postTitle!.maybeHandleOverflow(maxChars: 30),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Noto Kufi Arabic',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 14,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
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
                                                                                                          postRefForBottomSheet: columnScrollPostsRecord.reference,
                                                                                                          userRefForBottomSheet: columnScrollPostsRecord.postUser,
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
                                                                                        columnScrollPostsRecord.postType!,
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
                                                                                            columnScrollPostsRecord.timePosted!,
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
                                                                                  Divider(),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 4),
                                                                                    child: Text(
                                                                                      columnScrollPostsRecord.postDescription!.maybeHandleOverflow(maxChars: 40),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Noto Kufi Arabic',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 12,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  if (columnScrollPostsRecord.postPhoto!.toList().length != 0)
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final photosMyPost = columnScrollPostsRecord.postPhoto!.toList().take(3).toList();
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: List.generate(photosMyPost.length, (photosMyPostIndex) {
                                                                                            final photosMyPostItem = photosMyPost[photosMyPostIndex];
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
                                                                                                  imageUrl: photosMyPostItem,
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
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                    child: Container(
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
                                                                                                            columnScrollPostsRecord.price!.toString(),
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
                                                                                                            columnScrollPostsRecord.priceType!,
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
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
                                                                                                                  queryBuilder: (commentsRecord) => commentsRecord.where('commented_post', isEqualTo: columnScrollPostsRecord.reference),
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
                                                                                                                    final likedByUpdate = columnScrollPostsRecord.likedBy!.toList().contains(likedByElement) ? FieldValue.arrayRemove([likedByElement]) : FieldValue.arrayUnion([likedByElement]);
                                                                                                                    final postsUpdateData = {
                                                                                                                      'liked_by': likedByUpdate,
                                                                                                                    };
                                                                                                                    await columnScrollPostsRecord.reference.update(postsUpdateData);
                                                                                                                  },
                                                                                                                  value: columnScrollPostsRecord.likedBy!.toList().contains(currentUserReference),
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
                                                                                                                    if (columnScrollPostsRecord.likedBy!.toList().contains(currentUserReference)) {
                                                                                                                      final postsUpdateData = {
                                                                                                                        'liked_by': FieldValue.arrayRemove([currentUserReference]),
                                                                                                                      };
                                                                                                                      await columnScrollPostsRecord.reference.update(postsUpdateData);

                                                                                                                      final usersUpdateData = {
                                                                                                                        'liked_posts': FieldValue.arrayRemove([columnScrollPostsRecord.reference]),
                                                                                                                      };
                                                                                                                      await myProfilePageUsersRecord.reference.update(usersUpdateData);
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
                                                                                                                      await columnScrollPostsRecord.reference.update(postsUpdateData);

                                                                                                                      final usersUpdateData = {
                                                                                                                        'liked_posts': FieldValue.arrayUnion([columnScrollPostsRecord.reference]),
                                                                                                                      };
                                                                                                                      await myProfilePageUsersRecord.reference.update(usersUpdateData);
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
                                                                                                                  columnScrollPostsRecord.likedBy!.toList().length,
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
                                                                                                ),
                                                                                                Divider(
                                                                                                  thickness: 2,
                                                                                                  indent: 10,
                                                                                                  endIndent: 10,
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
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
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'containerOnPageLoadAnimation1']!);
                                                                },
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.provider,
                                                      false) ==
                                                  false)
                                                AuthUserStreamWidget(
                                                  child: StreamBuilder<
                                                      List<RequestPostRecord>>(
                                                    stream:
                                                        queryRequestPostRecord(
                                                      queryBuilder: (requestPostRecord) =>
                                                          requestPostRecord
                                                              .where(
                                                                  'post_user',
                                                                  isEqualTo:
                                                                      myProfilePageUsersRecord
                                                                          .reference)
                                                              .orderBy(
                                                                  'time_posted',
                                                                  descending:
                                                                      true),
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
                                                      List<RequestPostRecord>
                                                          columnScrollRequestPostRecordList =
                                                          snapshot.data!;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnScrollRequestPostRecordList
                                                                  .length,
                                                              (columnScrollIndex) {
                                                            final columnScrollRequestPostRecord =
                                                                columnScrollRequestPostRecordList[
                                                                    columnScrollIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          5,
                                                                          15),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      PostsRecord>>(
                                                                stream:
                                                                    queryPostsRecord(),
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
                                                                  List<PostsRecord>
                                                                      socialPostPostsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              4,
                                                                              4,
                                                                              4),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'postPage',
                                                                            queryParams:
                                                                                {
                                                                              'postId': serializeParam(
                                                                                columnScrollRequestPostRecord.postID,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 4),
                                                                                        child: Text(
                                                                                          columnScrollRequestPostRecord.postTitle!.maybeHandleOverflow(maxChars: 30),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Noto Kufi Arabic',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 14,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Container(
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
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        columnScrollRequestPostRecord.postType!,
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
                                                                                            columnScrollRequestPostRecord.timePosted!,
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
                                                                                  Divider(),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 4),
                                                                                    child: Text(
                                                                                      columnScrollRequestPostRecord.postDescription!.maybeHandleOverflow(maxChars: 40),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Noto Kufi Arabic',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 12,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  if (columnScrollRequestPostRecord.postPhoto!.toList().length != 0)
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final photosMyPost = columnScrollRequestPostRecord.postPhoto!.toList().take(3).toList();
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: List.generate(photosMyPost.length, (photosMyPostIndex) {
                                                                                            final photosMyPostItem = photosMyPost[photosMyPostIndex];
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
                                                                                                  imageUrl: photosMyPostItem,
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
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                    child: Container(
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
                                                                                                            columnScrollRequestPostRecord.price!.toString(),
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
                                                                                                            columnScrollRequestPostRecord.priceType!,
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
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
                                                                                                                  queryBuilder: (commentsRecord) => commentsRecord.where('commented_request_post', isEqualTo: columnScrollRequestPostRecord.reference),
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
                                                                                                                    final likedByUpdate = columnScrollRequestPostRecord.likedBy!.toList().contains(likedByElement) ? FieldValue.arrayRemove([likedByElement]) : FieldValue.arrayUnion([likedByElement]);
                                                                                                                    final requestPostUpdateData = {
                                                                                                                      'liked_by': likedByUpdate,
                                                                                                                    };
                                                                                                                    await columnScrollRequestPostRecord.reference.update(requestPostUpdateData);
                                                                                                                  },
                                                                                                                  value: columnScrollRequestPostRecord.likedBy!.toList().contains(currentUserReference),
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
                                                                                                                    if (columnScrollRequestPostRecord.likedBy!.toList().contains(currentUserReference)) {
                                                                                                                      final requestPostUpdateData = {
                                                                                                                        'liked_by': FieldValue.arrayRemove([currentUserReference]),
                                                                                                                      };
                                                                                                                      await columnScrollRequestPostRecord.reference.update(requestPostUpdateData);

                                                                                                                      final usersUpdateData = {
                                                                                                                        'liked_request_posts': FieldValue.arrayRemove([columnScrollRequestPostRecord.reference]),
                                                                                                                      };
                                                                                                                      await myProfilePageUsersRecord.reference.update(usersUpdateData);
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
                                                                                                                      await columnScrollRequestPostRecord.reference.update(requestPostUpdateData);

                                                                                                                      final usersUpdateData = {
                                                                                                                        'liked_request_posts': FieldValue.arrayUnion([columnScrollRequestPostRecord.reference]),
                                                                                                                      };
                                                                                                                      await myProfilePageUsersRecord.reference.update(usersUpdateData);
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
                                                                                                                  columnScrollRequestPostRecord.likedBy!.toList().length,
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
                                                                                                ),
                                                                                                Divider(
                                                                                                  thickness: 2,
                                                                                                  indent: 10,
                                                                                                  endIndent: 10,
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
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
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'containerOnPageLoadAnimation2']!);
                                                                },
                                                              ),
                                                            );
                                                          }),
                                                        ),
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
                                              queryBuilder: (postsRecord) =>
                                                  postsRecord.where('liked_by',
                                                      arrayContains:
                                                          myProfilePageUsersRecord
                                                              .reference),
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
                                                  columnScroll2PostsRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnScroll2PostsRecordList
                                                          .length,
                                                      (columnScroll2Index) {
                                                    final columnScroll2PostsRecord =
                                                        columnScroll2PostsRecordList[
                                                            columnScroll2Index];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 15),
                                                      child: StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(
                                                                columnScroll2PostsRecord
                                                                    .postUser!),
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
                                                          final socialPostUsersRecord =
                                                              snapshot.data!;
                                                          return Container(
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
                                                              child: Column(
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
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                'UserProfilePage',
                                                                                queryParams: {
                                                                                  'userInfo': serializeParam(
                                                                                    columnScroll2PostsRecord.postUser,
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
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                        width: 2,
                                                                                      ),
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0, 0.050000000000000044),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        if (currentUserPhoto != null && currentUserPhoto != '')
                                                                                          AuthUserStreamWidget(
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(1000),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: socialPostUsersRecord.photoUrl != null && socialPostUsersRecord.photoUrl != '' ? (socialPostUsersRecord.photoUrl != '' ? socialPostUsersRecord.photoUrl! : ' ') : ' ',
                                                                                                width: 100,
                                                                                                height: 100,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        if (() {
                                                                                          if (socialPostUsersRecord.photoUrl != null && socialPostUsersRecord.photoUrl != '' ? (socialPostUsersRecord.photoUrl == '') : false) {
                                                                                            return true;
                                                                                          } else if (socialPostUsersRecord.photoUrl == null || socialPostUsersRecord.photoUrl == '') {
                                                                                            return true;
                                                                                          } else {
                                                                                            return false;
                                                                                          }
                                                                                        }())
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0, 0.05),
                                                                                            child: Icon(
                                                                                              Icons.person_rounded,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 24,
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12, 4, 0, 4),
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                                                                                              child: Icon(
                                                                                                Icons.star_rate_rounded,
                                                                                                color: Color(0xFFFF8E00),
                                                                                                size: 24,
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                              child: StreamBuilder<List<ReveiwsRecord>>(
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
                                                                                                    formatNumber(
                                                                                                      functions.rating(textReveiwsRecordList.map((e) => e.rating!).toList()),
                                                                                                      formatType: FormatType.compactLong,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Noto Kufi Arabic',
                                                                                                          fontSize: 14,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
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
                                                                                                                postRefForBottomSheet: columnScroll2PostsRecord.reference,
                                                                                                                userRefForBottomSheet: socialPostUsersRecord.reference,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => setState(() {}));
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 27,
                                                                                                      height: 27,
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
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                columnScroll2PostsRecord.postType!,
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
                                                                                                    columnScroll2PostsRecord.timePosted!,
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
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
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
                                                                              columnScroll2PostsRecord.postID,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
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
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                4,
                                                                                4,
                                                                                10),
                                                                            child:
                                                                                Text(
                                                                              columnScroll2PostsRecord.postTitle!,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Noto Kufi Arabic',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (columnScroll2PostsRecord.postPhoto!.toList().length !=
                                                                              0)
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final postPhotos = columnScroll2PostsRecord.postPhoto!.toList().take(3).toList();
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
                                                                          Divider(),
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
                                                                                                columnScroll2PostsRecord.price!.toString(),
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
                                                                                                columnScroll2PostsRecord.priceType!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Noto Kufi Arabic',
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
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
                                                                                                          queryBuilder: (commentsRecord) => commentsRecord.where('commented_post', isEqualTo: columnScroll2PostsRecord.reference),
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
                                                                                                            final likedByUpdate = columnScroll2PostsRecord.likedBy!.toList().contains(likedByElement) ? FieldValue.arrayRemove([likedByElement]) : FieldValue.arrayUnion([likedByElement]);
                                                                                                            final postsUpdateData = {
                                                                                                              'liked_by': likedByUpdate,
                                                                                                            };
                                                                                                            await columnScroll2PostsRecord.reference.update(postsUpdateData);
                                                                                                          },
                                                                                                          value: columnScroll2PostsRecord.likedBy!.toList().contains(currentUserReference),
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
                                                                                                            if (columnScroll2PostsRecord.likedBy!.toList().contains(currentUserReference)) {
                                                                                                              final postsUpdateData = {
                                                                                                                'liked_by': FieldValue.arrayRemove([currentUserReference]),
                                                                                                              };
                                                                                                              await columnScroll2PostsRecord.reference.update(postsUpdateData);

                                                                                                              final usersUpdateData = {
                                                                                                                'liked_posts': FieldValue.arrayRemove([
                                                                                                                  columnScroll2PostsRecord.reference
                                                                                                                ]),
                                                                                                              };
                                                                                                              await myProfilePageUsersRecord.reference.update(usersUpdateData);
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
                                                                                                              await columnScroll2PostsRecord.reference.update(postsUpdateData);

                                                                                                              final usersUpdateData = {
                                                                                                                'liked_posts': FieldValue.arrayUnion([
                                                                                                                  columnScroll2PostsRecord.reference
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
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          formatNumber(
                                                                                                            columnScroll2PostsRecord.likedBy!.toList().length,
                                                                                                            formatType: FormatType.compact,
                                                                                                          ),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'Noto Kufi Arabic',
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
                                                                                        Divider(
                                                                                          thickness: 2,
                                                                                          indent: 10,
                                                                                          endIndent: 10,
                                                                                          color: FlutterFlowTheme.of(context).alternate,
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
                                                                ],
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation3']!);
                                                        },
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => StreamBuilder<
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                    listViewRequestPostRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewRequestPostRecord =
                                                      listViewRequestPostRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 5, 15),
                                                    child: StreamBuilder<
                                                        UsersRecord>(
                                                      stream: UsersRecord
                                                          .getDocument(
                                                              listViewRequestPostRecord
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
                                                          onLongPress:
                                                              () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
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
                                                                setState(
                                                                    () {}));
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                  final columnUsersRecord = columnUsersRecordList
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                              child: StreamBuilder<UsersRecord>(
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
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                                    width: 100,
                                                                                                    height: 100,
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
                                                                                                    width: 100,
                                                                                                    height: 100,
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'postPage',
                                                                                  queryParams: {
                                                                                    'postId': serializeParam(
                                                                                      listViewRequestPostRecord.postID,
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
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 10),
                                                                                    child: Text(
                                                                                      listViewRequestPostRecord.postTitle!,
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
                                                                                  if (listViewRequestPostRecord.postPhoto!.toList().length != 0)
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                              child: Container(
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
                                                                                          Divider(
                                                                                            thickness: 2,
                                                                                            indent: 10,
                                                                                            endIndent: 10,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
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
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation4']!);
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => StreamBuilder<
                                              List<ReveiwsRecord>>(
                                            stream: queryReveiwsRecord(
                                              queryBuilder: (reveiwsRecord) =>
                                                  reveiwsRecord
                                                      .where('reviewed_person',
                                                          isEqualTo:
                                                              myProfilePageUsersRecord
                                                                          .uid !=
                                                                      ''
                                                                  ? myProfilePageUsersRecord
                                                                      .uid
                                                                  : null)
                                                      .orderBy('created_at',
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
                                              List<ReveiwsRecord>
                                                  columnScroll3ReveiwsRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      columnScroll3ReveiwsRecordList
                                                          .length,
                                                      (columnScroll3Index) {
                                                    final columnScroll3ReveiwsRecord =
                                                        columnScroll3ReveiwsRecordList[
                                                            columnScroll3Index];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 0),
                                                      child: StreamBuilder<
                                                          ReveiwsRecord>(
                                                        stream: ReveiwsRecord
                                                            .getDocument(
                                                                columnScroll3ReveiwsRecord
                                                                    .reference),
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
                                                          final reviewCardReveiwsRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
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
                                                                  UsersRecord>(
                                                                stream: UsersRecord
                                                                    .getDocument(
                                                                        columnScroll3ReveiwsRecord
                                                                            .reviewedByRef!),
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
                                                                  final columnUsersRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            12,
                                                                            16,
                                                                            4),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                              child: Stack(
                                                                                children: [
                                                                                  if (columnUsersRecord.photoUrl != null && columnUsersRecord.photoUrl != '')
                                                                                    Container(
                                                                                      width: 50,
                                                                                      height: 50,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        image: DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: Image.network(
                                                                                            columnUsersRecord.photoUrl!,
                                                                                          ).image,
                                                                                        ),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                  if (columnUsersRecord.photoUrl == null || columnUsersRecord.photoUrl == '')
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0, 0),
                                                                                      child: Container(
                                                                                        width: 50,
                                                                                        height: 50,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(-0.050000000000000044, 0.050000000000000044),
                                                                                        child: Visibility(
                                                                                          visible: columnUsersRecord.photoUrl == null || columnUsersRecord.photoUrl == '',
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0, 0),
                                                                                            child: Icon(
                                                                                              Icons.person_rounded,
                                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                              size: 24,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
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
                                                                                      StreamBuilder<List<UsersRecord>>(
                                                                                        stream: queryUsersRecord(
                                                                                          queryBuilder: (usersRecord) => usersRecord.where('uid', isEqualTo: reviewCardReveiwsRecord.reviewedPerson),
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
                                                                                          List<UsersRecord> textUsersRecordList = snapshot.data!;
                                                                                          // Return an empty Container when the item does not exist.
                                                                                          if (snapshot.data!.isEmpty) {
                                                                                            return Container();
                                                                                          }
                                                                                          final textUsersRecord = textUsersRecordList.isNotEmpty ? textUsersRecordList.first : null;
                                                                                          return Text(
                                                                                            columnUsersRecord.displayName!,
                                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  fontSize: 18,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          );
                                                                                        },
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
                                                                                            dateTimeFormat(
                                                                                              'relative',
                                                                                              reviewCardReveiwsRecord.createdAt!,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Noto Kufi Arabic',
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                  fontSize: 14,
                                                                                                ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10, 4, 0, 4),
                                                                                        child: StreamBuilder<List<ReveiwsRecord>>(
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
                                                                                            List<ReveiwsRecord> ratingBarReveiwsRecordList = snapshot.data!;
                                                                                            return RatingBarIndicator(
                                                                                              itemBuilder: (context, index) => Icon(
                                                                                                Icons.star_rounded,
                                                                                                color: Color(0xFFFFA130),
                                                                                              ),
                                                                                              direction: Axis.horizontal,
                                                                                              rating: reviewCardReveiwsRecord.rating!,
                                                                                              unratedColor: Color(0xFF95A1AC),
                                                                                              itemCount: 5,
                                                                                              itemSize: 18,
                                                                                            );
                                                                                          },
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
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: SelectionArea(
                                                                            child: Text(
                                                                          columnScroll3ReveiwsRecord
                                                                              .reviewText!,
                                                                          maxLines:
                                                                              35,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        )),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation5']!);
                                                        },
                                                      ),
                                                    );
                                                  }),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
