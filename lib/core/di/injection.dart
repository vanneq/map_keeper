import 'package:get_it/get_it.dart';
import 'package:place_on_map/core/cubit/place_cubit.dart';
import 'package:place_on_map/core/hive/hive_service.dart';

final GetIt sl = GetIt.instance;

void setupInjection() {
  sl.registerLazySingleton<HiveService>(() => HiveService());

  sl.registerFactory<PlaceCubit>(() => PlaceCubit(sl()));
}
