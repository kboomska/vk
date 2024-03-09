part of 'package:vk/src/feature/settings/bloc/settings_bloc.dart';

/// States for the [SettingsBloc].
sealed class SettingsState extends _$SettingsStateBase {
  const SettingsState({required super.appTheme});

  /// Idle state for the [SettingsBloc].
  const factory SettingsState.idle({
    /// The current theme mode.
    required AppTheme appTheme,
  }) = _SettingsState$Idle;

  /// Processing state for the [SettingsBloc].
  const factory SettingsState.processing({
    /// The current theme mode.
    required AppTheme appTheme,
  }) = _SettingsState$Processing;

  /// Error state for the [SettingsBloc].
  const factory SettingsState.error({
    /// The current theme mode.
    required AppTheme appTheme,

    /// The error message.
    required Object cause,
  }) = _SettingsState$Error;
}

/// Idling state.
final class _SettingsState$Idle extends SettingsState {
  const _SettingsState$Idle({required super.appTheme});

  @override
  Object? get cause => null;
}

/// Processing.
final class _SettingsState$Processing extends SettingsState {
  const _SettingsState$Processing({required super.appTheme});

  @override
  Object? get cause => null;
}

/// Error state.
final class _SettingsState$Error extends SettingsState {
  const _SettingsState$Error({required super.appTheme, required this.cause});

  @override
  final Object cause;
}

/// Base class for [SettingsState].
abstract base class _$SettingsStateBase {
  const _$SettingsStateBase({required this.appTheme});

  /// The current theme mode.
  final AppTheme appTheme;

  /// The error message.
  abstract final Object? cause;

  /// If an error has occured.
  bool get hasError => cause != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _$SettingsStateBase &&
        other.appTheme == appTheme &&
        other.cause == cause;
  }

  @override
  int get hashCode => appTheme.hashCode ^ cause.hashCode;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('SettingsState(')
      ..write('appTheme: $appTheme');
    if (cause != null) buffer.write(', cause: $cause');
    buffer.write(')');
    return buffer.toString();
  }
}