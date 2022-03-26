import 'package:bunny/models/estatisticas_model.dart';

abstract class StaticsRepository {
  Future<List<estatisticas>?>? getStatics(String id);
}
