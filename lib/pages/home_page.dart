// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_example/classes/language.dart';
import 'package:flutter_example/classes/language_constants.dart';
import 'package:flutter_example/main.dart';
import 'package:flutter_example/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? translation(context).darkTheme
        : translation(context).lightTheme;

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).homePage),
        actions: [
          const ChangeThemeButtonWidget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(Icons.language, color: Colors.white),
              items: Language.languageList()
                  .map(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(e.flag, style: theme.textTheme.headline5),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (language) async {
                if (language != null) {
                  Locale locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, locale);
                }
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          text,
          style: theme.textTheme.headline5,
        ),
      ),
    );
  }
}

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
