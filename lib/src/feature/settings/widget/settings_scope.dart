import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vk/src/common/utils/extensions/context_extension.dart';
import 'package:vk/src/feature/app/model/app_theme.dart';
import 'package:vk/src/feature/settings/bloc/settings_bloc.dart';

/// A controller that holds and operates the app theme.
abstract interface class ThemeScopeController {
  /// Get the current [AppTheme].
  AppTheme get theme;

  /// Set the theme mode to [themeMode].
  void setThemeMode(ThemeMode themeMode);

  /// Switching [ThemeMode] between [ThemeMode.light] and [ThemeMode.dark].
  void switchThemeMode();
}

/// A controller that holds and operates the app settings.
abstract interface class SettingsScopeController
    implements ThemeScopeController {}

enum _SettingsScopeAspect {
  /// The theme aspect.
  theme,
}

/// Settings scope is responsible for handling settings-related stuff.
class SettingsScope extends StatefulWidget {
  const SettingsScope({
    required this.child,
    required this.settingsBloc,
    super.key,
  });

  /// The child widget.
  final Widget child;

  /// The [SettingsBloc] instance.
  final SettingsBloc settingsBloc;

  /// Get the [SettingsScopeController] of the closest [SettingsScope] ancestor.
  static SettingsScopeController of(
    BuildContext context, {
    bool listen = true,
  }) =>
      context.of<_InheritedSettingsScope>(listen: listen).controller;

  /// Get the [ThemeScopeController] of the closest [SettingsScope] ancestor.
  static ThemeScopeController themeOf(BuildContext context) => context
      .inheritFrom<_SettingsScopeAspect, _InheritedSettingsScope>(
        aspect: _SettingsScopeAspect.theme,
      )
      .controller;

  @override
  State<SettingsScope> createState() => _SettingsScopeState();
}

class _SettingsScopeState extends State<SettingsScope>
    implements SettingsScopeController {
  @override
  void setThemeMode(ThemeMode themeMode) => widget.settingsBloc.add(
        SettingsEvent.updateTheme(
          appTheme: AppTheme(mode: themeMode),
        ),
      );

  @override
  AppTheme get theme =>
      widget.settingsBloc.state.appTheme ?? AppTheme.defaultTheme;

  @override
  void switchThemeMode() {
    final currentThemeData = theme.computeThemeData();

    if (currentThemeData == theme.darkThemeData) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      bloc: widget.settingsBloc,
      builder: (context, state) => _InheritedSettingsScope(
        controller: this,
        state: state,
        child: widget.child,
      ),
    );
  }
}

class _InheritedSettingsScope extends InheritedModel<_SettingsScopeAspect> {
  const _InheritedSettingsScope({
    required this.controller,
    required this.state,
    required super.child,
  });

  final SettingsScopeController controller;
  final SettingsState state;

  @override
  bool updateShouldNotify(_InheritedSettingsScope oldWidget) =>
      state != oldWidget.state;

  @override
  bool updateShouldNotifyDependent(
    covariant _InheritedSettingsScope oldWidget,
    Set<_SettingsScopeAspect> dependencies,
  ) {
    bool shouldNotify = false;

    if (dependencies.contains(_SettingsScopeAspect.theme)) {
      shouldNotify = shouldNotify || state.appTheme != oldWidget.state.appTheme;
    }

    return shouldNotify;
  }
}
