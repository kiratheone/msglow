import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:msglow/component/app_const.dart';
import 'package:msglow/component/widget/app_style.dart';
import 'package:msglow/component/widget/msglow_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _bodyContent(),
    );
  }

  Widget _appBar() => MsGlowAppBar(
    title: "Profile",
    leading: IconButton(
      onPressed: ()=> Navigator.pop(context),
      icon: Icon(Icons.arrow_back_ios, color: AppStyle.black72,),
    ),
  );

  Widget _bodyContent() => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        _avatarInfo(),
        SizedBox(height: 32),
        _itemProfile(
          icon: Icons.report_gmailerrorred_outlined,
          label: "Gender",
          title: "Female"
        ),
        SizedBox(height: 32),
        _itemProfile(
            icon: Icons.date_range,
            label: "Birthday",
            title: "12-12-2000"
        ),
        SizedBox(height: 32),
        _itemProfile(
            icon: Icons.mail_outline_rounded,
            label: "Birthday",
            title: "12-12-2000"
        ),
        SizedBox(height: 32),
        _itemProfile(
            icon: Icons.phone_android,
            label: "Phone Number",
            title: "088912739123"
        ),
        SizedBox(height: 32),
        _itemProfile(
            icon: Icons.lock_outline,
            label: "Change password",
            title: "•••••••••••••••••"
        ),
      ],
    ),
  );

  Widget _itemProfile({IconData icon, label, title}){
    return Row(
      children: [
        Icon(icon, color: AppStyle.accent),
        SizedBox(width: 16),
        Text(label, style: AppStyle.texStyle14Bold(textColor: AppStyle.textColor2)),
        Spacer(),
        Text(title, style: AppStyle.texStyle14(textColor: Colors.grey)),
        SizedBox(width: 12),
        Icon(Icons.arrow_forward_ios, color: Colors.grey,)
      ],
    );
  }

  Widget _avatarInfo() => Row(
    children: [
      CircleAvatar(
        radius: 50,
        backgroundImage: CachedNetworkImageProvider(AppConst.dummyAvatar),
      ),
      SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sukro", style: AppStyle.texStyle16Bold(textColor: AppStyle.textColor2)),
          SizedBox(height: 4),
          Text("@sukro", style: AppStyle.texStyle14Bold(textColor: Colors.grey))
        ],
      )
    ],
  );

}
