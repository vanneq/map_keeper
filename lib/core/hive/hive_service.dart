import 'package:hive_flutter/adapters.dart';
import 'package:place_on_map/core/hive/models/place_model.dart';

class HiveService {
  Box<PlaceModel> get _box => Hive.box<PlaceModel>('places');

  Future<void> addNewPlace(PlaceModel place) async {
    _box.add(place);
  }

  Future<void> deletePlace(PlaceModel place) async {
    await place.delete();
  }

  Future<List<PlaceModel>> getAllPlace() async {
    return _box.values.toList();
  }
}
