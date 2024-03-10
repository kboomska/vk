import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vk/src/common/app/widget/app.dart';
import 'package:vk/src/common/utils/bloc_observer.dart';
import 'package:vk/src/feature/initialization/logic/initialization_processor.dart';
import 'package:vk/src/feature/initialization/widget/initialization_failed_app.dart';

/// A class which is responsible for initialization and running the app.
final class AppRunner {
  const AppRunner();

  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    // Setup bloc observer and transformer
    Bloc.observer = const AppBlocObserver();
    Bloc.transformer = bloc_concurrency.sequential();

    const initializationProcessor = InitializationProcessor();

    Future<void> initializeAndRun() async {
      try {
        // Preserve splash screen
        binding.deferFirstFrame();

        final result = await initializationProcessor.initialize().timeout(
              const Duration(minutes: 2),
            );
        log(result.toString());

        // Attach this widget to the root of the tree.
        runApp(App(result: result));
      } catch (error, stackTrace) {
        log('Initialization failed', error: error, stackTrace: stackTrace);
        runApp(
          InitializationFailedApp(
            error: error,
            stackTrace: stackTrace,
            retryInitialization: initializeAndRun,
          ),
        );
      } finally {
        // Closes splash screen, and show the app layout.
        binding.allowFirstFrame();
      }
    }

    // Run the app
    await initializeAndRun();
  }
}
