import 'package:flutter/material.dart';

/// The default [ThemeData].
final defaultThemeData = ThemeData(
  useMaterial3: true,
);

/// The dark [ColorScheme].
const darkColorScheme = ColorScheme.dark(
  background: Color(0xFF212121),
  primary: Color(0xFF424242),
  secondary: Color(0xFF616161),
);

/// The light [ColorScheme].
const lightColorScheme = ColorScheme.light(
  background: Color(0xFFBDBDBD),
  primary: Color(0xFFE0E0E0),
  secondary: Color(0xFFEEEEEE),
);
