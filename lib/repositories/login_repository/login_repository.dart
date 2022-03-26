import 'package:bunny/models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel> login(String email, String password);
}
