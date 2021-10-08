import 'dart:async';

import 'package:aims/ui/widgets/green_circle.dart';
import 'package:aims/ui/widgets/purple_circle.dart';
import 'package:aims/ui/widgets/yellow_circle.dart';

import 'package:aims/ui/screens/splash/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      onModelReady: (h) {
        Timer(Duration(seconds: 3), () {
          // context.router.replace(const Login());
          h.moveToNextPage(context);
        });
      },
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, child) => Scaffold(
          body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                    width: size.width,
                    height: size.height,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         colorFilter: ColorFilter.srgbToLinearGamma(),
                    //         fit: BoxFit.fitHeight,
                    //         image: AssetImage('assets/images/background.jpg'))),
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.asset(
                          //   'assets/images/gunscope.png',
                          //   height: 20,
                          // ),
                          Icon(Icons.circle_outlined, color: Colors.red),
                          Text('AIMS',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700)),
                        ],
                      )),
                    )),
              ],
            ),
          ),
          YellowCircle(
            size: size,
            height: 12,
            width: 12,
            bottom: 100,
            left: 10,
          ),
          YellowCircle(
            size: size,
            height: 20,
            width: 12,
            top: 100,
            left: 50,
          ),

          // GreenCircle(
          //   size: size,
          //   height: 10,
          //   width: 40,
          //   top: 500,
          //   left: 100,
          // ),
          GreenCircle(
            size: size,
            height: 40,
            width: 12,
            top: 200,
            left: 300,
          ),
          GreenCircle(
            size: size,
            height: 50,
            width: 50,
            top: 400,
            // left: 100,
            right: 20,
          ),
          // GreenCircle(
          //   size: size,
          //   height: 15,
          //   width: 15,
          //   top: 400,
          //   left: 20,
          // ),
          GreenCircle(
            size: size,
            height: 100,
            width: 100,
            top: 600,
            left: 50,
          ),
          // GreenCircle(
          //   size: size,
          //   height: 10,
          //   width: 12,
          //   top: 500,
          //   left: 100,
          // ),
          // YellowCircle(
          //   size: size,
          //   height: 12,
          //   width: 12,
          //   bottom: 100,
          //   left: 10,
          // ),
          // YellowCircle(
          //   size: size,
          //   height: 12,
          //   width: 12,
          //   bottom: 100,
          //   left: 10,
          // ),
          YellowCircle(
            size: size,
            height: 50,
            width: 50,
            bottom: 200,
            left: 150,
          ),
          GreenCircle(
            size: size,
            height: 15,
            width: 15,
            top: 100,
            left: 150,
          ),
          GreenCircle(
            size: size,
            height: 15,
            width: 15,
            top: 400,
            left: 300,
          ),
          PurpleCircle(
            size: size,
            height: 15,
            width: 15,
            top: 350,
            left: 100,
          ),
          PurpleCircle(
            size: size,
            height: 60,
            width: 60,
            top: 100,
            left: 300,
          ),
          YellowCircle(
            size: size,
            height: 35,
            width: 35,
            top: 200,
            left: 100,
          ),
        ],
      )),
    );
  }
}
