import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late SharedPreferences _pref;

  static SharedPreferences get instance => _pref;

  static init() async {
    _pref = await SharedPreferences.getInstance();
  }
}
