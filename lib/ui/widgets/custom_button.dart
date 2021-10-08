import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Function? onPressed;
  final Color? bgColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? padding;
  final Color? borderColor;
  final double? borderSize;
  final double? marginTop;

  CustomButton(this.label,
      {this.width = double.infinity,
      this.height,
      this.onPressed,
      this.bgColor,
      this.textColor = Colors.white,
      this.fontSize = 15,
      this.padding = 10.0,
      this.borderColor,
      this.marginTop = 20.0,
      this.borderSize})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: marginTop ?? 0.0),
      child: SizedBox(
          height: height ?? 56.0,
          width: width ?? double.infinity,
          child: MaterialButton(
            padding: EdgeInsets.all(padding ?? 0.0),
            elevation: 0,
            color: bgColor ?? Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                side: BorderSide(
                    color: borderColor ?? Theme.of(context).primaryColor)),
            child: Text(
              label ?? '',
              style: TextStyle(
                  fontSize: fontSize, color: textColor ?? Colors.white),
            ),
            // textColor: Colors.green,
            onPressed: () {
              onPressed!();
            },
          )),
    );
  }
}
