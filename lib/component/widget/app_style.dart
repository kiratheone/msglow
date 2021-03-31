import 'package:flutter/material.dart';

class AppStyle {
  static const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFFCEEF3),
    100: Color(0xFFF7D5E0),
    200: Color(0xFFF2B9CC),
    300: Color(0xFFEC9CB7),
    400: Color(0xFFE887A7),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFFE16A90),
    700: Color(0xFFDD5F85),
    800: Color(0xFFD9557B),
    900: Color(0xFFD1426A),
  });
  static const int _primaryPrimaryValue = 0xFFE47298;

  static const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_primaryAccentValue),
    400: Color(0xFFFFBECF),
    700: Color(0xFFFFA4BC),
  });
  static const int _primaryAccentValue = 0xFFFFF1F4;
  static const Color primaryDark = Color(0xFFD1426A);
  static const Color textColor = Color(0xFF8CA2AD);
  static const Color textColor2 = Color(0xFF223263);
  static const Color textColor3 = Color(0xFF759298);
  static const Color textColor4 = Color(0xFFEA7272);
  static const Color backgroundGray = Color(0xFFC4C4C4);
  static const Color backgroundRed = Color(0xFFBF2520);

  static TextStyle textBody({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle10({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle10Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: textColor
    );
  }

  static TextStyle texStyle12({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle12Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: textColor
    );
  }

  static TextStyle texStyle14({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle14Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: textColor
    );
  }

  static TextStyle texStyle16({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle16Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: textColor
    );
  }

  static TextStyle texStyle18({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle18Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor
    );
  }

  static TextStyle texStyle20({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle20Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor
    );
  }

  static TextStyle texStyle24({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle24Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textColor
    );
  }

  static TextStyle texStyle28({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle28Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: textColor
    );
  }

  static TextStyle texStyle32({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: textColor
    );
  }

  static TextStyle texStyle32Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textColor
    );
  }

  static BorderRadiusGeometry borderRadiusVerySmall() => BorderRadius.circular(4.0);
  static BorderRadiusGeometry borderRadiusSmall() => BorderRadius.circular(8.0);
  static BorderRadiusGeometry borderRadiusMedium() => BorderRadius.circular(20.0);

  static InputDecoration textInputDecorator({String hint, Widget icon, Widget iconSuffix, Color enableBorderColor, Color focusBorderColor }) =>
      InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: icon != null ? Container(
          height: 40,
          width: 40,
          child: icon,
          padding: EdgeInsets.all(14),
        ) : null,
        suffixIcon: iconSuffix != null ? Container(
          height: 40,
          width: 40,
          child: iconSuffix,
          padding: EdgeInsets.all(14),
        ) : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusVerySmall(),
          borderSide: BorderSide(color: enableBorderColor ?? Colors.grey[200], width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusVerySmall(),
          borderSide: BorderSide(color: focusBorderColor ?? Colors.grey, width: 2),
        ),
      );
}


enum AppPrimaryButtonType {
  normal, dark
}

class AppPrimaryButton extends StatelessWidget {

  final Function onPressed;
  final String title;
  final AppPrimaryButtonType type;

  const AppPrimaryButton({Key key, this.onPressed, this.title, this.type = AppPrimaryButtonType.normal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: AppStyle.borderRadiusVerySmall(),
      ),
      onPressed: onPressed,
      color: type == AppPrimaryButtonType.normal ? AppStyle.primary : AppStyle.primaryDark,
      child: Text(
        title,
        style: AppStyle.texStyle14Bold(textColor: Colors.white),
      ),
    );
  }
}
