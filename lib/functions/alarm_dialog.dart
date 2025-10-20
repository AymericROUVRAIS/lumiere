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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 16,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 250,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // The available width inside the dialog
                  double availableWidth = constraints.maxWidth;
                  double switchWidth = (availableWidth - 40) / 2;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ToggleSwitch(
                        totalSwitches: 2,
                        minWidth: switchWidth, // dynamically sized width
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
                      ?(dialogIndex == 0) ? AlarmCard() : null,
                    ],
                  );
                },
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
