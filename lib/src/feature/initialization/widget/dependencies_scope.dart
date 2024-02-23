import 'package:flutter/material.dart';

import 'package:vk/src/common/utils/extensions/context_extension.dart';
import 'package:vk/src/feature/initialization/model/dependencies.dart';

/// A widget which is responsible for providing the dependencies.
class DependenciesScope extends InheritedWidget {
  const DependenciesScope({
    required super.child,
    required this.dependencies,
    super.key,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// Get the dependencies from the [context].
  static Dependencies of(BuildContext context) =>
      context.of<DependenciesScope>(listen: false).dependencies;

  @override
  bool updateShouldNotify(DependenciesScope oldWidget) => false;
}
