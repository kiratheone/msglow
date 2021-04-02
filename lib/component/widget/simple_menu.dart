import 'package:flutter/material.dart';
import 'package:msglow/component/widget/app_style.dart';

class SimpleMenu extends StatelessWidget {
  final Function onTap;
  final String filename;
  final String title;
  final Color textColor;
  final IconData icon;
  final Color iconColor;

  const SimpleMenu({Key key, this.onTap, this.filename, this.title, this.textColor = Colors.black, this.icon, this.iconColor = AppStyle.primary}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric( vertical: 8),
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: filename != null ? Image.asset('assets/icons/$filename.png') : Icon(icon, color: iconColor),
            ),
            SizedBox(width: 16),
            Text( title ,
              style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
    );
  }
}