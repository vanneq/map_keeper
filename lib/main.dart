import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:place_on_map/app.dart';
import 'package:place_on_map/core/di/injection.dart';
import 'package:place_on_map/core/hive/models/place_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PlaceModelAdapter());
  await Hive.openBox<PlaceModel>('places');

  setupInjection();

  runApp(const MyApp());
}
