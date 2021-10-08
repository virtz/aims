

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Color(0xFF009933),
    textColor: Colors.white,
    fontSize: 16.0
  );
}

showErrorToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
   // backgroundColor: Color(0xFFff3333),
   backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0
  );
}