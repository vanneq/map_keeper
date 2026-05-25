import 'package:hive/hive.dart';

part 'place_model.g.dart';

@HiveType(typeId: 0)
class PlaceModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime createAt;

  @HiveField(2)
  double latitude;

  @HiveField(3)
  double longitude;

  PlaceModel({
    required this.title,
    required this.createAt,
    required this.latitude,
    required this.longitude,
  });
}
