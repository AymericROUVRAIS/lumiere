import 'package:flutter/material.dart';

String formatTimeOfDay(TimeOfDay t) {
  // Format a TimeOfDay into ..h..min or ..h or ..m
  if (t.hour == 0) {
    return '${t.minute}min';
  } else if (t.minute == 0) {
    return '${t.hour}h';
  } else {
    return '${t.hour}h ${t.minute}min';
  }
}

String formatForCard(TimeOfDay t) {
  // Format a TimeOfDay into hh:mm
  String min;
  String h;

  if (t.minute < 10) {
    // As t.minute is int value is 0 and not 00
    min = '0${t.minute}';
  } else {
    min = '${t.minute}';
  }

  if (t.hour == 0) {
    h = '00';
  } else {
    h = '${t.hour}';
  }
  return '$h:$min';
}
