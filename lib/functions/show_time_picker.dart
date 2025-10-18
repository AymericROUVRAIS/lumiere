import 'package:flutter/material.dart';
import 'package:lumiere/components/custom_time_picker.dart';

void showCustomTimePicker({
  required BuildContext context,
  required TimeOfDay? initialTime,
  required ValueChanged<TimeOfDay?> onTimeSelected,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomTimePicker(
        initialTime: initialTime ?? TimeOfDay.now(),
        onTimeSelected: onTimeSelected,
      );
    },
  );
}
