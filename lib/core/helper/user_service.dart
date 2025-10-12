import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  UserService._();
  static const String _userNameKey = 'userName';
  static const String _userEmailKey = 'userEmail';
  static const String _userFirstNameKey = 'userFirstName';
  static const String _userLastNameKey = 'userLastName';

  // Save user data
  static Future<void> saveUserData({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userFirstNameKey, firstName);
    await prefs.setString(_userLastNameKey, lastName);
    await prefs.setString(_userEmailKey, email);
    await prefs.setString(_userNameKey, '$firstName $lastName');
  }

  // Get user name
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  // Get user first name
  static Future<String?> getUserFirstName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userFirstNameKey);
  }

  // Get user last name
  static Future<String?> getUserLastName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userLastNameKey);
  }

  // Get user email
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  // Clear user data
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userNameKey);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userFirstNameKey);
    await prefs.remove(_userLastNameKey);
  }
}
