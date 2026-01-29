import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  HiveService._();

  static const String _usersBoxName = 'users';
  static const String _sessionBoxName = 'session';
  static const String _sessionKey = 'current_user_email';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<Map>(_usersBoxName);
    await Hive.openBox<String>(_sessionBoxName);
  }

  static Box<Map> _usersBox() => Hive.box<Map>(_usersBoxName);
  static Box<String> _sessionBox() => Hive.box<String>(_sessionBoxName);

  static bool userExists(String email) {
    return _usersBox().containsKey(email.toLowerCase());
  }

  static Map? getUser(String email) {
    return _usersBox().get(email.toLowerCase());
  }

  static Future<void> saveUser({
    required String name,
    required String email,
    required String password,
  }) async {
    await _usersBox().put(email.toLowerCase(), {
      'name': name,
      'email': email.toLowerCase(),
      'password': password,
    });
  }

  static Future<void> setCurrentUser(String email) async {
    await _sessionBox().put(_sessionKey, email.toLowerCase());
  }

  static String? getCurrentUserEmail() {
    return _sessionBox().get(_sessionKey);
  }

  static String? getCurrentUserName() {
    final email = getCurrentUserEmail();
    if (email == null) return null;
    final user = getUser(email);
    return user?['name'] as String?;
  }
}
