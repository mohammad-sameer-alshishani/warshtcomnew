import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerAndTextWidget extends StatefulWidget {
  const DividerAndTextWidget({Key? key}) : super(key: key);

  @override
  _DividerAndTextWidgetState createState() => _DividerAndTextWidgetState();
}

class _DividerAndTextWidgetState extends State<DividerAndTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                thickness: 3,
                color: Color(0xFFFF0000),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
          child: SelectionArea(
              child: Text(
            'Hello World',
            style: FlutterFlowTheme.of(context).bodyText1,
          )),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                thickness: 3,
                color: Color(0xFFFF0000),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
