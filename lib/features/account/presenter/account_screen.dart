import 'package:flutter/material.dart';
import 'package:msglow/component/widget/app_style.dart';
import 'package:msglow/component/widget/simple_menu.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contentBody(),
    );

  }

  Widget _contentBody() => Column(
    children: [
      _header(),
      SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SimpleMenu(
          icon: Icons.person_outline,
          title: "Profile",
          onTap: (){},
          textColor: AppStyle.textColor2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SimpleMenu(
          icon: Icons.shopping_basket_outlined,
          title: "Order",
          onTap: (){},
          textColor: AppStyle.textColor2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SimpleMenu(
          icon: Icons.location_pin,
          title: "Address",
          onTap: (){},
          textColor: AppStyle.textColor2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SimpleMenu(
          icon: Icons.favorite,
          title: "Wishlist",
          onTap: (){},
          textColor: AppStyle.textColor2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SimpleMenu(
          icon: Icons.notifications_active,
          title: "Notification",
          onTap: (){},
          textColor: AppStyle.textColor2,
        ),
      )
    ],
  );

  Widget _header() => SafeArea(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      color: AppStyle.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/img/img_logo.png", width: 48, height: 48),
          SizedBox(width: 8),
          Text("Account", style: AppStyle.texStyle24Bold(textColor: Colors.white))
        ],
      ),
    ),
  );
}
