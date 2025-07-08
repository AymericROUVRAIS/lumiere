import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final void Function(TimeOfDay) onTimeSelected;

  const CustomTimePicker({
    super.key,
    required this.initialTime,
    required this.onTimeSelected,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late int selectedHour;
  late int selectedMinute;

  static const int loopSize = 100000;
  static const int hourMod = 24;
  static const int minuteMod = 60;

  late FixedExtentScrollController hourController;
  late FixedExtentScrollController minuteController;

  @override
  void initState() {
    super.initState();

    selectedHour = widget.initialTime.hour;
    selectedMinute = widget.initialTime.minute;

    hourController = FixedExtentScrollController(
      initialItem: _centeredIndex(selectedHour, hourMod),
    );
    minuteController = FixedExtentScrollController(
      initialItem: _centeredIndex(selectedMinute, minuteMod),
    );
  }

  int _centeredIndex(int value, int mod) {
    return (loopSize ~/ 2) - ((loopSize ~/ 2) % mod) + value;
  }

  Widget _buildPicker(
    int mod,
    int selected,
    ValueChanged<int> onSelected,
    FixedExtentScrollController controller,
  ) {
    return SizedBox(
      width: 80,
      height: 150,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 40,
        physics: const FixedExtentScrollPhysics(),
        overAndUnderCenterOpacity: 0.5,
        perspective: 0.005,
        diameterRatio: 1.5,
        onSelectedItemChanged: (index) => onSelected(index % mod),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: loopSize,
          builder: (context, index) {
            final value = index % mod;
            final isSelected = value == selected;
            return Center(
              child: Text(
                value.toString().padLeft(2, '0'),
                style: TextStyle(
                  fontSize: isSelected ? 24 : 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Set Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPicker(hourMod, selectedHour, (val) {
                  setState(() => selectedHour = val);
                }, hourController),
                const Text(":", style: TextStyle(fontSize: 24)),
                _buildPicker(minuteMod, selectedMinute, (val) {
                  setState(() => selectedMinute = val);
                }, minuteController),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                widget.onTimeSelected(
                  TimeOfDay(hour: selectedHour, minute: selectedMinute),
                );
                Navigator.of(context).pop();
              },
              child: const Text("Done"),
            ),
          ],
        ),
      ),
    );
  }
}
