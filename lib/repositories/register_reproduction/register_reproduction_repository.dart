import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/reproduction_model.dart';

abstract class ReproductionRepository {
  Future<reproduction?>? createReprodution(
      String iduser,
      String pai,
      String mae,
      String dataColocarNinho,
      String dataDesmame,
      String dataProximoCruzamento,
      String dataRemoverNinho,
      String dataNascimento);
}
