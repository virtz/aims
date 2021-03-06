import 'package:flutter/material.dart';

class YellowCircle extends StatelessWidget {
  const YellowCircle({
    Key? key,
    @required this.size,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.height,
    this.width,
  }) : super(key: key);

  final Size? size;
  final double? left;
  final double? right;
  // final double? top;
  final double? top;
  final double? bottom;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
         top:top,
        left: left,
         right:right,
        bottom: bottom,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFFF6DC79),
                Color(0xFFF9C87A),
                Color(0xFFFCB47B),
                Color(0XFFFFA17B),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            // color: Colors.pink
          ),
        ));
  }
}
