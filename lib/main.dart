import 'package:flutter/material.dart';
import 'package:msglow/component/widget/app_style.dart';

import 'component/app_const.dart';
import 'component/app_route.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConst.appName,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.defaultRoute,
      theme: ThemeData(
        primarySwatch: AppStyle.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

    );
  }
}

class RouteContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
