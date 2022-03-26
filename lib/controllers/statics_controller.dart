import 'package:bunny/models/estatisticas_model.dart';
import 'package:bunny/repositories/statics_repository/statics_repository.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';

class StaticsController {
  final StaticsRepository _staticsRepository;

  StaticsController(this._staticsRepository) {
    fetch();
  }

  late ValueNotifier<List<estatisticas>?> show =
      ValueNotifier<List<estatisticas>?>(null);
  fetch() async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    show.value = await _staticsRepository.getStatics(adicionadoPorId);
  }
}
