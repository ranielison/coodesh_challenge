import 'package:coodesh_challenge_f2/app/controllers/home_controller.dart';
import 'package:coodesh_challenge_f2/app/providers/user_provider.dart';
import 'package:coodesh_challenge_f2/app/repositories/user_repository.dart';
import 'package:coodesh_challenge_f2/app/views/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  GetIt getIt = GetIt.I;
  getIt.registerSingleton<UserRepository>(
    UserRepository(
      UserProvider(
        dio: Dio(),
      ),
    ),
  );

  getIt.registerSingleton<HomeController>(HomeController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharma Inc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF003461),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashView(),
    );
  }
}
