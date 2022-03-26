import 'package:bunny/models/addcoelho_model.dart';

abstract class CoelhoRepository {
  Future<AddCoelho?>? createcoelho(
      String sexo,
      String nome,
      String cor,
      String adicionadoPor,
      String datanascimento,
      String ninhada,
      String raca,
      String status,
      String pai,
      String mae,
      String tiposangueneo);
}
