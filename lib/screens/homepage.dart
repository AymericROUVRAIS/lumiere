import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart'; // better icons
import 'package:flutter/cupertino.dart'; // ios style
import 'package:filling_slider/filling_slider.dart'; // ios like slider integration
import 'package:flutter_speed_dial/flutter_speed_dial.dart'; // better fab
// Custom widgets for the project
import 'package:lumiere/components/main_card.dart';
import 'package:lumiere/components/toggle_switch.dart';
import 'package:lumiere/components/custom_time_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeOfDay? selectedTime;

  void _showTimePicker() async {
    showDialog(
      context: context,
      builder: (context) {
        return CustomTimePicker(
          initialTime: selectedTime ?? TimeOfDay.now(),
          onTimeSelected: (time) {
            setState(() {
              selectedTime = time;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayTime = selectedTime != null
        ? selectedTime!.format(context)
        : 'No time selected';
    // final Platform i;
    // late bool card1Expanded = true;
    // late bool card2Expanded = true;
    late double lightValue = 0;

    late List<ListTile> lightStateChild = [
      ListTile(
        title: FillingSlider(
          direction: FillingSliderDirection.horizontal,
          height: 40.0,
          fillColor:
              Theme.of(context).sliderTheme.activeTrackColor ??
              Theme.of(context).colorScheme.primary,
          color:
              Theme.of(context).sliderTheme.inactiveTrackColor ??
              Theme.of(context).colorScheme.secondary,
        ),
      ),
      ListTile(
        title: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 20, // Makes the bar thicker
            thumbColor: Colors.blue,
            overlayColor: Colors.blue.withAlpha(32), // Optional
            trackShape: RectangularSliderTrackShape(),
          ),
          child: Slider(
            min: 0,
            max: 100,
            value: lightValue,
            onChanged: (value) {
              setState(() {
                lightValue = value;
              });
            },
          ),
        ),
      ),
    ]; // only a slider (filling slider)
    late List<ListTile> alarmChild = [];

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
        ],
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

          children: [
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Ajouter',
              onTap: () {
                _showTimePicker();
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.edit),
              label: 'Modifier',
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15.0),
            MainCard(
              icon: Icons.light_mode_outlined,
              onTap: () {},
              leadingLabel: 'Allumer/Eteindre',
              subLabel: 'Lampe de chevet',
              end: ToggleSwitch(),
              expansionChild: lightStateChild,
            ),
            MainCard(
              leadingLabel: 'Reveil',
              subLabel: 'Activé',
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
