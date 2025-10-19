import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

Future<int?> showCustomPopup(BuildContext context, {int initialIndex = 0}) {
  int dialogIndex = initialIndex;

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
                        minWidth: switchWidth, // dynamically sized
                        initialLabelIndex: dialogIndex,
                        borderWidth: 2.0,
                        cornerRadius: 50.0,
                        labels: ['Reveil', 'Alarme'],
                        activeBgColor: [
                          Theme.of(context)
                                  .elevatedButtonTheme
                                  .style
                                  ?.foregroundColor
                                  ?.resolve({}) ??
                              Colors.blue,
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor:
                            Colors.transparent, // transparent background
                        inactiveFgColor: Colors.black,
                        borderColor: [Colors.blue], // adds outline

                        onToggle: (index) {
                          setState(() {
                            dialogIndex = index ?? 0;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(dialogIndex);
                        },
                        child: const Text("Close"),
                      ),
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
