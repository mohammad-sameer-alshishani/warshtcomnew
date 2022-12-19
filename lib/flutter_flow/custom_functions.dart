import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double rating(List<double> ratings) {
  var sum = 0.0;
  for (int i = 0; i < ratings.length; i++) {
    sum += ratings[i];
  }
  if (ratings.isNotEmpty) {
    return sum / ratings.length;
  } else {
    return 0.0;
  }
}

String imageCountPlus(int imagesCount) {
  String imageCount = "+${imagesCount - 5}";
  return imageCount;
}

List<String> filterization(
  String jobs,
  String locations,
) {
  List<String> filter = [];
  filter.add(jobs);
  filter.add(locations);
  return filter;
}
