import 'package:bunny/models/listing_reproductions_model.dart';
import 'package:bunny/models/reproduction_model.dart';
import 'package:bunny/repositories/list_reproductions_repository/listing_reproductions_repository.dart';
import 'package:bunny/repositories/listing_repository/listing_repository.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:flutter/material.dart';

class ListingReproductionsController {
  final ListingReproductionsRepository _listingReproductionsRepository;

  ListingReproductionsController(this._listingReproductionsRepository) {
    fetch();
  }

  late ValueNotifier<List<listingreproduction>?> show =
      ValueNotifier<List<listingreproduction>?>(null);
  fetch() async {
    var adicionadoPorId = await PrefService.getIdUser('ID');
    show.value =
        await _listingReproductionsRepository.getReproductions(adicionadoPorId);
  }
}
