import 'package:flutter/material.dart';
// import 'package:lumiere/theme/theme.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light, // this bool value toggles the switch.
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}
