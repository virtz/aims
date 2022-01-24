import 'package:aims/router/app_router.gr.dart';
import 'package:aims/ui/screens/welcome/welcome_view_model.dart';
import 'package:aims/ui/widgets/green_circle.dart';
import 'package:aims/ui/widgets/purple_circle.dart';
import 'package:auto_route/auto_route.dart';
import 'package:aims/ui/widgets/yellow_circle.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<WelcomeViewModel>.reactive(
      viewModelBuilder: () => WelcomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: Stack(
            children: [
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

              GreenCircle(
                size: size,
                height: 100,
                width: 100,
                top: 600,
                left: 50,
              ),

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
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Text('Welcome !',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text('${model.currentUser!.name}',
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              WelcomeCard(
                                size: size,
                                title: '${model.currentUser!.location}',
                                subtitle: "Location",
                                icon: Icons.location_on,
                                iconColor: Colors.purple,
                              ),
                              WelcomeCard(
                                size: size,
                                title: '${model.currentUser!.address}',
                                subtitle: "GPS Address",
                                icon: Icons.location_on,
                                iconColor: Colors.green,
                              ),
                              WelcomeCard(
                                size: size,
                                title: '${model.currentUser!.costCenter}',
                                subtitle: "Cost Center",
                                icon: Icons.location_on,
                                iconColor: Colors.yellow,
                              )
                            ],
                          )),
                      Expanded(flex: 1, child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: size.height * 0.13,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.purple,
              child: Row(
                children: [
                  Expanded(
                      flex: 6,
                      child: MaterialButton(
                          height: size.height,
                          // elevation: 3.0,
                          // color: Colors.grey,
                          onPressed: () {
                            AutoRouter.of(context).push(const DataAudit());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit,
                                  color: Theme.of(context).primaryColor),
                              Text('Data Audit',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor)),
                            ],
                          ))),
                  // Expanded(
                  //   flex:1,
                  //   child: Container()),
                  Expanded(
                      flex: 6,
                      child: MaterialButton(
                        height: size.height,
                        // elevation: 3.0,
                        // color: Colors.grey,
                        onPressed: () {
                          context.router.push( DataCapture());
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt,
                                color: Theme.of(context).primaryColor),
                            Text('Data Capture',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor)),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    Key? key,
    required this.size,
    this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  final Size size;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width - 120,
                        height: size.height * 0.03,
                        child: Text(
                          '$title',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text('$subtitle'),
                    ]),
                Icon(icon, color: iconColor)
              ],
            ),
          )),
    );
  }
}
