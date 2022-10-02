import 'package:flutter/material.dart';
import 'package:flutter_example/classes/language_constants.dart';
import 'package:flutter_example/widgets/custom_text_button.dart';
import 'package:flutter_example/widgets/form_input.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? username;
  String? password;

  String? get _errorTextusername {
    if (username != null) {
      if (username == '') {
        return 'This field is required.';
      }
      if (RegExp(r'(^\s)|(\s$)').hasMatch(username!)) {
        return 'Shouldn\'t start with a blank. or shouldn\'t end with a space.';
      }
      if (RegExp(r'^[0-9]').hasMatch(username!)) {
        return 'Shouldn\'t start with a number.';
      }
      if (RegExp(r'[ก-ฮ]').hasMatch(username!)) {
        return 'Please use the English language only';
      }
      if (RegExp(r'[^a-zA-Z0-9]').hasMatch(username!)) {
        return 'Cannot use special characters or blank space';
      }
      if (username!.length > 50) {
        return 'Length of text must be between 1-50';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translation(context).username_or_email_title,
            style: theme.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 7),
          FormTextInput(
            errorText: _errorTextusername,
            defaultValue: username,
            hintText: translation(context).username_or_email_hint,
            onChanged: (value) {
              setState(() {
                username = value;
              });
            },
          ),
          const SizedBox(height: 15),
          Text(
            translation(context).password_title,
            style: theme.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 7),
          FormTextInput(
            defaultValue: password,
            hintText: translation(context).password_hint,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Spacer(),
              CustomTextButton(
                text: translation(context).forgot_password,
                textStyle: theme.textTheme.button!,
              ),
            ],
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () async {
              Navigator.of(context).pushReplacementNamed('home');
            },
            minWidth: double.infinity,
            height: 42,
            color: theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              translation(context).btn_sign_in,
              style: theme.textTheme.subtitle1!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
