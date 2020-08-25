import 'package:flutter/material.dart';
import 'package:user_preferences/src/share_prefs/user_preferences.dart';
import 'package:user_preferences/src/widgets/drawer.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'conf';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;

  TextEditingController _controller;
  final prefs = new UserPreferences();

  @override
  void initState() { 
    super.initState();
    prefs.lastPage = SettingsPage.routeName;
    _colorSecundario = prefs.colorSecundario;
    _genero = prefs.genero;
    _controller = new TextEditingController(text: prefs.userName);
  }

  _setSelectedRadio(int value) {
    prefs.genero = value;
    _genero = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.blue : Colors.teal,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.5, fontWeight: FontWeight.bold),),
          ),

          Divider(),

          SwitchListTile(
            value: _colorSecundario, 
            title: Text('Color Secundario'),
            onChanged: (value) {
              _colorSecundario = value;
              prefs.colorSecundario = _colorSecundario;
              setState(() {});
            }
          ),

          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
          ),

          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
          ),

          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.name,
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre completo',
              ),
              onChanged: (value) {
                prefs.userName = value;
              },
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}