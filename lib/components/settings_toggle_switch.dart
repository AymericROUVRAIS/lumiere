import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:lumiere/theme/theme_provider.dart';

class SettingsToggleSwitch extends StatefulWidget {
  const SettingsToggleSwitch({super.key});

  @override
  State<SettingsToggleSwitch> createState() => _SettingsToggleSwitchState();
}

class _SettingsToggleSwitchState extends State<SettingsToggleSwitch> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    final isDark =
        Provider.of<ThemeProvider>(
          context,
          listen: false,
        ).themeData.brightness ==
        Brightness.dark;
    _selectedIndex = isDark ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ToggleSwitch(
      minHeight: 30.0,
      minWidth: 40.0,
      initialLabelIndex: _selectedIndex,
      totalSwitches: 2,
      cornerRadius: 50.0,
      icons: [Icons.wb_sunny_outlined, Icons.dark_mode_outlined],
      activeBgColors: [
        [Colors.blue],
        [Colors.purple],
      ],
      inactiveBgColor: Theme.of(context).disabledColor,
      onToggle: (index) {
        if (index != _selectedIndex) {
          setState(() {
            _selectedIndex = index ?? 0;
            themeProvider.toggleTheme();
          });
        }
      },
    );
  }
}
