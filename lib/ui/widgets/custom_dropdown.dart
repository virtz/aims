import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final Widget? child;
  final String? label;
  final color;
  CustomDropdown({
    @required this.child,
    this.label,
    this.color,
  }) : super();

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.label ?? '',
            style: TextStyle(
                fontSize: 15.5,
                color: widget.color == null ? Colors.black : widget.color),
          ),
          SizedBox(height: size.height * 0.02),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding:
                  EdgeInsets.only(top: 15, bottom: 10, right: 20, left: 12),
              width: double.infinity,
              // padding: EdgeInsets.symmetric(horizontal: 10,),
              height: 60,
              // margin: EdgeInsets.only(bottom: 35),
              decoration: BoxDecoration(color: Colors.grey),

              child: DropdownButtonHideUnderline(
                  child: widget.child ?? Container()),
            ),
          ),
          SizedBox(height: size.height * 0.02),
        ]);
  }
}
