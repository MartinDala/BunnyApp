import 'package:bunny/models/addcoelho_model.dart';
import 'package:bunny/models/listing_model.dart';

abstract class DeleteCoelhoRepository {
  Future<listing?> deletecoelho(String id);
}
