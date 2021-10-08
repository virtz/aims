import 'package:flutter/material.dart';

class PurpleCircle extends StatelessWidget {
  const PurpleCircle({
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
                Color(0xFFCF9FFF),
                Color(0xFFC3B1E1),
                Color(0xFFDA70D6),
                Color(0xFF7F00FF),
                Colors.purple.shade700
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            // color: Colors.pink
          ),
        ));
  }
}
