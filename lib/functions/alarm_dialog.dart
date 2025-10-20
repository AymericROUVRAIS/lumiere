import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:lumiere/functions/switch_theme.dart';
import 'package:lumiere/components/alarm_card.dart';

Future<int?> showCustomPopup(BuildContext context, {int initialIndex = 0}) {
  int dialogIndex = initialIndex;
  final toggleSwitchTheme = Theme.of(
    context,
  ).extension<ToggleSwitchThemeExtension>()!;

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
                    if (dialogIndex == 0) AlarmCard(),
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

/*
ElevatedButton(
  onPressed: () {
    Navigator.of(context).pop(dialogIndex);
  },
  child: const Text("Close"),
),
 */
