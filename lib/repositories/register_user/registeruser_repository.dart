import 'package:bunny/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel?>? createuser(String nome, String contacto, String email,
      String senha, String tipo_usuario, String ano_nascimento, String sexo);
}
