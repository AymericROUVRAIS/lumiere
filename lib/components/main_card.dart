import 'package:flutter/material.dart';
import 'package:lumiere/theme/theme.dart';

class MainCard extends StatefulWidget {
  final IconData icon;
  final Widget? end;
  final VoidCallback onTap;
  final String leadingLabel;
  final String subLabel;

  const MainCard({
    super.key,
    required this.icon,
    required this.onTap,
    required this.leadingLabel,
    required this.subLabel,
    this.end,
  });

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card.outlined(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ), // fixed: valid border
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Icon(widget.icon),
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
                            Text(
                              widget.leadingLabel,
                              style: leadingTextStyle(context),
                            ),
                            const SizedBox(height: 4.0),
                            if (widget.subLabel.isNotEmpty)
                              Text(
                                widget.subLabel,
                                style: subTextStyle(context),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.end != null) widget.end!,
                  ],
                ),
              ),
              ExpansionTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Icon(widget.icon),
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
                            Text(
                              widget.leadingLabel,
                              style: leadingTextStyle(context),
                            ),
                            const SizedBox(height: 4.0),
                            if (widget.subLabel.isNotEmpty)
                              Text(
                                widget.subLabel,
                                style: subTextStyle(context),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
