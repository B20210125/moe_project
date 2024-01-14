import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';

  static Future<void> saveSession(
      String userId, String userName, String userEmail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userIdKey, userId);
    prefs.setString(_userNameKey, userName);
    prefs.setString(_userEmailKey, userEmail);
  }

  static Future<Map<String, String>> getSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString(_userIdKey) ?? '';
    final String userName = prefs.getString(_userNameKey) ?? '';
    final String userEmail = prefs.getString(_userEmailKey) ?? '';

    return {'userId': userId, 'userName': userName, 'userEmail': userEmail};
  }

  static Future<void> clearSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_userIdKey);
    prefs.remove(_userNameKey);
    prefs.remove(_userEmailKey);
  }
}
