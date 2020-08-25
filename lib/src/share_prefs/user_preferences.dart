
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  SharedPreferences _preferences;

  initPrefs() async {
    this._preferences = await SharedPreferences.getInstance();
  }

  // get & set del genero

  get genero {
    return _preferences.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _preferences.setInt('genero', value);
  }

  // get & set del color secundario

  get colorSecundario {
    return _preferences.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _preferences.setBool('colorSecundario', value);
  }

  // get & set del nombre de usuario

  get userName {
    return _preferences.getString('name') ?? 'Sin nombre';
  }

  set userName(String value) {
    _preferences.setString('name', value);
  }

  // get & set de la ultima pagina

  get lastPage {
    return _preferences.getString('lastPage') ?? '/';
  }

  set lastPage(String value) {
    _preferences.setString('lastPage', value);
  }
}