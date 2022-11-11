import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateUserPageWidget extends StatefulWidget {
  const CreateUserPageWidget({
    Key? key,
    this.createUserRef,
  }) : super(key: key);

  final DocumentReference? createUserRef;

  @override
  _CreateUserPageWidgetState createState() => _CreateUserPageWidgetState();
}

class _CreateUserPageWidgetState extends State<CreateUserPageWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  String? providerGenderValue;
  TextEditingController? providerNameController;
  TextEditingController? providerWorkController;
  TextEditingController? providerBioController;
  TextEditingController? providerNumberController;
  LatLng? googleMapProvidersCenter;
  final googleMapProvidersController = Completer<GoogleMapController>();
  String? choseLocationProviderValue;
  bool? checkboxValue;
  LatLng? googleMapUsersCenter;
  final googleMapUsersController = Completer<GoogleMapController>();
  String? userGenderValue;
  TextEditingController? userNameController;
  String? choseLocationUserValue;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    providerBioController = TextEditingController();
    providerNameController = TextEditingController();
    providerWorkController = TextEditingController();
    providerNumberController = TextEditingController();
    userNameController = TextEditingController();
  }

  @override
  void dispose() {
    providerBioController?.dispose();
    providerNameController?.dispose();
    providerWorkController?.dispose();
    providerNumberController?.dispose();
    userNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(35, 15, 35, 5),
                    child: Image.asset(
                      'assets/images/WarshatcomIntro.png',
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              Divider(
                height: 2,
                thickness: 1,
                indent: 50,
                endIndent: 50,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              SelectionArea(
                  child: Text(
                'إنشاء حساب كــ',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Noto Kufi Arabic',
                      fontSize: 30,
                    ),
              )),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Noto Kufi Arabic',
                                  fontSize: 18,
                                ),
                        indicatorColor:
                            FlutterFlowTheme.of(context).primaryColor,
                        tabs: [
                          Tab(
                            text: 'مزود خدمة',
                          ),
                          Tab(
                            text: 'باحث عن خدمة',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));
                                },
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 10),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0x00376280),
                                              width: 5,
                                            ),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: AuthUserStreamWidget(
                                            child: InkWell(
                                              onTap: () async {
                                                final selectedMedia =
                                                    await selectMedia(
                                                  imageQuality: 100,
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                  multiImage: false,
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
                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
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
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(45),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    currentUserPhoto,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/u445vifv2ogw/Photo_1667408356874.png',
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 0, 0, 0),
                                        child: StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(
                                            singleRecord: true,
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
                                            List<UsersRecord>
                                                providerGenderUsersRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the document does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final providerGenderUsersRecord =
                                                providerGenderUsersRecordList
                                                        .isNotEmpty
                                                    ? providerGenderUsersRecordList
                                                        .first
                                                    : null;
                                            return FlutterFlowChoiceChips(
                                              initiallySelected: ['ذكر'],
                                              options: [
                                                ChipData('ذكر',
                                                    FontAwesomeIcons.male),
                                                ChipData('أنثى',
                                                    FontAwesomeIcons.female)
                                              ],
                                              onChanged: (val) async {
                                                setState(() =>
                                                    providerGenderValue =
                                                        val?.first);
                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  userGender:
                                                      providerGenderValue,
                                                );
                                                await currentUserReference!
                                                    .update(usersUpdateData);
                                              },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                iconSize: 18,
                                                elevation: 4,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Noto Kufi Arabic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                iconSize: 18,
                                                elevation: 0,
                                              ),
                                              chipSpacing: 20,
                                              multiselect: false,
                                              initialized:
                                                  providerGenderValue != null,
                                              alignment: WrapAlignment.start,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 10, 40, 5),
                                      child: TextFormField(
                                        controller: providerNameController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          'providerNameController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            final usersUpdateData =
                                                createUsersRecordData(
                                              displayName:
                                                  providerNameController!.text,
                                            );
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'اسم المستخدم',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
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
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 10, 40, 5),
                                      child: TextFormField(
                                        controller: providerWorkController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          'providerWorkController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            final usersUpdateData =
                                                createUsersRecordData(
                                              userWork:
                                                  providerWorkController!.text,
                                            );
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'المهنة',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
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
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 10, 40, 5),
                                      child: TextFormField(
                                        controller: providerBioController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          'providerBioController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            final usersUpdateData =
                                                createUsersRecordData(
                                              userBio:
                                                  providerBioController!.text,
                                            );
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'الوصف',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
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
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 5, 40, 5),
                                      child: TextFormField(
                                        controller: providerNumberController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          'providerNumberController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            final usersUpdateData =
                                                createUsersRecordData(
                                              phoneNumber:
                                                  providerNumberController!
                                                      .text,
                                            );
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'رقم الهاتف',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
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
                                              fontWeight: FontWeight.w500,
                                            ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 10, 40, 10),
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: FlutterFlowGoogleMap(
                                          controller:
                                              googleMapProvidersController,
                                          onCameraIdle: (latLng) =>
                                              googleMapProvidersCenter = latLng,
                                          initialLocation:
                                              googleMapProvidersCenter ??=
                                                  currentUserLocationValue!,
                                          markerColor: GoogleMarkerColor.violet,
                                          mapType: MapType.terrain,
                                          style: GoogleMapStyle.standard,
                                          initialZoom: 14,
                                          allowInteraction: true,
                                          allowZoom: true,
                                          showZoomControls: true,
                                          showLocation: true,
                                          showCompass: false,
                                          showMapToolbar: false,
                                          showTraffic: false,
                                          centerMapOnMarkerTap: true,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 5, 40, 5),
                                      child: FlutterFlowDropDown(
                                        initialOption:
                                            choseLocationProviderValue ??=
                                                googleMapProvidersCenter
                                                    ?.toString(),
                                        options: [
                                          'عمان',
                                          'الزرقاء',
                                          'اربد',
                                          'عجلون',
                                          'جرش',
                                          'المفرق',
                                          'البلقاء',
                                          'مادبا',
                                          'الكرك',
                                          'الطفيلة',
                                          'العقبة',
                                          'معان'
                                        ],
                                        onChanged: (val) async {
                                          setState(() =>
                                              choseLocationProviderValue = val);
                                          final usersUpdateData =
                                              createUsersRecordData(
                                            userLocation:
                                                choseLocationProviderValue,
                                          );
                                          await currentUserReference!
                                              .update(usersUpdateData);
                                        },
                                        width: 180,
                                        height: 65,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Noto Kufi Arabic',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'اختر مدينتك ...',
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        elevation: 2,
                                        borderColor: Color(0x00FFFFFF),
                                        borderWidth: 0,
                                        borderRadius: 10,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        hidesUnderline: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 10, 40, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                            child: Checkbox(
                                              value: checkboxValue ??= true,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                    checkboxValue = newValue!);
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                            ),
                                          ),
                                          SelectionArea(
                                              child: Text(
                                            'تمتلك سيارة ؟',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          )),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.05, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if ((providerNameController!.text != null && providerNameController!.text != '') &&
                                                (providerWorkController!.text !=
                                                        null &&
                                                    providerWorkController!
                                                            .text !=
                                                        '') &&
                                                (providerBioController!.text !=
                                                        null &&
                                                    providerBioController!
                                                            .text !=
                                                        '') &&
                                                (providerBioController!.text !=
                                                        null &&
                                                    providerBioController!
                                                            .text !=
                                                        '') &&
                                                (choseLocationProviderValue !=
                                                        null &&
                                                    choseLocationProviderValue !=
                                                        '')) {
                                              final usersUpdateData =
                                                  createUsersRecordData(
                                                provider: true,
                                                isGuest: false,
                                                ownsCar: checkboxValue,
                                              );
                                              await currentUserReference!
                                                  .update(usersUpdateData);
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed('HomePage');
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'يرجى اكمال جميع المطلوبات',
                                                    style: TextStyle(
                                                      color: Color(0xFF9A1414),
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                ),
                                              );
                                            }
                                          },
                                          text: 'انشاء حسابي',
                                          options: FFButtonOptions(
                                            width: 150,
                                            height: 50,
                                            color: Color(0x00EEEEEE),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily:
                                                          'Noto Kufi Arabic',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
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
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 10),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0x00376280),
                                            width: 5,
                                          ),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: AuthUserStreamWidget(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(45),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                currentUserPhoto,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/warshtcomnew-apn0sl/assets/u445vifv2ogw/Photo_1667408356874.png',
                                              ),
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 0, 0),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          singleRecord: true,
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
                                          List<UsersRecord>
                                              userGenderUsersRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the document does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final userGenderUsersRecord =
                                              userGenderUsersRecordList
                                                      .isNotEmpty
                                                  ? userGenderUsersRecordList
                                                      .first
                                                  : null;
                                          return FlutterFlowChoiceChips(
                                            initiallySelected: ['ذكر'],
                                            options: [
                                              ChipData(
                                                  'ذكر', FontAwesomeIcons.male),
                                              ChipData('أنثى',
                                                  FontAwesomeIcons.female)
                                            ],
                                            onChanged: (val) async {
                                              setState(() =>
                                                  userGenderValue = val?.first);
                                              final usersUpdateData =
                                                  createUsersRecordData(
                                                userGender: userGenderValue,
                                              );
                                              await currentUserReference!
                                                  .update(usersUpdateData);
                                            },
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
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
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              iconSize: 18,
                                              elevation: 4,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Noto Kufi Arabic',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              iconSize: 18,
                                              elevation: 0,
                                            ),
                                            chipSpacing: 20,
                                            multiselect: false,
                                            initialized:
                                                userGenderValue != null,
                                            alignment: WrapAlignment.start,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40, 10, 40, 5),
                                    child: TextFormField(
                                      controller: userNameController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'userNameController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          final usersUpdateData =
                                              createUsersRecordData(
                                            displayName:
                                                userNameController!.text,
                                          );
                                          await currentUserReference!
                                              .update(usersUpdateData);
                                        },
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'اسم المستخدم',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
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
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Noto Kufi Arabic',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40, 10, 40, 10),
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(),
                                      child: FlutterFlowGoogleMap(
                                        controller: googleMapUsersController,
                                        onCameraIdle: (latLng) =>
                                            googleMapUsersCenter = latLng,
                                        initialLocation:
                                            googleMapUsersCenter ??=
                                                currentUserLocationValue!,
                                        markerColor: GoogleMarkerColor.violet,
                                        mapType: MapType.terrain,
                                        style: GoogleMapStyle.standard,
                                        initialZoom: 14,
                                        allowInteraction: true,
                                        allowZoom: true,
                                        showZoomControls: true,
                                        showLocation: true,
                                        showCompass: false,
                                        showMapToolbar: false,
                                        showTraffic: false,
                                        centerMapOnMarkerTap: true,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40, 5, 40, 5),
                                    child: FlutterFlowDropDown(
                                      initialOption: choseLocationUserValue ??=
                                          googleMapUsersCenter?.toString(),
                                      options: [
                                        'عمان',
                                        'الزرقاء',
                                        'اربد',
                                        'عجلون',
                                        'جرش',
                                        'المفرق',
                                        'البلقاء',
                                        'مادبا',
                                        'الكرك',
                                        'الطفيلة',
                                        'العقبة',
                                        'معان'
                                      ],
                                      onChanged: (val) async {
                                        setState(
                                            () => choseLocationUserValue = val);
                                        final usersUpdateData =
                                            createUsersRecordData(
                                          userLocation: choseLocationUserValue,
                                        );
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                      },
                                      width: 180,
                                      height: 65,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Noto Kufi Arabic',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      hintText: 'اختر مدينتك ...',
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      elevation: 2,
                                      borderColor: Color(0x00FFFFFF),
                                      borderWidth: 0,
                                      borderRadius: 10,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      hidesUnderline: true,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 20),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if ((userNameController!.text !=
                                                      null &&
                                                  userNameController!.text !=
                                                      '') &&
                                              (choseLocationUserValue != null &&
                                                  choseLocationUserValue !=
                                                      '')) {
                                            final usersUpdateData =
                                                createUsersRecordData(
                                              provider: false,
                                              isGuest: false,
                                            );
                                            await currentUserReference!
                                                .update(usersUpdateData);

                                            context.pushNamed('HomePage');
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'يرجى اكمال جميع المطلوبات',
                                                  style: TextStyle(
                                                    color: Color(0xFF9A1414),
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            );
                                          }
                                        },
                                        text: 'انشاء حسابي',
                                        options: FFButtonOptions(
                                          width: 150,
                                          height: 50,
                                          color: Color(0x00EEEEEE),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Noto Kufi Arabic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
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
    );
  }
}
