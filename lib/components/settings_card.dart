import 'package:flutter/material.dart';
import 'package:lumiere/theme/theme.dart';

class SettingsCard extends StatelessWidget {
  final IconData icon;
  final Widget? end;
  final VoidCallback onTap;
  final String leadingLabel;
  final String subLabel;

  const SettingsCard({
    super.key,
    required this.icon,
    this.end,
    required this.onTap,
    required this.leadingLabel,
    required this.subLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 0.0,
        margin: EdgeInsets.zero,
        shape: Border(), // square border
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Icon(icon),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(leadingLabel, style: leadingTextStyle(context)),
                        SizedBox(width: 8.0),
                        if (subLabel.isNotEmpty)
                          Text(subLabel, style: subTextStyle(context)),
                      ],
                    ),
                  ),
                ),
                ?end,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
