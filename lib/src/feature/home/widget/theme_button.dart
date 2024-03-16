import 'package:flutter/material.dart';

/// Theme switch button widget
class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.onTap,
  });

  final Color? primaryColor;
  final Color? secondaryColor;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(50),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Text(
              'TAP',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
