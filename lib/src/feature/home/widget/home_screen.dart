import 'package:flutter/material.dart';

import 'package:vk/src/feature/home/widget/theme_button.dart';

/// Simple HomeScreen Widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: ThemeButton(
          primaryColor: Theme.of(context).colorScheme.primary,
          secondaryColor: Theme.of(context).colorScheme.secondary,
          onTap: () {},
        ),
      ),
    );
  }
}
