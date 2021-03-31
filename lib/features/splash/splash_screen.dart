import 'package:flutter/material.dart';
import 'package:msglow/component/app_route.dart';
import 'package:msglow/component/widget/app_style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primary,
      body: _body(),
    );
  }

  void _delay() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed(AppRoute.loginScreen);
  }

  Widget _body() => Column(
    children: [
      Expanded(child: Container()),
      Image.asset("assets/img/img_logo.png"),
      SizedBox(height: 16),
      Text("Oryza MS Glow", style: AppStyle.texStyle18Bold(textColor: Colors.white)),
      Expanded(child: Container()),
    ],
  );

}

