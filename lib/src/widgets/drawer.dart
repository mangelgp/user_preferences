import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/share_prefs/user_preferences.dart';

class MyDrawer extends StatelessWidget {

  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),

          ListTile(
            leading: Icon(Icons.home, color: _setPrimaryColor(),),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),

          ListTile(
            leading: Icon(Icons.favorite, color: _setPrimaryColor(),),
            title: Text('Favoritos'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.party_mode, color: _setPrimaryColor(),),
            title: Text('Camara'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.settings, color: _setPrimaryColor(),),
            title: Text('Ajustes'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            }
          )
        ],
      ),
    );
  }

  _setPrimaryColor(){
    if (prefs.colorSecundario) return Colors.blue;
    else return Colors.teal;
  }
}