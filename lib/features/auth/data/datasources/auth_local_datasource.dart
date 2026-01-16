import 'package:hive/hive.dart';

class AuthLocalDatasource {
  static const String usersBoxName = 'usersBox';

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    final box = await Hive.openBox(usersBoxName);
    if (box.containsKey(email)) {
      return 'Email already exists';
    }
    await box.put(email, password);
    return 'Sign up successful';
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final box = await Hive.openBox(usersBoxName);
    final storedPassword = box.get(email);
    return storedPassword == password;
  }
}
