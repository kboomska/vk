import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:vk/src/common/app/widget/app.dart';

/// A class which is responsible for initialization and running the app.
final class AppRunner {
  const AppRunner();

  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    // Preserve splash screen
    binding.deferFirstFrame();

    Future<void> initializeAndRun() async {
      try {
        // TODO(kboomska): initialization before the application starts
        // Attach this widget to the root of the tree.
        runApp(const App());
      } catch (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        // TODO(kboomska): initialization failed screen
      } finally {
        // Allow rendering
        binding.allowFirstFrame();
      }
    }

    // Run the app
    await initializeAndRun();
  }
}
