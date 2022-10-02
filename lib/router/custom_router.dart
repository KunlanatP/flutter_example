import 'package:flutter/material.dart';
import 'package:flutter_example/pages/about_page.dart';
import 'package:flutter_example/pages/home_page.dart';
import 'package:flutter_example/pages/login_page.dart';
import 'package:flutter_example/pages/not_found_page.dart';
import 'package:flutter_example/pages/settings_page.dart';
import 'package:flutter_example/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
