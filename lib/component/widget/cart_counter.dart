
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:msglow/component/widget/app_style.dart';

typedef void CounterChangeCallback(num value);

class CartCounter extends StatelessWidget {

  final CounterChangeCallback onChanged;

  CartCounter({
    Key key,
    @required num initialValue,
    @required this.minValue,
    @required this.maxValue,
    @required this.onChanged,
    this.step = 1,
    this.buttonSize = 25,
    this.iconSize = 18,
  })  : assert(initialValue != null),
        assert(minValue != null),
        assert(maxValue != null),
        assert(maxValue > minValue),
        assert(initialValue >= minValue && initialValue <= maxValue),
        assert(step > 0),
        selectedValue = initialValue,
        super(key: key);

  ///min value user can pick
  final num minValue;

  ///max value user can pick
  final num maxValue;

  /// decimal places required by the counter
  final int decimalPlaces = 0;

  ///Currently selected integer value
  final num selectedValue;

  /// if min=0, max=5, step=3, then items will be 0 and 3.
  final num step;

  /// indicates the color of fab used for increment and decrement
  final Color color = AppStyle.primary;

  final double buttonSize;

  final double iconSize;

  void _incrementCounter() {
    if (selectedValue + step <= maxValue) {
      onChanged((selectedValue + step));
    }
  }

  void _decrementCounter() {
    if (selectedValue - step >= minValue) {
      onChanged((selectedValue - step));
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final customColor = color ?? themeData.accentColor;

    return new Container(
      decoration: BoxDecoration(
        borderRadius: AppStyle.borderRadiusSmall(),
        border: Border.all(color: Colors.grey)
      ),

      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _decrementCounter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.remove, size: iconSize,color: Colors.black),
            ),
          ),
          new Container(
            color: AppStyle.primary,
            padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 4),
            child: new Text(
                '${num.parse((selectedValue).toStringAsFixed(decimalPlaces))}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
            ),
          ),
          InkWell(
            onTap: _incrementCounter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.add, size: iconSize,color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}