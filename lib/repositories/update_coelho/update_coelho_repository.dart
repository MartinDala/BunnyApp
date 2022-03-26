import 'package:bunny/models/addcoelho_model.dart';

abstract class UpdateCoelhoRepository {
  Future<AddCoelho?>? updatecoelho(
      String sexo,
      String nome,
      String cor,
      String adicionadoPor,
      String datanascimento,
      String status,
      String ninhada,
      String raca,
      String pai,
      String mae,
      String tiposangueneo,
      String id,
      String IdUser);
}
