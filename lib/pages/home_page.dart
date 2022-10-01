// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_example/classes/language.dart';
import 'package:flutter_example/classes/language_constants.dart';
import 'package:flutter_example/main.dart';
import 'package:flutter_example/router/route_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).homePage),
        actions: [
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
      drawer: Drawer(
        child: _drawerList(theme),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: _mainForm(context, theme),
      ),
    );
  }

  Form _mainForm(BuildContext context, ThemeData theme) {
    return Form(
      key: _key,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(
                translation(context).personalInformation,
                textAlign: TextAlign.center,
                style: theme.textTheme.headline5,
              ),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value != null && value.isEmpty) {
                return translation(context).requiredField;
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: translation(context).name,
              hintText: translation(context).nameHint,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            validator: (value) {
              if (value != null && value.isEmpty) {
                return translation(context).requiredField;
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: translation(context).email,
              hintText: translation(context).emailHint,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: translation(context).dateOfBirth,
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(DateTime.now().year + 20),
              );
            },
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              if (_key.currentState != null && _key.currentState!.mounted) {
                _showSuccessDialog();
              }
            },
            minWidth: double.infinity,
            height: 50,
            color: theme.primaryColor,
            child: Text(
              translation(context).submitInfo,
              style: theme.textTheme.headline5!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Container _drawerList(ThemeData theme) {
    TextStyle textStyle = theme.textTheme.headline6!.copyWith(
      color: Colors.white,
    );
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: SizedBox(
              height: 100,
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).aboutUs,
              style: textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).settings,
              style: textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}
