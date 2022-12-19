import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SearchComponentWidget extends StatefulWidget {
  const SearchComponentWidget({Key? key}) : super(key: key);

  @override
  _SearchComponentWidgetState createState() => _SearchComponentWidgetState();
}

class _SearchComponentWidgetState extends State<SearchComponentWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientText(
          'لا يوجد بحث',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Noto Kufi Arabic',
                fontSize: 15,
              ),
          colors: [
            FlutterFlowTheme.of(context).tertiaryColor,
            FlutterFlowTheme.of(context).secondaryText
          ],
          gradientDirection: GradientDirection.ltr,
          gradientType: GradientType.linear,
        ),
        Image.asset(
          'assets/images/WarchtcomSplashPngSearch.png',
          width: 500,
          height: 100,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
