import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:vk/src/feature/initialization/model/dependencies.dart';

/// A class which is responsible for processing initialization steps.
class InitializationProcessor {
  Future<Dependencies> _initDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    return Dependencies(sharedPreferences: sharedPreferences);
  }

  /// Method that starts the initialization process
  /// and returns the result of the initialization.
  Future<InitializationResult> initialize() async {
    final stopwatch = Stopwatch()..start();

    log('Initializing dependencies...');
    // Initialize dependencies
    final dependencies = await _initDependencies();
    log('Dependencies initialized');

    stopwatch.stop();
    final result = InitializationResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );

    return result;
  }
}
