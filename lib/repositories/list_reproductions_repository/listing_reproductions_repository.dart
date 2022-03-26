import 'package:bunny/models/listing_model.dart';
import 'package:bunny/models/listing_reproductions_model.dart';
import 'package:bunny/models/reproduction_model.dart';

abstract class ListingReproductionsRepository {
  Future<List<listingreproduction>?>? getReproductions(String id);
}
