import 'dart:convert';

import 'package:flutter/material.dart' show ThemeMode;

import 'package:vk/src/common/utils/preferences_dao.dart';
import 'package:vk/src/feature/app/model/app_theme.dart';

/// [ThemeDataSource] is a data source that provides theme data.
///
/// This is used to set and get theme.
abstract interface class ThemeDataSource {
  /// Set theme.
  Future<void> setTheme(AppTheme theme);

  /// Get current theme from cache.
  Future<AppTheme?> getTheme();
}

final class ThemeDataSourceLocal extends PreferencesDao
    implements ThemeDataSource {
  const ThemeDataSourceLocal({
    required super.sharedPreferences,
    required this.codec,
  });

  /// Codec for [ThemeMode]
  final Codec<ThemeMode, String> codec;

  PreferencesEntry<String> get _themeMode => stringEntry('theme.mode');

  @override
  Future<void> setTheme(AppTheme theme) async {
    await _themeMode.set(codec.encode(theme.mode));
  }

  @override
  Future<AppTheme?> getTheme() async {
    final type = _themeMode.read();

    if (type == null) return null;

    return AppTheme(mode: codec.decode(type));
  }
}
