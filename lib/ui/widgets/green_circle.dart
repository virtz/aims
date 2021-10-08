import 'package:flutter/material.dart';

class GreenCircle extends StatelessWidget {
  const GreenCircle({
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
  final double? top;
  final double? bottom;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFF00FFFF),
                Color(0xFF7DF9FF),
                Color(0xFF98FB98),
                Color(0xFF0FFF50),
                Color(0xFF50C878),
                Color(0xFF2E8B57),
                Colors.green
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            // color: Colors.pink
          ),
        ));
  }
}
