import 'package:aims/ui/screens/start/start_view_model.dart';
import 'package:aims/ui/widgets/custom_button.dart';
import 'package:aims/ui/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
// import 'package:aims/router/app_router.gr.dart';

import 'package:stacked/stacked.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  String? selectedCostCenter;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<StartViewModel>.reactive(
      viewModelBuilder: () => StartViewModel(),
      onModelReady: (model) {
        model.getLocations();
        model.getCostCenters();
        model.getPosition();

        model.getParameters();
        model.getControl();
        model.getAssetCategory();
        model.getAssetSubCategory();
        model.getAssetType();
        model.getAsssetName();
        model.getAssetCondition();
        model.getIssues();
        model.getDrop1();
        model.getDrop2();
        model.getDrop3();
      },
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              runAlignment: WrapAlignment.center,
              children: [
                // Image.asset(
                //   'assets/images/gunscope.png',
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Icon(Icons.circle_outlined, color: Colors.red),
                ),
                Text('AIMS',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            iconTheme: IconThemeData(color: Colors.black),
            actionsIconTheme: IconThemeData(color: Colors.black),
            actions: [
              PopupMenuButton<int>(
                onSelected: (int i) => model.popUpMenuOption(i, context),

                itemBuilder: (contex) {
                  return <PopupMenuItem<int>>[
                    PopupMenuItem(
                      value: 1,
                      child: Text('Log out'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Pending Data'),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text('Sudmitted Data'),
                    ),
                    PopupMenuItem(
                      value: 4,
                      child: Text('Rejected Data'),
                    ),
                  ];
                },
                // child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Set Location \$ Cost Center',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomDropdown(
                    label: 'Location',
                    child: new DropdownButton<String>(
                      isExpanded: true,
                      value: model.selectedLocation,

                      hint: Text('Select Location'),
                      iconSize: 15,
                      icon: Icon(Icons.keyboard_arrow_down_sharp),
                      // itemHeight: 300,
                      elevation: 0,
                      style: TextStyle(color: Colors.black),
                      dropdownColor: Colors.white,
                      items: model.locations
                          .map((e) => e.address)
                          .map((value) => new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(
                                  value ?? '',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          model.selectedLocation = newValue;
                          print(model.selectedLocation);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomDropdown(
                    label: 'Cost Center',
                    child: new DropdownButton<String>(
                      isExpanded: true,
                      value: model.selectedCostCenter,

                      hint: Text('Select Cost Center'),
                      iconSize: 15,
                      icon: Icon(Icons.keyboard_arrow_down_sharp),
                      // itemHeight: 300,
                      elevation: 0,
                      style: TextStyle(color: Colors.black),
                      dropdownColor: Colors.white,
                      items: model.costCenter
                          .map((e) => e.description)
                          .map((value) => new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(
                                  value ?? '',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          model.selectedCostCenter = newValue;
                          print(model.selectedCostCenter);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  //
                  Text('GPS Address',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(
                      '${model.positionIsLoading ? 'Loading' : model.currentAddress ?? 'N/A'}'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text('Latitude',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(
                    '${model.addressIsLoading ? 'Loading' : model.currentPosition?.latitude ?? 'N/A'}',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text('Longitude',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(
                      '${model.addressIsLoading ? 'Loading' : model.currentPosition?.longitude ?? 'N/A'}'),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.09,
              child: CustomButton('Start', onPressed: () {
                model.setValues(context);
              }),
            ),
          )),
    );
  }
}
