import 'package:shared_preferences/shared_preferences.dart';

/// Dependencies container
final class Dependencies {
  const Dependencies({
    required this.sharedPreferences,
  });

  /// [SharedPreferences] instance, used to store Key-Value pairs.
  final SharedPreferences sharedPreferences;

  @override
  String toString() => '$SharedPreferences()';
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
