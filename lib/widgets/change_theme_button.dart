import 'package:flutter/material.dart';
import 'package:flutter_example/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Switch.adaptive(
      value: themeManager.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeManager>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
