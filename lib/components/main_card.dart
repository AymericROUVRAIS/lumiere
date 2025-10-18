import 'package:flutter/material.dart';
import 'package:lumiere/theme/theme.dart';

class MainCard extends StatefulWidget {
  final IconData icon;
  final Widget? end;
  final VoidCallback onTap;
  final String leadingLabel;
  final String subLabel;
  final List<ListTile> expansionChild;

  const MainCard({
    super.key,
    required this.icon,
    required this.onTap,
    required this.leadingLabel,
    required this.subLabel,
    required this.expansionChild,
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
        ), // customize card border
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            title: Text(widget.leadingLabel, style: leadingTextStyle(context)),
            subtitle: Text(widget.subLabel, style: subTextStyle(context)),
            leading: Icon(widget.icon),
            trailing: widget.end, // default chevron if widget.end is empty
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            children: widget.expansionChild,
          ),
        ),
      ),
    );
  }
}
