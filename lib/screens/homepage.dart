import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lumiere/components/custom_time_picker.dart'; // import your custom time picker

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
    final Platform.i

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lampe de chevet'),
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Selected Time: $displayTime',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showTimePicker,
              child: const Text('Select Time'),
            ),
          ],
        ),
      ),
    );
  }
}
