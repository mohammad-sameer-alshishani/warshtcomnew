import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ChangeToProviderWidget extends StatefulWidget {
  const ChangeToProviderWidget({Key? key}) : super(key: key);

  @override
  _ChangeToProviderWidgetState createState() => _ChangeToProviderWidgetState();
}

class _ChangeToProviderWidgetState extends State<ChangeToProviderWidget> {
  String? choseLocationProviderValue;
  String? providerGenderValue;
  TextEditingController? providerNameController;
  TextEditingController? providerWorkController;
  TextEditingController? providerBioController;
  TextEditingController? providerNumberController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    providerBioController = TextEditingController();
    providerNameController = TextEditingController();
    providerWorkController = TextEditingController();
    providerNumberController = TextEditingController();
  }

  @override
  void dispose() {
    providerBioController?.dispose();
    providerNameController?.dispose();
    providerWorkController?.dispose();
    providerNumberController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 1000));
            },
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                SelectionArea(
                    child: GradientText(
                  'تجسيل الحساب كمزود خدمة ',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Noto Kufi Arabic',
                        fontSize: 20,
                      ),
                  colors: [
                    FlutterFlowTheme.of(context).tertiaryColor,
                    FlutterFlowTheme.of(context).secondaryText
                  ],
                  gradientDirection: GradientDirection.ltr,
                  gradientType: GradientType.linear,
                )),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
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
                          borderRadius: BorderRadius.circular(45),
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
                    padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
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
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> providerGenderUsersRecordList =
                            snapshot.data!;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final providerGenderUsersRecord =
                            providerGenderUsersRecordList.isNotEmpty
                                ? providerGenderUsersRecordList.first
                                : null;
                        return FlutterFlowChoiceChips(
                          initiallySelected: ['ذكر'],
                          options: [
                            ChipData('ذكر', FontAwesomeIcons.male),
                            ChipData('أنثى', FontAwesomeIcons.female)
                          ],
                          onChanged: (val) async {
                            setState(() => providerGenderValue = val?.first);
                            final usersUpdateData = createUsersRecordData(
                              userGender: providerGenderValue,
                            );
                            await currentUserReference!.update(usersUpdateData);
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Noto Kufi Arabic',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            iconSize: 18,
                            elevation: 4,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Noto Kufi Arabic',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                            iconColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            iconSize: 18,
                            elevation: 0,
                          ),
                          chipSpacing: 20,
                          multiselect: false,
                          initialized: providerGenderValue != null,
                          alignment: WrapAlignment.start,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 10, 40, 5),
                  child: TextFormField(
                    controller: providerNameController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'providerNameController',
                      Duration(milliseconds: 2000),
                      () async {
                        final usersUpdateData = createUsersRecordData(
                          displayName: providerNameController!.text,
                        );
                        await currentUserReference!.update(usersUpdateData);
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'اسم المستخدم',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
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
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryColor,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 10, 40, 5),
                  child: TextFormField(
                    controller: providerWorkController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'providerWorkController',
                      Duration(milliseconds: 2000),
                      () async {
                        final usersUpdateData = createUsersRecordData(
                          userWork: providerWorkController!.text,
                        );
                        await currentUserReference!.update(usersUpdateData);
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'المهنة',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
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
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryColor,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 10, 40, 5),
                  child: TextFormField(
                    controller: providerBioController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'providerBioController',
                      Duration(milliseconds: 2000),
                      () async {
                        final usersUpdateData = createUsersRecordData(
                          userBio: providerBioController!.text,
                        );
                        await currentUserReference!.update(usersUpdateData);
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'الوصف',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
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
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryColor,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 5, 40, 5),
                  child: TextFormField(
                    controller: providerNumberController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'providerNumberController',
                      Duration(milliseconds: 2000),
                      () async {
                        final usersUpdateData = createUsersRecordData(
                          phoneNumber: providerNumberController!.text,
                        );
                        await currentUserReference!.update(usersUpdateData);
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
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
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryColor,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          fontWeight: FontWeight.w500,
                        ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 5, 40, 5),
                  child: FlutterFlowDropDown(
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
                      setState(() => choseLocationProviderValue = val);
                      final usersUpdateData = createUsersRecordData(
                        userLocation: choseLocationProviderValue,
                      );
                      await currentUserReference!.update(usersUpdateData);
                    },
                    width: 180,
                    height: 65,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w500,
                        ),
                    hintText: 'اختر مدينتك ...',
                    fillColor: FlutterFlowTheme.of(context).secondaryColor,
                    elevation: 2,
                    borderColor: Color(0x00FFFFFF),
                    borderWidth: 0,
                    borderRadius: 10,
                    margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    hidesUnderline: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(100, 10, 100, 10),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if ((providerNameController!.text != null &&
                              providerNameController!.text != '') &&
                          (providerWorkController!.text != null &&
                              providerWorkController!.text != '') &&
                          (providerBioController!.text != null &&
                              providerBioController!.text != '') &&
                          (providerBioController!.text != null &&
                              providerBioController!.text != '') &&
                          (choseLocationProviderValue != null &&
                              choseLocationProviderValue != '')) {
                        final usersUpdateData = createUsersRecordData(
                          provider: true,
                        );
                        await currentUserReference!.update(usersUpdateData);

                        context.pushNamed('HomePage');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'يرجى اكمال جميع المطلوبات',
                              style: TextStyle(
                                color: Color(0xFF9A1414),
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryColor,
                          ),
                        );
                      }
                    },
                    text: 'انشاء حسابي',
                    options: FFButtonOptions(
                      width: 10,
                      height: 50,
                      color: Color(0x00EEEEEE),
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Noto Kufi Arabic',
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
