import 'package:shared_preferences/shared_preferences.dart';

/// Dependencies container
base class Dependencies {
  const Dependencies({
    required this.sharedPreferences,
  });

  /// [SharedPreferences] instance, used to store Key-Value pairs.
  final SharedPreferences sharedPreferences;
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
      'msSpent: $msSpent'
      ')';
}
