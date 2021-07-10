import 'package:shared_preferences/shared_preferences.dart';

Future<void> setIsRememberMe(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("isRememberMe", value);
}

Future<bool> getIsRememberMe() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    return prefs.getBool("isRememberMe");
  } on Exception catch (e) {
    print(e);
    return false;
  }
}
