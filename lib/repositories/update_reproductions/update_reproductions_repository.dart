import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/listing_reproductions_model.dart';

abstract class UpdateReproductionsRepository {
  Future<listingreproduction?>? updatereproduction(
      String nome_pai,
      String nome_mae,
      String DataColocarNinho,
      String DataDesmame,
      String DataProximoCruzamento,
      String DataRemoverNinho,
      String DataNascimento,
      String id,
      String IdUser);
}
