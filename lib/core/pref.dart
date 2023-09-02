import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  SharedPreferences? prefs;

  Future<void> setLang(String lang) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs?.setString('language', lang);
  }

  Future<String> getLang() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs?.getString('language') ?? '';
  }

  Future<bool> hasLang() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs?.getBool('hasLang') ?? false;
  }

  Future<void> setHasLang(bool hasLang) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs?.setBool('hasLang', hasLang);
  }

  Future<bool> isFirst() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs?.getBool('isFirst') ?? true;
  }

  Future<void> setIsFirst(bool isFirst) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs?.setBool('isFirst', isFirst);
  }

  Future<String> getLocation() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs?.getString('location') ?? '';
  }
  Future<void> setLocation(String location) async {
    prefs ??= await SharedPreferences.getInstance();
    prefs?.setString('location', location);
  }

  Future<bool> hasLogged() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs?.getBool('hasLogged') ?? false;
  }

  Future<void> setHasLogged(bool hasLogged) async {
    prefs ??= await SharedPreferences.getInstance();
    prefs?.setBool('hasLogged', hasLogged);
  }

  Future<void> setUserData(String name, String number, String birthday) async {
    prefs ??= await SharedPreferences.getInstance();
    prefs?.setString('user', '$name#$number#$birthday');
  }

  Future<String> getUserData() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs?.getString('user') ?? '';
  }
}