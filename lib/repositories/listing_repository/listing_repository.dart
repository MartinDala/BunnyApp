import 'package:bunny/models/listing_model.dart';

abstract class ListingRepository {
  Future<List<listing>?>? getListing(String id);

  Future<List<listing>?>? getListingForCategory(String id, String Categoria);

  Future<List<listing>?>? deleteListing();
}
