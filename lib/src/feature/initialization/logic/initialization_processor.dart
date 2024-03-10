import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:vk/src/feature/initialization/model/dependencies.dart';
import 'package:vk/src/feature/settings/bloc/settings_bloc.dart';
import 'package:vk/src/feature/settings/data/theme_datasource.dart';
import 'package:vk/src/feature/settings/data/theme_mode_codec.dart';
import 'package:vk/src/feature/settings/data/theme_repository.dart';

/// A class which is responsible for processing initialization steps.
class InitializationProcessor {
  const InitializationProcessor();

  Future<Dependencies> _initDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final settingsBloc = await _initSettingsBloc(sharedPreferences);

    return Dependencies(
      sharedPreferences: sharedPreferences,
      settingsBloc: settingsBloc,
    );
  }

  Future<SettingsBloc> _initSettingsBloc(SharedPreferences prefs) async {
    final themeRepository = ThemeRepositoryImpl(
      themeDataSource: ThemeDataSourceLocal(
        sharedPreferences: prefs,
        codec: const ThemeModeCodec(),
      ),
    );

    final theme = await themeRepository.getTheme();

    final initialState = SettingsState.idle(appTheme: theme);

    final settingsBloc = SettingsBloc(
      themeRepository: themeRepository,
      initialState: initialState,
    );

    return settingsBloc;
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
