import 'package:flutter/material.dart';
import 'package:flutter_example/pages/home_page.dart';
import 'package:flutter_example/pages/login_page.dart';
import 'package:flutter_example/pages/settings_page.dart';
import 'package:routemaster/routemaster.dart';

final routes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginPage()),
  '/home': (_) => const MaterialPage(child: HomePage()),
  '/settings': (_) => const MaterialPage(child: SettingsPage()),
});
