import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:lumiere/theme/theme.dart'; // for text styling
import 'package:lumiere/components/alarm_card.dart';
import 'package:lumiere/functions/switch_theme.dart';
import 'package:lumiere/functions/create_alarm.dart';

Future<int?> showCustomPopup(
  BuildContext context, {
  int initialIndex = 0,
  required void Function(ListTile newItem) onAddItem,
}) async {
  int dialogIndex = initialIndex;
  // Theme for the ToggleSwitch
  final toggleSwitchTheme = Theme.of(
    context,
  ).extension<ToggleSwitchThemeExtension>()!;

  // Defining variable to make the alarms
  final now = DateTime.now(); // Gets current local time
  late TimeOfDay duration = TimeOfDay(
    hour: 0,
    minute: 30,
  ); // duration of the lighting animation for the lamp
  late TimeOfDay selecTime = TimeOfDay.fromDateTime(
    now,
  ); // time at which the alarm finishes

  return showDialog<int>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            elevation: 16,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Wrap content vertically
                  children: [
                    ToggleSwitch(
                      totalSwitches: 2,
                      minWidth: 100,
                      initialLabelIndex: dialogIndex,
                      borderWidth: toggleSwitchTheme.borderWidth,
                      cornerRadius: 50.0,
                      labels: ['Reveil', 'Alarme'],
                      activeBgColor: [toggleSwitchTheme.activeBgColor],
                      activeFgColor: toggleSwitchTheme.activeFgColor,
                      inactiveBgColor: Colors.transparent,
                      inactiveFgColor: toggleSwitchTheme.inactiveFgColor,
                      borderColor: [toggleSwitchTheme.borderColor],
                      onToggle: (index) {
                        setState(() {
                          dialogIndex = index ?? 0;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    if (dialogIndex == 0)
                      AlarmCard(
                        selectedAnimationTime: duration,
                        selectedTime: selecTime,
                        onAnimationTimeChanged: (newTime) {
                          setState(() => duration = newTime);
                        },
                        onTimeChanged: (newTime) {
                          setState(() => selecTime = newTime);
                        },
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          final newItem = addToList(
                            duration: duration,
                            date: selecTime,
                          );
                          onAddItem(newItem); // parent updates its own list
                          Navigator.of(context).pop(dialogIndex);
                        },
                        child: Text('Ajouter', style: subTextStyle(context)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
