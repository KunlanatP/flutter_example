import 'package:flutter/material.dart';
import 'package:flutter_example/classes/language_constants.dart';
import 'package:flutter_example/pages/login_page.dart';
import 'package:flutter_example/widgets/change_language_button.dart';
import 'package:flutter_example/widgets/custom_on_click.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Stack(
          children: [
            const ChangeLanguageButton(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    translation(context).welcome_title,
                    style: theme.textTheme.headline3!.copyWith(
                      color: const Color(0xFF323232),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomOnClick(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text(translation(context).btn_back),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
