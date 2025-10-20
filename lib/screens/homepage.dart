import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart'; // better icons
import 'package:flutter/cupertino.dart'; // ios style
import 'package:flutter_speed_dial/flutter_speed_dial.dart'; // better fab
// Custom widgets for the project
import 'package:lumiere/components/main_card.dart';
import 'package:lumiere/components/switch_expansion_tile.dart';
import 'package:lumiere/functions/show_time_picker.dart';
import 'package:lumiere/functions/alarm_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeOfDay? selectedTime; // time selected to create alarm
  double lightValue = 50; // light slider value
  List<ListTile> alarmChild = [];

  void addAlarm(ListTile tile) {
    setState(() {
      alarmChild.add(tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lumière'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Ionicons.settings_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/settingspage');
            },
          ),
        ], // Settings button
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          overlayOpacity: 0.4,
          spacing: 10,
          spaceBetweenChildren: 8,
          childrenButtonSize: const Size(50, 50),
          direction: SpeedDialDirection.up,

          // Modify and Add buttons
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Ajouter',
              onTap: () => showCustomPopup(context, onAddItem: addAlarm),
            ),
            SpeedDialChild(
              child: const Icon(Icons.edit),
              label: 'Modifier',
              onTap: () {
                showCustomTimePicker(
                  context: context,
                  initialTime: selectedTime,
                  onTimeSelected: (time) {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15.0),
            SwitchControlledExpansionTile(
              icon: Icons.light_mode_outlined,
              onTap: () {},
              leadingLabel: 'Allumer/Eteindre',
              subLabel: 'Lampe de chevet',
              onSliderValueChanged: (value) {
                setState(() {
                  lightValue = value;
                });
              },
            ),
            MainCard(
              leadingLabel: 'Reveil',
              subLabel: 'Desactivé',
              icon: CupertinoIcons.alarm,
              onTap: () {},
              expansionChild: alarmChild,
            ),
          ],
        ),
      ),
    );
  }
}
