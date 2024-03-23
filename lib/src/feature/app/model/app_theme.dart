import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:vk/src/common/theme/color_schemes.dart';

/// A class that holds properties needed
/// to build a [ThemeData] for the app.
final class AppTheme {
  AppTheme({required this.mode});

  /// The type of theme to use.
  final ThemeMode mode;

  /// The dark [ThemeData] for this [AppTheme].
  final darkThemeData = defaultThemeData.copyWith(
    colorScheme: darkColorScheme,
  );

  /// The light [ThemeData] for this [AppTheme].
  final lightThemeData = defaultThemeData.copyWith(
    colorScheme: lightColorScheme,
  );

  /// The default [AppTheme].
  static final defaultTheme = AppTheme(
    mode: ThemeMode.system,
  );

  /// The [ThemeData] for this [AppTheme].
  /// This is computed based on the [mode].
  ThemeData computeThemeData() {
    switch (mode) {
      case ThemeMode.light:
        return lightThemeData;
      case ThemeMode.dark:
        return darkThemeData;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? darkThemeData
            : lightThemeData;
    }
  }

  @override
  String toString() => mode.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppTheme &&
          runtimeType == other.runtimeType &&
          mode == other.mode;

  @override
  int get hashCode => mode.hashCode;
}
