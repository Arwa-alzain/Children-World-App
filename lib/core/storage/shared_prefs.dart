import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static final SharedPrefs _instance = SharedPrefs._internal();

  late SharedPreferences _prefs;

  SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  Future<void> init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key){
    return _prefs.getString(key);
  }

  Future<void> setString(String key, String value) => _prefs.setString(key, value);

  Future<void> clear() => _prefs.clear();
}