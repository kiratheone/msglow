import 'package:flutter/material.dart';
import 'package:msglow/component/app_route.dart';
import 'package:msglow/component/widget/app_style.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 64),
          Center(child: Image.asset("assets/img/img_login_logo.png")),
          SizedBox(height: 16),
          Text("Welcome to Oryza MS Glow", style: AppStyle.texStyle18Bold(textColor: Colors.black)),
          SizedBox(height: 8),
          Text("Login", style: AppStyle.texStyle14(textColor: AppStyle.textColor)),
          SizedBox(height: 32),
          _textInputUsername(),
          SizedBox(height: 12),
          _textInputPassword(),
          SizedBox(height: 12),
          _loginButton(),
          SizedBox(height: 16),
          Text("Forgot Password?", style: AppStyle.texStyle14Bold(textColor: AppStyle.primary)),
          SizedBox(height: 8),
          Row(
            children: [
              Spacer(),
              Text("Don’t have an account? ", style: AppStyle.texStyle14(textColor: AppStyle.textColor)),
              InkWell(
                onTap: () => Navigator.pushNamed(context, AppRoute.registerScreen),
                child: Text("Register here", style: AppStyle.texStyle14Bold(textColor: AppStyle.primary)),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    ),
  );

  Widget _textInputUsername() => TextField(
    controller: _usernameController,
    autocorrect: true,
    autofillHints: [AutofillHints.username],
    decoration: AppStyle.textInputDecorator(
        hint: "Email",
        icon: Icon(Icons.email_outlined, size: 20,)),
  );


  Widget _textInputPassword() => TextField(
    controller: _passwordController,
    obscureText: true,
    autocorrect: true,
    autofillHints: [AutofillHints.username],
    decoration: AppStyle.textInputDecorator(
        hint: "Password",
        icon: Icon(Icons.lock_outline, size: 20,)),
  );

  Widget _loginButton() => Container(
    height: 50,
    width: double.infinity,
    child: AppPrimaryButton(
      title: "Log In",
      type: AppPrimaryButtonType.normal,
      onPressed: () => Navigator.pushNamed(context, AppRoute.homeScreen),
    ),
  );
}
