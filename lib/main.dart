import 'package:flutter/material.dart';
import 'package:flutter_example/classes/language_constants.dart';
import 'package:flutter_example/router/custom_router.dart';
import 'package:flutter_example/router/route_constants.dart';
import 'package:flutter_example/theme/theme_constants.dart';
import 'package:flutter_example/theme/theme_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findRootAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() => _locale = locale);
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      builder: (context, _) {
        final themeManager = Provider.of<ThemeManager>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Example',
          theme: ThemeConstants.lightTheme,
          darkTheme: ThemeConstants.darkTheme,
          themeMode: themeManager.themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          onGenerateRoute: CustomRouter.generatedRoute,
          initialRoute: loginRoute,
        );
      },
    );
  }
}
