import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vk/src/common/app/model/app_theme.dart';
import 'package:vk/src/feature/settings/data/theme_repository.dart';

part 'package:vk/src/feature/settings/bloc/settings_event.dart';
part 'package:vk/src/feature/settings/bloc/settings_state.dart';

/// A [Bloc] that handles the settings.
final class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required ThemeRepository themeRepository,
    required SettingsState initialState,
  })  : _themeRepository = themeRepository,
        super(initialState) {
    on<SettingsEvent>(
      (event, emit) => event.map(
        updateTheme: (event) => _updateTheme(event, emit),
      ),
      transformer: sequential(),
    );
  }

  final ThemeRepository _themeRepository;

  Future<void> _updateTheme(
    _SettingsEvent$UpdateTheme event,
    Emitter<SettingsState> emit,
  ) async {
    emit(SettingsState.processing(appTheme: state.appTheme));

    try {
      await _themeRepository.setTheme(event.appTheme);

      emit(SettingsState.idle(appTheme: event.appTheme));
    } catch (e) {
      emit(SettingsState.error(appTheme: state.appTheme, cause: e));

      rethrow;
    }
  }
}
