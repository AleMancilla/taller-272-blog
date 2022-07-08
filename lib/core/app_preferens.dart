import 'package:shared_preferences/shared_preferences.dart';

class AppPreferens {
  static final AppPreferens _instancia = AppPreferens._internal();

  factory AppPreferens() {
    return _instancia;
  }

  AppPreferens._internal();

  late SharedPreferences _prefs;

  initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // String get userName => _prefs.getString('pref_userName');
  // set userName(String data) {
  //   _prefs.setString('pref_userName', data);
  // }

  // String get userEmail => _prefs.getString('pref_userEmail');
  // set userEmail(String data) {
  //   _prefs.setString('pref_userEmail', data);
  // }

  // String get userId => _prefs.getString('pref_userId');
  // set userId(String data) {
  //   _prefs.setString('pref_userId', data);
  // }

  // String get userPhoto => _prefs.getString('pref_userPhoto');
  // set userPhoto(String data) {
  //   _prefs.setString('pref_userPhoto', data);
  // }
}
