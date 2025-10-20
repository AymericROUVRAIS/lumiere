import 'package:flutter/material.dart';

String formatTimeOfDay(TimeOfDay t) {
  if (t.hour == 0) {
    return '${t.minute}min';
  } else if (t.minute == 0) {
    return '${t.hour}h';
  } else {
    return '${t.hour}h ${t.minute}min';
  }
}
