part of 'package:vk/src/feature/settings/bloc/settings_bloc.dart';

/// Events for the [SettingsBloc].
sealed class SettingsEvent extends _$SettingsEvent {
  const SettingsEvent({required super.appTheme});

  /// Event to update the theme mode.
  const factory SettingsEvent.updateTheme({
    /// The new theme mode.
    required AppTheme appTheme,
  }) = _SettingsEvent$UpdateTheme;
}

/// Update theme.
final class _SettingsEvent$UpdateTheme extends SettingsEvent {
  const _SettingsEvent$UpdateTheme({required super.appTheme});

  @override
  String toString() => '$SettingsEvent.updateTheme(appTheme: $appTheme)';
}

/// Base class for [SettingsEvent].
abstract base class _$SettingsEvent {
  const _$SettingsEvent({required this.appTheme});

  /// The new theme mode.
  final AppTheme appTheme;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _$SettingsEvent && other.appTheme == appTheme;
  }

  @override
  int get hashCode => appTheme.hashCode;
}
