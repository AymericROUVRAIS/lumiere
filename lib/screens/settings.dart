import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lumiere/components/settings_card.dart';
import 'package:lumiere/components/settings_toggle_switch.dart';
import 'package:lumiere/components/settings_divider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        leading: TextButton(
          child: Icon(
            CupertinoIcons.return_icon,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Bluetooth
          SettingsCard(
            icon: Icons.bluetooth,
            onTap: () {},
            leadingLabel: 'Connecter une lampe',
            subLabel: 'Aucune lampe connecter',
          ),
          // Lamp settings
          SettingsCard(
            icon: Icons.access_alarm_outlined,
            onTap: () {},
            leadingLabel: 'Paramètre de la lampe',
            subLabel: '',
          ),
          // Updates
          SettingsCard(
            icon: Ionicons.cloud_done_outline,
            onTap: () {},
            leadingLabel: 'Mise à jour',
            subLabel: '',
          ),
          SettingsDivider(),
          // Theme mode
          SettingsCard(
            icon: Icons.brightness_6,
            end: SettingsToggleSwitch(),
            leadingLabel: 'Mode clair/sombre',
            subLabel: 'Changer le theme de l\'application',
            onTap: () {},
          ),
          // SAV
          SettingsCard(
            icon: Icons.favorite_border,
            onTap: () {},
            leadingLabel: 'Service après vente',
            subLabel: '',
          ),
          // About1
          SettingsCard(
            icon: Icons.info_outline,
            onTap: () {},
            leadingLabel: 'A propos',
            subLabel: '',
          ),
        ],
      ),
    );
  }
}
