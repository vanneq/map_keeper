import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:place_on_map/core/cubit/place_cubit.dart';
import 'package:place_on_map/core/di/injection.dart';
import 'package:place_on_map/core/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PlaceCubit>(),
      child: CupertinoApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(fontFamily: '.SF UI Text'),
          ),
        ),
      ),
    );
  }
}
