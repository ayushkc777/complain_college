import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<User> execute(String email, String password) {
    return repository.login(email: email, password: password);
  }
}
