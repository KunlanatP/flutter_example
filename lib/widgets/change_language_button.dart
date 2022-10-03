// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_example/classes/language_constants.dart';
import 'package:flutter_example/main.dart';
import 'package:flutter_example/widgets/custom_text_button.dart';

void _changeLanguage(BuildContext context, String language) async {
  Locale locale = await setLocale(language);
  MyApp.setLocale(context, locale);
}

List<Widget> changeLanguageButton(BuildContext context) {
  return [
    Center(
      child: CustomTextButton(
        text: translation(context).english_code,
        onPressed: () => _changeLanguage(context, 'en'),
      ),
    ),
    const SizedBox(width: 10),
    const Center(
      child: Text(
        '|',
        style: TextStyle(color: Colors.black),
      ),
    ),
    const SizedBox(width: 10),
    Center(
      child: CustomTextButton(
        text: translation(context).thai_code,
        onPressed: () => _changeLanguage(context, 'th'),
      ),
    ),
    const SizedBox(width: 10),
  ];
}
