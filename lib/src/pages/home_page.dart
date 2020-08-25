import 'package:flutter/material.dart';
import 'package:user_preferences/src/share_prefs/user_preferences.dart';
import 'package:user_preferences/src/widgets/drawer.dart';

class HomePage extends StatelessWidget {

  static final String routeName = '/';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {

    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Inicio"),
        backgroundColor: (prefs.colorSecundario) ? Colors.blue : Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${_checkColor()}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.userName}'),
          Divider(),
        ],
      ),
      drawer: MyDrawer(),
    );
  }

  String _checkColor() {
    if (prefs.colorSecundario == true) return 'Si';
    else return 'No';
  }
}