import 'package:flutter/material.dart';
import 'package:msglow/component/app_route.dart';
import 'package:msglow/component/widget/app_style.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

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
          Text("Let’s Get Started", style: AppStyle.texStyle18Bold(textColor: Colors.black)),
          SizedBox(height: 8),
          Text("Create an new account", style: AppStyle.texStyle14(textColor: AppStyle.textColor)),
          SizedBox(height: 32),
          _textInputFullName(),
          SizedBox(height: 12),
          _textInputUsername(),
          SizedBox(height: 12),
          _textInputPassword(),
          SizedBox(height: 12),
          _textInputRePassword(),
          SizedBox(height: 12),
          _loginButton(),
          SizedBox(height: 16),
          Row(
            children: [
              Spacer(),
              Text("Have an account? ", style: AppStyle.texStyle14(textColor: AppStyle.textColor)),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Text("Login", style: AppStyle.texStyle14Bold(textColor: AppStyle.primary)),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    ),
  );

  Widget _textInputFullName() => TextField(
    controller: _fullNameController,
    autocorrect: true,
    autofillHints: [AutofillHints.username],
    decoration: AppStyle.textInputDecorator(
        hint: "Full Name",
        icon: Icon(Icons.person, size: 20,)),
  );

  Widget _textInputUsername() => TextField(
    controller: _usernameController,
    autocorrect: true,
    autofillHints: [AutofillHints.username],
    decoration: AppStyle.textInputDecorator(
        hint: "Your Email",
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

  Widget _textInputRePassword() => TextField(
    controller: _rePasswordController,
    obscureText: true,
    autocorrect: true,
    autofillHints: [AutofillHints.username],
    decoration: AppStyle.textInputDecorator(
        hint: "Password Again",
        icon: Icon(Icons.lock_outline, size: 20,)),
  );

  Widget _loginButton() => Container(
    height: 50,
    width: double.infinity,
    child: AppPrimaryButton(
      title: "Sign Up",
      type: AppPrimaryButtonType.normal,
      onPressed: () => Navigator.pushNamed(context, AppRoute.homeScreen),
    ),
  );
}
