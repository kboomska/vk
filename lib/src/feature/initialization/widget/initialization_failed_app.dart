import 'package:flutter/material.dart';

/// InitializationFailedScreen widget
class InitializationFailedApp extends StatelessWidget {
  const InitializationFailedApp({
    required this.error,
    required this.stackTrace,
    this.retryInitialization,
    super.key,
  });

  /// The error that caused the initialization to fail.
  final Object error;

  /// The stack trace of the error that caused the initialization to fail.
  final StackTrace stackTrace;

  /// The callback that will be called when the retry button is pressed.
  ///
  /// If null, the retry button will not be shown.
  final Future<void> Function()? retryInitialization;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Initialization failed',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16.0),
                if (retryInitialization != null)
                  TextButton.icon(
                    onPressed: retryInitialization,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                const SizedBox(height: 16.0),
                Text(
                  '$error',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  '$stackTrace',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
