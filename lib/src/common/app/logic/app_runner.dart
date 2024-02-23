import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:vk/src/common/app/widget/app.dart';
import 'package:vk/src/feature/initialization/logic/initialization_processor.dart';

/// A class which is responsible for initialization and running the app.
final class AppRunner {
  const AppRunner();

  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    // Preserve splash screen
    binding.deferFirstFrame();

    final initializationProcessor = InitializationProcessor();

    Future<void> initializeAndRun() async {
      try {
        final result = await initializationProcessor.initialize();
        log(result.toString());
        // Attach this widget to the root of the tree.
        runApp(App(result: result));
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
