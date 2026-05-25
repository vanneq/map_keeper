import 'package:place_on_map/core/hive/models/place_model.dart';

sealed class PlaceState {}

class PlaceInitial extends PlaceState {}

class PlaceError extends PlaceState {
  final String message;
  PlaceError({required this.message});
}

class PlaceIsEmpty extends PlaceState {}

class PlaceLoaded extends PlaceState {
  final List<PlaceModel> placeList;
  PlaceLoaded({required this.placeList});
}
