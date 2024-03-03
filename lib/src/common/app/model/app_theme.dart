import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A class that holds properties needed
/// to build a [ThemeData] for the app.
final class AppTheme {
  AppTheme({required this.mode});

  /// The type of theme to use.
  final ThemeMode mode;

  /// The dark [ThemeData] for this [AppTheme].
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
    ),
  );

  /// The light [ThemeData] for this [AppTheme].
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade400,
      primary: Colors.grey.shade300,
      secondary: Colors.grey.shade200,
    ),
  );

  /// The default [AppTheme].
  static final defaultTheme = AppTheme(
    mode: ThemeMode.system,
  );

  /// The [ThemeData] for this [AppTheme].
  /// This is computed based on the [mode].
  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? darkTheme
            : lightTheme;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppTheme &&
          runtimeType == other.runtimeType &&
          mode == other.mode;

  @override
  int get hashCode => mode.hashCode;
}
