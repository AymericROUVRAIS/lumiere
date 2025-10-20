import 'package:flutter/material.dart';
import 'package:lumiere/theme/theme.dart';

class MainCard extends StatefulWidget {
  final IconData icon;
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
  });

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.expansionChild.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card.outlined(
        color: Theme.of(context).cardColor,
        shape: Theme.of(context).cardTheme.shape, // customize card border
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AbsorbPointer(
            absorbing: !isEnabled,
            child: ExpansionTile(
              title: Text(
                widget.leadingLabel,
                style: leadingTextStyle(context),
              ),
              subtitle: Text(widget.subLabel, style: subTextStyle(context)),
              leading: Icon(
                widget.icon,
                color: Theme.of(context).iconTheme.color,
              ),
              // Default chevron if the widget is enabled
              trailing: !isEnabled ? const SizedBox() : null,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
                // borderRadius: BorderRadius.all(Radius.circular),
              ),
              onExpansionChanged: isEnabled ? (expanded) {} : null,
              children: isEnabled ? widget.expansionChild : [],
            ),
          ),
        ),
      ),
    );
  }
}
