import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{

  static Future<void> setAuthToken(String token) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  static Future<void> removeAuthToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }

  static Future<String?> getAuthToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }

  static Future<void> setUserId(String userId) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userId", userId);
  }

  static Future<void> removeUserId() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("userId");
  }

  static Future<String?> getUserId() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    return userId;
  }
}