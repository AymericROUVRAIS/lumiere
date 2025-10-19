import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
  late bool _isEnabled; // disable the ExpansionTile if expansionChild is empty

  @override
  void initState() {
    super.initState();
    _isEnabled = widget.expansionChild.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card.outlined(
        color: Theme.of(context).cardColor,
        shape: Theme.of(context).cardTheme.shape, // customize card border
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AbsorbPointer(
            absorbing: !_isEnabled,
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
              trailing: !_isEnabled ? const SizedBox() : null,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              onExpansionChanged: _isEnabled ? (expanded) {} : null,
              children: _isEnabled ? widget.expansionChild : [],
            ),
          ),
        ),
      ),
    );
  }
}
