import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VK',
      debugShowCheckedModeBanner: false,
      // TODO(kboomska): implement localization
      localizationsDelegates: const <LocalizationsDelegate<Object?>>[],
      // TODO(kboomska): implement theme
      theme: ThemeData.light(),
      home: const Placeholder(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
