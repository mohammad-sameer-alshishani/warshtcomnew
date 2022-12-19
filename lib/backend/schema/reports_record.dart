import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reports_record.g.dart';

abstract class ReportsRecord
    implements Built<ReportsRecord, ReportsRecordBuilder> {
  static Serializer<ReportsRecord> get serializer => _$reportsRecordSerializer;

  @BuiltValueField(wireName: 'reported_by_ref')
  DocumentReference? get reportedByRef;

  @BuiltValueField(wireName: 'report_photo')
  String? get reportPhoto;

  @BuiltValueField(wireName: 'report_text')
  String? get reportText;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReportsRecordBuilder builder) => builder
    ..reportPhoto = ''
    ..reportText = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReportsRecord._();
  factory ReportsRecord([void Function(ReportsRecordBuilder) updates]) =
      _$ReportsRecord;

  static ReportsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReportsRecordData({
  DocumentReference? reportedByRef,
  String? reportPhoto,
  String? reportText,
}) {
  final firestoreData = serializers.toFirestore(
    ReportsRecord.serializer,
    ReportsRecord(
      (r) => r
        ..reportedByRef = reportedByRef
        ..reportPhoto = reportPhoto
        ..reportText = reportText,
    ),
  );

  return firestoreData;
}
