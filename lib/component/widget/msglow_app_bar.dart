import 'package:flutter/material.dart';
import 'package:msglow/component/widget/app_style.dart';

class MsGlowAppBar extends StatelessWidget  implements PreferredSizeWidget {

  final String title;
  final List<Widget> actions;
  final Widget leading;
  final bool automaticallyImplyLeading;

  const MsGlowAppBar({Key key, this.title, this.actions, this.leading, this.automaticallyImplyLeading = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          alignment: Alignment.centerLeft,
          child: Text(title, style: AppStyle.texStyle16Bold(textColor: AppStyle.textColor2)),
        ),
      ),
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(80.0);
}
