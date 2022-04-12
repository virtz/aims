import 'package:aims/router/app_router.gr.dart';
import 'package:aims/ui/screens/data_audit/data_audit_view_model.dart';
import 'package:aims/ui/widgets/custom_button.dart';
import 'package:aims/ui/widgets/textfield.dart';
// import 'package:aims/utils/utils.dart';
import 'package:aims/utils/validator/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DataAudit extends StatefulWidget {
  const DataAudit({Key? key}) : super(key: key);

  @override
  _DataAuditState createState() => _DataAuditState();
}

class _DataAuditState extends State<DataAudit> {
  @override
  Widget build(BuildContext context) {
    TextEditingController serialNumber = TextEditingController();
    return ViewModelBuilder<DataAuditViewModel>.reactive(
      viewModelBuilder: () => DataAuditViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
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
              ]),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomTextFieldWidget(
                    readOnly: true,
                    label: 'Scan Barcode',
                    controller: serialNumber,
                    onChanged: (val) {
                      // if (val.length >= 10) {
                      //   var option = model
                      //       .iterateForSimilarBarcode(val);
                      //   if (option) {
                      //     setState(() {
                      //       serialNumber.text = '';
                      //     });
                      //   }
                      // }
                    },
                    validator: (val) => Validators().isEmpty(val)),
                CustomButton('CLICK TO SCAN BARCODE', onPressed: () async {
                  serialNumber.text = await model.scanParentCode();

                  await model.dataAudit(serialNumber.text);
                  !model.productExists
                      ? model.showDialogue(
                          context,
                          _alertDialog(
                              Text("Product Not Found"),
                              Text(
                                  'Product with entered barcode not found, Would you like to capture product?'),
                              () {
                            AutoRouter.of(context).push(DataCapture());
                            AutoRouter.of(context).pop();
                          }, () {
                            AutoRouter.of(context).pop();
                          }))
                      : model.productExists && !model.locationMatches
                          ? model.showDialogue(
                              context,
                              _alertDialog(
                                  Text("Product Found"),
                                  Text(
                                      'Product with entered barcode  found but with a  different location, would you like to update the product?'),
                                  () {
                                AutoRouter.of(context).push(DataCapture(
                                    cd: model.cd, isFromAudit: true));
                                AutoRouter.of(context).pop();
                              }, () {
                                AutoRouter.of(context).pop();
                              }))
                          : model.showDialogue(
                              context,
                              _alertDialog(Text("Product Found"),
                                  Text('Product with entered barcode  found'),
                                  () {
                                AutoRouter.of(context).pop();
                              }, () {
                                AutoRouter.of(context).pop();
                              }));
                }),
              ],
            ),
          ))),
    );
  }

  Widget _alertDialog(
      Widget title, content, VoidCallback ok, VoidCallback cancel) {
    return AlertDialog(
      title: title,
      content: content,
      actions: [
        TextButton(
            onPressed: () {
              cancel();
            },
            child: Text('Cancel')),
        TextButton(
            child: Text('Ok'),
            onPressed: () {
              ok();
            })
      ],
    );
  }
}
