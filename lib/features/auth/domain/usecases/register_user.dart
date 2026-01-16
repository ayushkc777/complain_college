import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<User> execute(String name, String email, String password) {
    return repository.register(name: name, email: email, password: password);
  }
}
