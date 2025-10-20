import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

ListTile addToList({required TimeOfDay duration, required TimeOfDay date}) {
  return ListTile(title: Text('Test'), leading: Icon(Ionicons.alarm_outline));
}
