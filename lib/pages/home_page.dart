import 'package:flutter/material.dart';
import 'package:flutter_example/classes/language_constants.dart';
import 'package:flutter_example/widgets/change_language_button.dart';
import 'package:flutter_example/widgets/custom_on_click.dart';
import 'package:routemaster/routemaster.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: changeLanguageButton(context),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Stack(
          children: [
            // const ChangeLanguageButton(),
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
                      Routemaster.of(context).pop();
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
