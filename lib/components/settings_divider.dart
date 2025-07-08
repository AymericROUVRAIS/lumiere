import 'package:flutter/material.dart';
import 'package:lumiere/theme/theme.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
      child: Container(
        height: 3, // thickness of the divider
        margin: EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10), // round edges
        ),
      ),
    );
  }
}
