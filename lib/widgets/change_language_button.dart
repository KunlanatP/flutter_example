// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_example/classes/language_constants.dart';
import 'package:flutter_example/main.dart';
import 'package:flutter_example/widgets/custom_text_button.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          const Spacer(),
          CustomTextButton(
            text: translation(context).english_code,
            onPressed: () => _changeLanguage(context, 'en'),
          ),
          const SizedBox(width: 10),
          const Text('|'),
          const SizedBox(width: 10),
          CustomTextButton(
            text: translation(context).thai_code,
            onPressed: () => _changeLanguage(context, 'th'),
          ),
        ],
      ),
    );
  }

  void _changeLanguage(BuildContext context, String language) async {
    Locale locale = await setLocale(language);
    MyApp.setLocale(context, locale);
  }
}
