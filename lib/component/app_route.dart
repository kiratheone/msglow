import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msglow/features/account/presenter/profile_screen.dart';
import 'package:msglow/features/auth/presenter/login/login_screen.dart';
import 'package:msglow/features/auth/presenter/register/register_screen.dart';
import 'package:msglow/features/home/presenter/main_screen.dart';
import 'package:msglow/features/home/presenter/search_screen.dart';

import '../main.dart';


class AppRoute {
  static const String defaultRoute = '/';
  static const String loginScreen = 'loginScreen';
  static const String registerScreen = 'registerScreen';
  static const String otpScreen = 'otpScreen';
  static const String homeScreen = 'homeScreen';
  static const String searchScreen = 'searchScreen';
  static const String profileScreen = 'profileScreen';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){

      case defaultRoute:
        return MaterialPageRoute(builder: (_) => RouteContainer());

      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case homeScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());

      case searchScreen:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      case profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}