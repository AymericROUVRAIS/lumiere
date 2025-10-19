import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class ToggleSwitchThemeExtension
    extends ThemeExtension<ToggleSwitchThemeExtension> {
  final Color activeBgColor;
  final Color activeFgColor;
  final Color inactiveBgColor;
  final Color inactiveFgColor;
  final Color borderColor;
  final double borderWidth;
  final double cornerRadius;

  const ToggleSwitchThemeExtension({
    required this.activeBgColor,
    required this.activeFgColor,
    required this.inactiveBgColor,
    required this.inactiveFgColor,
    required this.borderColor,
    this.borderWidth = 2.0,
    this.cornerRadius = 8.0,
  });

  @override
  ToggleSwitchThemeExtension copyWith({
    Color? activeBgColor,
    Color? activeFgColor,
    Color? inactiveBgColor,
    Color? inactiveFgColor,
    Color? borderColor,
    double? borderWidth,
    double? cornerRadius,
  }) {
    return ToggleSwitchThemeExtension(
      activeBgColor: activeBgColor ?? this.activeBgColor,
      activeFgColor: activeFgColor ?? this.activeFgColor,
      inactiveBgColor: inactiveBgColor ?? this.inactiveBgColor,
      inactiveFgColor: inactiveFgColor ?? this.inactiveFgColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      cornerRadius: cornerRadius ?? this.cornerRadius,
    );
  }

  @override
  ToggleSwitchThemeExtension lerp(
    ThemeExtension<ToggleSwitchThemeExtension>? other,
    double t,
  ) {
    if (other is! ToggleSwitchThemeExtension) return this;
    return ToggleSwitchThemeExtension(
      activeBgColor: Color.lerp(activeBgColor, other.activeBgColor, t)!,
      activeFgColor: Color.lerp(activeFgColor, other.activeFgColor, t)!,
      inactiveBgColor: Color.lerp(inactiveBgColor, other.inactiveBgColor, t)!,
      inactiveFgColor: Color.lerp(inactiveFgColor, other.inactiveFgColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      cornerRadius: lerpDouble(cornerRadius, other.cornerRadius, t)!,
    );
  }
}
