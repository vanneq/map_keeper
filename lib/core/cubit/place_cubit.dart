import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:place_on_map/core/hive/hive_service.dart';
import 'package:place_on_map/core/cubit/place_state.dart';
import 'package:place_on_map/core/hive/models/place_model.dart';

class PlaceCubit extends Cubit<PlaceState> {
  final HiveService _hiveService;

  PlaceCubit(this._hiveService) : super(PlaceInitial()) {
    loadPlaces();
  }

  Future<void> loadPlaces() async {
    emit(PlaceInitial());
    try {
      final places = await _hiveService.getAllPlace();
      if (places.isEmpty) {
        emit(PlaceIsEmpty());
      } else {
        emit(PlaceLoaded(placeList: places));
      }
    } catch (e) {
      emit(PlaceError(message: e.toString()));
    }
  }

  Future<void> addPlace(
    String title,
    double lat,
    double lng,
    DateTime createAt,
  ) async {
    try {
      final newPlace = PlaceModel(
        title: title,
        createAt: createAt,
        latitude: lat,
        longitude: lng,
      );
      await _hiveService.addNewPlace(newPlace);
      loadPlaces();
    } catch (e) {
      emit(PlaceError(message: e.toString()));
    }
  }

  Future<void> deletePlace(PlaceModel place) async {
    try {
      await _hiveService.deletePlace(place);
      loadPlaces();
    } catch (e) {
      emit(PlaceError(message: e.toString()));
    }
  }
}
