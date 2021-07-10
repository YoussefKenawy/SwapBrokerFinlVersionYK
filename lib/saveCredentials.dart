import 'package:shared_preferences/shared_preferences.dart';

Future<void> setEmail(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("email", value);
}

Future<String> getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    return prefs.getString("email");
  } on Exception catch (e) {
    print(e);
    return "";
  }
}

Future<void> setPassword(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("password", value);
}

Future<String> getPassword() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    return prefs.getString("password");
  } on Exception catch (e) {
    print(e);
    return "";
  }
}

saveCredentials({String email, String password}) async {
  await setEmail(email);
  await setPassword(password);
}

removeCredentials() async {
  await setEmail("");
  await setPassword("");
}
