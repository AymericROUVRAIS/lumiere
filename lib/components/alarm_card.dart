import 'package:flutter/material.dart';
import 'package:lumiere/functions/card_theme.dart';
import 'package:lumiere/theme/theme.dart'; // for text styling
// Functiions
import 'package:lumiere/functions/show_time_picker.dart'; // show the time picker
import 'package:lumiere/functions/custom_time_format.dart'; // format TimeOfDay

class AlarmCard extends StatefulWidget {
  const AlarmCard({super.key});

  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  late TimeOfDay?
  selectedTime; // duration of the lighting animation for the lamp
  late String formattedTime; // time formatted to be used in a Text widget

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay(hour: 0, minute: 30);
    formattedTime = formatTimeOfDay(selectedTime!);
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
            Text('Pour un reveil en douceur', style: leadingTextStyle(context)),
            Divider(thickness: 1, color: Colors.grey),
            Text(
              'Allume la lampe progressivement jusqu’à l’heure sélectionné.',
              style: subTextStyle(context),
            ),
            Row(
              children: [
                Text('Durée : ', style: subTextStyle(context)),
                TextButton(
                  onPressed: () {
                    showCustomTimePicker(
                      context: context,
                      initialTime: selectedTime,
                      onTimeSelected: (time) {
                        setState(() {
                          selectedTime = time;
                          formattedTime = formatTimeOfDay(selectedTime!);
                        });
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
                // ClipRRect to have rounded corners on the image
                child: ClipRRect(
                  borderRadius: cardBorderRadius,
                  child: Image.asset(
                    'images/mushroom_lamp.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
