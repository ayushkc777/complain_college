import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  // LOGIN (Sprint 4)
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return 'success';
      }

      final data = jsonDecode(response.body);
      return data['error'] ?? 'Login failed';
    } catch (e) {
      return 'Network error';
    }
  }

  // REGISTER (ReqRes mock)
  Future<String> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return 'success';
      }

      final data = jsonDecode(response.body);
      return data['error'] ?? 'Registration failed';
    } catch (e) {
      return 'Network error';
    }
  }
}
