import 'package:flutter/material.dart';

import 'package:vk/src/common/app/widget/material_context.dart';

/// [App] is an entry point to the application.
class App extends StatelessWidget {
  const App({super.key});

  // TODO(kboomska): initialization results contains initialized dependencies

  @override
  Widget build(BuildContext context) {
    // TODO(kboomska): implement dependencies scope
    return const MaterialContext();
  }
}
