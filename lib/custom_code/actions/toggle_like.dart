// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import '../../backend/backend.dart';
// import '../../flutter_flow/flutter_flow_theme.dart';
// import '../../flutter_flow/flutter_flow_util.dart';
// import 'index.dart'; // Imports other custom actions
// import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';

// THE ABOVE IMPORTS WILL BE ADDED AUTOMATICALLY. DO NOT INCLUDE THESE IN CODE EDITOR.

Future toggleLike(
  DocumentReference userRef,
  DocumentReference postRef,
) async {
  final postsUpdateData = {
    'liked_by': FieldValue.arrayUnion([userRef]),
  };
  await postRef.update(postsUpdateData);
  final usersUpdateData = {
    'liked_posts': FieldValue.arrayUnion([postRef]),
  };
  await userRef.update(usersUpdateData);
}
