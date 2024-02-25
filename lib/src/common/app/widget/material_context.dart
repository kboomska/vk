import 'package:flutter/material.dart';

import 'package:vk/src/common/app/model/app_theme.dart';
import 'package:vk/src/common/constant/configuration.dart';
import 'package:vk/src/feature/home/widget/home_screen.dart';

/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Configuration.appTitle,
      debugShowCheckedModeBanner: false,
      // TODO(kboomska): implement localization
      localizationsDelegates: const <LocalizationsDelegate<Object?>>[],
      // TODO(kboomska): implement theme
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomeScreen(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
