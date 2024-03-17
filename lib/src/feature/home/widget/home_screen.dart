import 'package:flutter/material.dart';

import 'package:vk/src/feature/home/widget/theme_button.dart';
import 'package:vk/src/feature/settings/widget/settings_scope.dart';

/// Simple HomeScreen Widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Center(
        child: ThemeButton(
          primaryColor: colorScheme.primary,
          secondaryColor: colorScheme.secondary,
          onTap: () => SettingsScope.themeOf(context).switchThemeMode(),
        ),
      ),
    );
  }
}
