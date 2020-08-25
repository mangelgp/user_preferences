import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/share_prefs/user_preferences.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userPrefs = new UserPreferences();
  await userPrefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  final userPrefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias de usuario',
      initialRoute: userPrefs.lastPage,
      routes: {
        HomePage.routeName        : (BuildContext context) => HomePage(),
        SettingsPage.routeName    : (BuildContext context) => SettingsPage(),
      },
    );
  }
}