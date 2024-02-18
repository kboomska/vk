import 'package:flutter/material.dart';

/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VK',
      debugShowCheckedModeBanner: false,
      // TODO(kboomska): implement localization
      localizationsDelegates: const <LocalizationsDelegate<Object?>>[],
      // TODO(kboomska): implement theme
      theme: ThemeData.light(useMaterial3: true),
      home: const Placeholder(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
