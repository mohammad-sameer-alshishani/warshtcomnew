import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddServiceProvideWidget extends StatefulWidget {
  const AddServiceProvideWidget({Key? key}) : super(key: key);

  @override
  _AddServiceProvideWidgetState createState() =>
      _AddServiceProvideWidgetState();
}

class _AddServiceProvideWidgetState extends State<AddServiceProvideWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  String? postTypeValue;
  TextEditingController? postDescriptionController;
  String? priceTypeValue;
  TextEditingController? postPriceController;

  @override
  void initState() {
    super.initState();
    postDescriptionController = TextEditingController();
    postPriceController = TextEditingController();
  }

  @override
  void dispose() {
    postDescriptionController?.dispose();
    postPriceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pop();
                  },
                  text: 'الغاء',
                  options: FFButtonOptions(
                    width: 70,
                    height: 40,
                    color: Color(0x00EEEEEE),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Noto Kufi Arabic',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                  shape: BoxShape.rectangle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/WarshatcomIntro.png',
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                child: StreamBuilder<List<PostsRecord>>(
                  stream: queryPostsRecord(),
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
                    List<PostsRecord> buttonPostsRecordList = snapshot.data!;
                    return FFButtonWidget(
                      onPressed: () async {
                        final postsCreateData = createPostsRecordData(
                          postPhoto: uploadedFileUrl,
                          postDescription: postDescriptionController!.text,
                          postUser: currentUserReference,
                          timePosted: getCurrentTimestamp,
                          price: double.parse(postPriceController!.text),
                          priceType: priceTypeValue,
                          postType: postTypeValue,
                          postID: random_data.randomString(
                            10,
                            10,
                            true,
                            true,
                            true,
                          ),
                        );
                        await PostsRecord.collection.doc().set(postsCreateData);
                        context.pop();
                      },
                      text: 'تم',
                      options: FFButtonOptions(
                        width: 70,
                        height: 40,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Noto Kufi Arabic',
                                  color: Color(0xFF1A1A1A),
                                  fontWeight: FontWeight.w500,
                                ),
                        borderSide: BorderSide(
                          color: Color(0x00212121),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Text(
                  'أريد',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Noto Kufi Arabic',
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 20, 18, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FlutterFlowDropDown(
                        options: [
                          'سائق',
                          'حداد',
                          'دهين',
                          'بليط',
                          'نجار',
                          'مواسرجي',
                          'مصلح',
                          'منسق',
                          'ديكور',
                          'مقاول',
                          'تنظيف',
                          'صيانة'
                        ],
                        onChanged: (val) => setState(() => postTypeValue = val),
                        width: 180,
                        height: 50,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              fontFamily: 'Noto Kufi Arabic',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        hintText: 'اختر',
                        fillColor: FlutterFlowTheme.of(context).secondaryColor,
                        elevation: 2,
                        borderColor: Color(0x0095A1AC),
                        borderWidth: 0,
                        borderRadius: 10,
                        margin: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        hidesUnderline: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Text(
                  'للقيام بــ ',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: postDescriptionController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'الوصف',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Noto Kufi Arabic',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x0095A1AC),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x0095A1AC),
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
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Noto Kufi Arabic',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 14,
                            ),
                        textAlign: TextAlign.start,
                        maxLines: 8,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Text(
                  'بسعر',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 18, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: TextFormField(
                          controller: postPriceController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'السعر',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: 'Noto Kufi Arabic',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x0095A1AC),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x0095A1AC),
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
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Noto Kufi Arabic',
                                    fontWeight: FontWeight.w500,
                                  ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Text(
                      '/ ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Noto Kufi Arabic',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Expanded(
                      child: FlutterFlowDropDown(
                        options: ['ساعة', 'يوم', 'متر', 'قطعة', 'طلب'],
                        onChanged: (val) =>
                            setState(() => priceTypeValue = val),
                        width: 180,
                        height: 47,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              fontFamily: 'Noto Kufi Arabic',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w500,
                            ),
                        hintText: 'لكل',
                        fillColor: FlutterFlowTheme.of(context).secondaryColor,
                        elevation: 2,
                        borderColor: Color(0x0095A1AC),
                        borderWidth: 0,
                        borderRadius: 10,
                        margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        hidesUnderline: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.95, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 8, 0),
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: InkWell(
                                    onTap: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        maxWidth: 300.00,
                                        maxHeight: 200.00,
                                        allowPhoto: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() => isMediaUploading = true);
                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          isMediaUploading = false;
                                        }
                                        if (downloadUrls.length ==
                                            selectedMedia.length) {
                                          setState(() => uploadedFileUrl =
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.photo_camera,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 30,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.03, 0.54),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 5, 0),
                                            child: Text(
                                              'أضف صورة',
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
      ],
    );
  }
}
