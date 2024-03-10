import 'package:shared_preferences/shared_preferences.dart';

import 'package:vk/src/feature/settings/bloc/settings_bloc.dart';

/// Dependencies container
final class Dependencies {
  const Dependencies({
    required this.sharedPreferences,
    required this.settingsBloc,
  });

  /// [SharedPreferences] instance, used to store Key-Value pairs.
  final SharedPreferences sharedPreferences;

  /// [SettingsBloc] instance, used to manage theme.
  final SettingsBloc settingsBloc;

  @override
  String toString() => '[$SharedPreferences, $SettingsBloc]';
}

/// Result of initialization
final class InitializationResult {
  InitializationResult({
    required this.dependencies,
    required this.msSpent,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $dependencies, '
      'spent: $msSpent ms'
      ')';
}
