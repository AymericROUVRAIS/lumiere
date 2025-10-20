import 'package:flutter/material.dart';
import 'package:lumiere/functions/card_theme.dart';
import 'package:lumiere/theme/theme.dart'; // for text styling
// Functions
import 'package:lumiere/functions/show_time_picker.dart'; // show the time picker
import 'package:lumiere/functions/custom_time_format.dart'; // format TimeOfDay

class AlarmCard extends StatefulWidget {
  final TimeOfDay selectedAnimationTime;
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay> onAnimationTimeChanged;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const AlarmCard({
    super.key,
    required this.selectedAnimationTime,
    required this.selectedTime,
    required this.onAnimationTimeChanged,
    required this.onTimeChanged,
  });

  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  late String formattedTime; // time formatted to be used in a Text widget

  @override
  void initState() {
    super.initState();
    formattedTime = formatTimeOfDay(widget.selectedAnimationTime);
  }

  @override
  void didUpdateWidget(covariant AlarmCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedAnimationTime != widget.selectedAnimationTime) {
      formattedTime = formatTimeOfDay(widget.selectedAnimationTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dialogCardTheme = Theme.of(context).extension<DialogCardTheme>()!;
    final cardBorderRadius =
        (dialogCardTheme.shape as RoundedRectangleBorder).borderRadius;

    return Card.outlined(
      color: dialogCardTheme.color,
      shape: dialogCardTheme.shape,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pour un réveil en douceur', style: leadingTextStyle(context)),
            const Divider(thickness: 1, color: Colors.grey),
            Text(
              'Allume la lampe progressivement jusqu’à l’heure sélectionnée.',
              style: subTextStyle(context),
            ),
            Row(
              children: [
                Text('Durée : ', style: subTextStyle(context)),
                TextButton(
                  onPressed: () {
                    showCustomTimePicker(
                      context: context,
                      initialTime: widget.selectedAnimationTime,
                      onTimeSelected: (time) {
                        widget.onAnimationTimeChanged(time!);
                      },
                    );
                  },
                  child: Text(formattedTime, style: subTextStyle(context)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: cardBorderRadius,
                  child: Image.asset(
                    'images/mushroom_lamp.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showCustomTimePicker(
                    context: context,
                    initialTime: widget.selectedTime,
                    onTimeSelected: (time) {
                      widget.onTimeChanged(time!);
                    },
                  );
                },
                child: Text('Définir l\'heure', style: subTextStyle(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
