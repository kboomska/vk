import 'package:flutter/material.dart';

import 'package:vk/src/feature/app/widget/material_context.dart';
import 'package:vk/src/feature/initialization/logic/initialization_processor.dart';
import 'package:vk/src/feature/initialization/model/dependencies.dart';
import 'package:vk/src/feature/initialization/widget/dependencies_scope.dart';
import 'package:vk/src/feature/settings/widget/settings_scope.dart';

/// [App] is an entry point to the application.
class App extends StatelessWidget {
  const App({required this.result, super.key});

  /// The initialization result from the [InitializationProcessor]
  /// which contains initialized dependencies.
  final InitializationResult result;

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      dependencies: result.dependencies,
      child: SettingsScope(
        settingsBloc: result.dependencies.settingsBloc,
        child: const MaterialContext(),
      ),
    );
  }
}
