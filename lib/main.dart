import 'package:flutter/material.dart';
import 'package:jwelery_kart/config/application.dart';
import 'package:jwelery_kart/config/routes.dart';
import 'package:jwelery_kart/pages/home/home_screen.dart';
import 'package:jwelery_kart/pages/onboarding/onboarding_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:jwelery_kart/pages/registration/registration_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        accentColor: Colors.orange,
        primaryColor: const Color(0xFFDE4435),
      ),
      onGenerateRoute: Application.router.generator,
      home: HomeScreen(),
    );
  }
}
