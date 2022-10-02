import 'package:flutter/material.dart';
import 'package:flutter_example/classes/language_constants.dart';
import 'package:flutter_example/widgets/change_language_button.dart';
import 'package:flutter_example/widgets/custom_on_click.dart';
import 'package:flutter_example/widgets/form_login.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ChangeLanguageButton(),
            const SizedBox(height: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(translation(context).welcome_title,
                    style: theme.textTheme.headline3!.copyWith(
                      color: const Color(0xFF323232),
                    )),
                Text(
                  translation(context).sign_in_to_continue_title,
                  style: theme.textTheme.headline6!.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 100),
            const FormLogin(),
            const SizedBox(height: 20),
            Row(
              children: [
                _divider(),
                const SizedBox(width: 10),
                Text(
                  translation(context).or,
                  style: theme.textTheme.headline6!.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                _divider(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Ionicons.logo_facebook,
                  color: Color(0xFF3A559F),
                  size: 48,
                ),
                SizedBox(width: 30),
                Icon(
                  Ionicons.logo_google,
                  size: 48,
                  color: Color(0xFFF44336),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translation(context).no_account_label,
                  style: theme.textTheme.button!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 15),
                CustomOnClick(
                  onTap: () {},
                  child: Text(
                    translation(context).btn_sign_up,
                    style: theme.textTheme.button!.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded _divider() {
    return Expanded(
      child: Divider(
        color: Colors.grey.shade300,
        thickness: 1.5,
      ),
    );
  }
}
