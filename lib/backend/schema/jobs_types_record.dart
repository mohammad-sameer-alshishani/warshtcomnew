import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jobs_types_record.g.dart';

abstract class JobsTypesRecord
    implements Built<JobsTypesRecord, JobsTypesRecordBuilder> {
  static Serializer<JobsTypesRecord> get serializer =>
      _$jobsTypesRecordSerializer;

  BuiltList<String>? get jobsTypes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(JobsTypesRecordBuilder builder) =>
      builder..jobsTypes = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jobsTypes');

  static Stream<JobsTypesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JobsTypesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JobsTypesRecord._();
  factory JobsTypesRecord([void Function(JobsTypesRecordBuilder) updates]) =
      _$JobsTypesRecord;

  static JobsTypesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJobsTypesRecordData() {
  final firestoreData = serializers.toFirestore(
    JobsTypesRecord.serializer,
    JobsTypesRecord(
      (j) => j..jobsTypes = null,
    ),
  );

  return firestoreData;
}
