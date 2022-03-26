import 'package:bunny/models/listing_model.dart';
import 'package:bunny/repositories/listing_repository/listing_repository.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';

class ListingController {
  final ListingRepository _listingRepository;

  ListingController(this._listingRepository) {
    fetch();
  }

  late ValueNotifier<List<listing>?> show = ValueNotifier<List<listing>?>(null);
  fetch() async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    show.value = await _listingRepository.getListing(adicionadoPorId);
  }
}

class ListingVendidosController {
  final ListingRepository _listingRepository;

  ListingVendidosController(this._listingRepository) {
    getVendidos();
  }

  late ValueNotifier<List<listing>?> show = ValueNotifier<List<listing>?>(null);

  getVendidos() async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    show.value = await _listingRepository.getListingForCategory(
        adicionadoPorId, 'vendido');
  }
}

class ListingMortosController {
  final ListingRepository _listingRepository;

  ListingMortosController(this._listingRepository) {
    getMortos();
  }

  late ValueNotifier<List<listing>?> show = ValueNotifier<List<listing>?>(null);

  getMortos() async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    show.value = await _listingRepository.getListingForCategory(
        adicionadoPorId, 'morto');
  }
}

class ListingImaturoController {
  final ListingRepository _listingRepository;

  ListingImaturoController(this._listingRepository) {
    getImaturo();
  }

  late ValueNotifier<List<listing>?> show = ValueNotifier<List<listing>?>(null);

  getImaturo() async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    show.value = await _listingRepository.getListingForCategory(
        adicionadoPorId, 'imaturo');
  }
}

class ListingAposetandaController {
  final ListingRepository _listingRepository;

  ListingAposetandaController(this._listingRepository) {
    getAposentados();
  }

  late ValueNotifier<List<listing>?> show = ValueNotifier<List<listing>?>(null);

  getAposentados() async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    show.value = await _listingRepository.getListingForCategory(
        adicionadoPorId, 'aposentado');
  }
}

class ListingAbatidosController {
  final ListingRepository _listingRepository;

  ListingAbatidosController(this._listingRepository) {
    getAbatidos();
  }

  late ValueNotifier<List<listing>?> show = ValueNotifier<List<listing>?>(null);

  getAbatidos() async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    show.value = await _listingRepository.getListingForCategory(
        adicionadoPorId, 'abatido');
  }
}

class ListingCruzamentoController {
  final ListingRepository _listingRepository;

  ListingCruzamentoController(this._listingRepository) {
    getCruzamento();
  }

  late ValueNotifier<List<listing>?> show = ValueNotifier<List<listing>?>(null);

  getCruzamento() async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    show.value = await _listingRepository.getListingForCategory(
        adicionadoPorId, 'cruzamento');
  }
}
