import 'package:flutter/material.dart';
import 'package:lumiere/theme/theme.dart'; // for text styling
import 'package:interactive_slider/interactive_slider.dart';

// Adaptation of MainCard to have a working slider
class SwitchControlledExpansionTile extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String leadingLabel;
  final String subLabel;
  final double sliderValue; // parameter from parent
  final ValueChanged<double>? onSliderValueChanged;

  const SwitchControlledExpansionTile({
    super.key,
    required this.icon,
    required this.onTap,
    required this.leadingLabel,
    required this.subLabel,
    this.sliderValue = 50,
    this.onSliderValueChanged,
  });

  @override
  State<SwitchControlledExpansionTile> createState() =>
      SwitchControlledExpansionTileState();
}

class SwitchControlledExpansionTileState
    extends State<SwitchControlledExpansionTile> {
  bool isExpanded = false; // control expansion
  bool switchValue = false; // control switch state
  late double _sliderValue; // value of the slider
  late InteractiveSliderController _controller; // controller for the slider

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.sliderValue;
    _controller = InteractiveSliderController(_sliderValue / 100);
  }

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
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
          child: Column(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        // Center Icon to Text
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          widget.icon,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 5.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.leadingLabel,
                                style: leadingTextStyle(context),
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                widget.subLabel,
                                style: subTextStyle(context),
                              ),
                            ],
                          ), // for the texts
                        ),
                      ),
                      Switch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                            isExpanded = value; // control expansion
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Children
              AnimatedCrossFade(
                firstChild: Container(),
                secondChild: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero, // remove default padding
                      title: InteractiveSlider(
                        controller: _controller,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        unfocusedMargin: EdgeInsets.symmetric(horizontal: 10.0),
                        foregroundColor: Theme.of(
                          context,
                        ).sliderTheme.activeTrackColor,
                        min: 0.0,
                        max: 100.0,
                        initialProgress: _sliderValue,
                        // This callback runs repeatedly for every update
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                          });
                          if (widget.onSliderValueChanged != null) {
                            widget.onSliderValueChanged!(
                              value,
                            ); // notify parent
                          }
                        },
                        // This callback runs once when the user finishes updating the slider
                        onProgressUpdated: (value) {},
                      ),
                    ),
                  ],
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
