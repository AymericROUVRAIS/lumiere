import 'package:flutter/material.dart';

@immutable
class DialogCardTheme extends ThemeExtension<DialogCardTheme> {
  final Color color; // background color
  final Color foregroundColor; // text/icon color
  final ShapeBorder shape; // border + corner radius

  const DialogCardTheme({
    required this.color,
    required this.foregroundColor,
    required this.shape,
  });

  factory DialogCardTheme.fromColors({
    required Color bgColor,
    required Color fgColor,
    required Color borderColor,
    double borderWidth = 1.0,
    double cornerRadius = 15.0,
  }) {
    return DialogCardTheme(
      color: bgColor,
      foregroundColor: fgColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
    );
  }

  @override
  DialogCardTheme copyWith({
    Color? color,
    Color? foregroundColor,
    ShapeBorder? shape,
  }) {
    return DialogCardTheme(
      color: color ?? this.color,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      shape: shape ?? this.shape,
    );
  }

  @override
  DialogCardTheme lerp(ThemeExtension<DialogCardTheme>? other, double t) {
    if (other is! DialogCardTheme) return this;
    return DialogCardTheme(
      color: Color.lerp(color, other.color, t)!,
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t)!,
      shape: ShapeBorder.lerp(shape, other.shape, t)!,
    );
  }
}
