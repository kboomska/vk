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

/// Pattern matching for [SettingsEvent].
typedef SettingsEventMatch<R, E extends SettingsEvent> = R Function(E event);

/// Base class for [SettingsEvent].
abstract base class _$SettingsEvent {
  const _$SettingsEvent({required this.appTheme});

  /// The new theme mode.
  final AppTheme appTheme;

  /// Pattern matching for [SettingsEvent].
  R map<R>({
    required SettingsEventMatch<R, _SettingsEvent$UpdateTheme> updateTheme,
  }) =>
      switch (this) {
        _SettingsEvent$UpdateTheme e => updateTheme(e),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [SettingsEvent].
  R maybeMap<R>({
    SettingsEventMatch<R, _SettingsEvent$UpdateTheme>? updateTheme,
    required R Function() orElse,
  }) =>
      map<R>(
        updateTheme: updateTheme ?? (_) => orElse(),
      );

  /// Pattern matching for [SettingsEvent].
  R? mapOrNull<R>({
    SettingsEventMatch<R, _SettingsEvent$UpdateTheme>? updateTheme,
  }) =>
      map<R?>(
        updateTheme: updateTheme ?? (_) => null,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _$SettingsEvent && other.appTheme == appTheme;
  }

  @override
  int get hashCode => appTheme.hashCode;
}
