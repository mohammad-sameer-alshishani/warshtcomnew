import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String? choiceChipsValue1;
  String? choiceChipsValue2;
  String? choiceChipsValue3;
  bool? haveCarValue;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'الوظيفة',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18,
                        ),
                  ),
                ),
                FlutterFlowChoiceChips(
                  initiallySelected: [
                    FFAppState().filterByWork != null &&
                            FFAppState().filterByWork != ''
                        ? FFAppState().filterByWork
                        : 'نجار'
                  ],
                  options: FFAppState()
                      .jobsTypes
                      .map((label) => ChipData(label))
                      .toList(),
                  onChanged: (val) async {
                    setState(() => choiceChipsValue1 = val?.first);
                    setState(() {
                      FFAppState().filterByWork = choiceChipsValue1!;
                    });
                  },
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    iconColor: Colors.white,
                    iconSize: 18,
                    elevation: 4,
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    iconColor: Color(0xFF323B45),
                    iconSize: 18,
                    elevation: 4,
                  ),
                  chipSpacing: 15,
                  multiselect: false,
                  initialized: choiceChipsValue1 != null,
                  alignment: WrapAlignment.start,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                  child: Text(
                    'المدينة',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          fontSize: 18,
                        ),
                  ),
                ),
                FlutterFlowChoiceChips(
                  initiallySelected: [
                    FFAppState().filterByCities != null &&
                            FFAppState().filterByCities != ''
                        ? FFAppState().filterByCities
                        : 'عمان'
                  ],
                  options: FFAppState()
                      .cities
                      .map((label) => ChipData(label))
                      .toList(),
                  onChanged: (val) async {
                    setState(() => choiceChipsValue2 = val?.first);
                    setState(() {
                      FFAppState().filterByCities = choiceChipsValue2!;
                    });
                  },
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    iconColor: Colors.white,
                    iconSize: 18,
                    elevation: 4,
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    iconColor: Color(0xFF323B45),
                    iconSize: 18,
                    elevation: 4,
                  ),
                  chipSpacing: 15,
                  multiselect: false,
                  initialized: choiceChipsValue2 != null,
                  alignment: WrapAlignment.start,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                  child: Text(
                    'التقييم',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          fontSize: 18,
                        ),
                  ),
                ),
                FlutterFlowChoiceChips(
                  options: [
                    ChipData('0', Icons.star_rate_rounded),
                    ChipData('1', Icons.star_rate_rounded),
                    ChipData('2', Icons.star_rate_rounded),
                    ChipData('3', Icons.star_rate_rounded),
                    ChipData('4', Icons.star_rate_rounded),
                    ChipData('5', Icons.star_rate_rounded)
                  ],
                  onChanged: (val) async {
                    setState(() => choiceChipsValue3 = val?.first);
                    setState(() {
                      FFAppState().filterByCities = choiceChipsValue3!;
                    });
                  },
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    iconColor: Colors.white,
                    iconSize: 18,
                    elevation: 4,
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    iconColor: Color(0xFF323B45),
                    iconSize: 18,
                    elevation: 4,
                  ),
                  chipSpacing: 15,
                  multiselect: false,
                  alignment: WrapAlignment.start,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'يمتلك سيارة',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Noto Kufi Arabic',
                              fontSize: 18,
                            ),
                      ),
                    ),
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        unselectedWidgetColor: Color(0xFFF5F5F5),
                      ),
                      child: Checkbox(
                        value: haveCarValue ??= false,
                        onChanged: (newValue) async {
                          setState(() => haveCarValue = newValue!);
                          if (newValue!) {
                            setState(() {
                              FFAppState().filterByHasCar = haveCarValue!;
                            });
                          } else {
                            setState(() {
                              FFAppState().filterByHasCar = haveCarValue!;
                            });
                          }
                        },
                        activeColor: FlutterFlowTheme.of(context).tertiaryColor,
                        checkColor: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        FFAppState().filterByWork = 'الكل';
                        FFAppState().filterByCities = 'الكل';
                      });
                      setState(() {
                        FFAppState().filterByHasCar = false;
                      });
                      Navigator.pop(context);
                    },
                    text: 'حذف',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Noto Kufi Arabic',
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'تم',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Noto Kufi Arabic',
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
