import 'package:flutter/material.dart';
import 'package:lumiere/functions/custom_time_format.dart';

class AlarmListCard extends StatefulWidget {
  final TimeOfDay duration;
  final TimeOfDay date;

  const AlarmListCard({super.key, required this.duration, required this.date});

  @override
  State<AlarmListCard> createState() => _AlarmListCardState();

  static ListTile buildTile({
    required BuildContext context,
    required TimeOfDay duration,
    required TimeOfDay date,
  }) {
    bool switchValue = true;

    return ListTile(
      title: Text(formatForCard(date)),
      subtitle: !(duration.minute == 30 && duration.hour == 0)
          ? Text('Durée : ${formatTimeOfDay(duration)}')
          : null,
      trailing: StatefulBuilder(
        builder: (context, setState) {
          return Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() => switchValue = value);
            },
          );
        },
      ),
    );
  }
}

class _AlarmListCardState extends State<AlarmListCard> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$widget.date'),
      trailing: Switch(
        value: switchValue,
        onChanged: (value) {
          setState(() {
            switchValue = value;
          });
        },
      ),
    );
  }
}
