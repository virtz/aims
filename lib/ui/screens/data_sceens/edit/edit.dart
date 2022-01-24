import 'dart:io';

import 'package:aims/core/models/aset_subcategory.dart';
import 'package:aims/core/models/asset_category.dart';
import 'package:aims/core/models/asset_name.dart';
import 'package:aims/core/models/asset_type.dart';
import 'package:aims/core/models/captured_data.dart';
import 'package:aims/ui/screens/data_capture/data_capture_view_model.dart';
import 'package:aims/ui/screens/data_sceens/edit/edit_view_model.dart';
import 'package:aims/ui/widgets/custom_button.dart';
import 'package:aims/ui/widgets/custom_dropdown.dart';
import 'package:aims/ui/widgets/textfield.dart';
import 'package:aims/utils/validator/auth_validator.dart';
import 'package:aims/utils/validator/index.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Edit extends StatefulWidget {
  final CapturedData? data;
  const Edit({Key? key, this.data}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  String? value;
  String? value1;
  String? value2;
  String? value3;
  String? isParent;
  String? value5;
  String? value6;
  String? value7;
  String? value8;
  String? value9;
  String? value0;
  String? value11;
  String? value12;

  TextEditingController assetOwner = TextEditingController();
  TextEditingController parentBarcode = TextEditingController();
  TextEditingController childBarcode = TextEditingController();
  TextEditingController manufacturer = TextEditingController();
  TextEditingController serialNumber = TextEditingController();
  TextEditingController chasisNumber = TextEditingController();
  TextEditingController engineNumber = TextEditingController();
  TextEditingController oldAssetNumber = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController extraBarcode1 = TextEditingController();
  TextEditingController extraBarcode2 = TextEditingController();
  TextEditingController extraTextField1 = TextEditingController();
  TextEditingController extraTextField2 = TextEditingController();
  TextEditingController extraTextField3 = TextEditingController();
  TextEditingController extraTextField4 = TextEditingController();
  TextEditingController extraTextField5 = TextEditingController();
  TextEditingController extraTextField6 = TextEditingController();
  TextEditingController extraTextField7 = TextEditingController();
  TextEditingController extraTextField8 = TextEditingController();
  late File image1;
  File image2 = File('');
  File image3 = File('');
  File image4 = File('');
  var photo1;
  var photo2;
  var photo3;
  var photo4;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<EditDataViewModel>.reactive(
      onModelReady: (model) async {
        model.getParameterSetup();
        model.getControl();
        model.hideFields();
        model.decideWhatToshow();
        model.getCategories();
        model.getAssetCondition();
        model.getCapturedData();
        model.getSiteIssues();
        model.getDrop1();
        model.getDrop2();
        model.getDrop3();
        model.getSubCategories();
        model.getAssetTypes();
        model.getAssetNames();
        model.getMiscData(widget.data!.product!);
        // widget.data!.product = model.selectedAssetName;
        model.selectedPrdtCat = model.misc!.selectedCategory!;
        model.selectedPrdtSubCat = model.misc!.selectedSubCategory!;

        model.selectedAssetType = model.misc!.assetType!;
        var slt = model.assetNameList
            .firstWhere((element) => element.p_Code == widget.data!.product);
        model.selectedAssetName = slt;

        print(widget.data!.product);
        childBarcode.text = widget.data!.barcode!;
        serialNumber.text = widget.data!.serialNo!;
        model.selectedContiion = widget.data!.condition!;
        comment.text = widget.data!.comment!;
        model.selectedStatus = widget.data!.status!;
        isParent = widget.data!.isParent!;
        parentBarcode.text = widget.data!.parentBarcode!;
        assetOwner.text = widget.data!.person!;
        model.drop1SelectedValue = widget.data!.drop1;
        model.drop2SelectedValue = widget.data!.drop2;
        model.drop3SelectedValue = widget.data!.drop3;
        manufacturer.text = model.misc!.manufacturer!;
        chasisNumber.text = model.misc!.chasisNo!;
        extraBarcode1.text = widget.data!.brExtra1!;
        extraBarcode2.text = widget.data!.brExtra2!;
        extraTextField1.text = widget.data!.text1!;
        extraTextField2.text = widget.data!.text2!;
        extraTextField3.text = widget.data!.text3!;
        extraTextField4.text = widget.data!.text4!;
        extraTextField5.text = widget.data!.text5!;
        extraTextField6.text = widget.data!.text6!;
        extraTextField7.text = widget.data!.text7!;
        extraTextField8.text = widget.data!.text8!;
        //TODO:
        // image1 = await model.convertBase64ToFile(widget.data!.photo1!);
        // model.firstImageSelected = true;
        if (widget.data!.photo2 != " " || widget.data!.photo2 != null) {
          image2 = await model.convertBase64ToFile(widget.data!.photo2!);
        }
        if (widget.data!.photo3 != " " || widget.data!.photo3 != null) {
          image3 = await model.convertBase64ToFile(widget.data!.photo3!);
        }
        if (widget.data!.photo4 != " " || widget.data!.photo4 != null) {
          image4 = await model.convertBase64ToFile(widget.data!.photo4!);
        }

        // model.getSubCategory();
        // model.getAssetType();
        // model.getAssetName();
      },
      viewModelBuilder: () => EditDataViewModel(),
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
            ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
              child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //first page
                Form(
                    key: formKey1,
                    child: Column(children: [
                      if (model.firstpage) ...[
                        Row(
                          children: [
                            Expanded(
                                flex: 6,
                                child: CustomTextFieldWidget(
                                    hintText: 'Asset Owner',
                                    controller: assetOwner,
                                    validator: (val) =>
                                        AuthValidator().name(val))),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Icon(Icons.person,
                                      size: 40,
                                      color: Theme.of(context).accentColor),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Text('Asset Capture',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Row(
                          children: [
                            Icon(Icons.pie_chart_sharp),
                            SizedBox(width: 5),
                            Text('Asset Information',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        model.showLevel4
                            ? CustomDropdown(
                                label: model.parameterList[0].assetLevel4Name,
                                child: new DropdownButton<AssetCategory>(
                                  isExpanded: true,
                                  value: model.selectedPrdtCat,

                                  hint: Text(
                                      'Select ${model.parameterList[0].assetLevel4Name}'),
                                  iconSize: 15,
                                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                                  // itemHeight: 300,
                                  elevation: 0,
                                  style: TextStyle(color: Colors.black),
                                  dropdownColor: Colors.white,
                                  items: model.categoryList.map((value) {
                                    return new DropdownMenuItem<AssetCategory>(
                                      value: value,
                                      child: new Text(
                                        value.caption ?? '',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    model.selectCategory(newValue);
                                  },
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        model.showLevel3
                            ? CustomDropdown(
                                label: model.parameterList[0].assetLevel3Name,
                                child: new DropdownButton<AssetSubCategory>(
                                  isExpanded: true,
                                  value: model.selectedPrdtSubCat,

                                  hint: Text(
                                      'Select ${model.parameterList[0].assetLevel3Name}'),
                                  iconSize: 15,
                                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                                  // itemHeight: 300,
                                  elevation: 0,
                                  style: TextStyle(color: Colors.black),
                                  dropdownColor: Colors.white,
                                  items: model.subCategoryList.map((value) {
                                    return new DropdownMenuItem<
                                        AssetSubCategory>(
                                      value: value,
                                      child: new Text(
                                        value.caption ?? "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    model.selectedSubcategory(newValue);
                                  },
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        model.showLevel2
                            ? CustomDropdown(
                                label: model.parameterList[0].assetLevel2Name,
                                child: new DropdownButton<AssetType>(
                                  isExpanded: true,
                                  value: model.selectedAssetType,

                                  hint: Text(
                                      'Select ${model.parameterList[0].assetLevel2Name}'),
                                  iconSize: 15,
                                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                                  // itemHeight: 300,
                                  elevation: 0,
                                  style: TextStyle(color: Colors.black),
                                  dropdownColor: Colors.white,
                                  items: model.assetTypeList.map((value) {
                                    return new DropdownMenuItem<AssetType>(
                                      value: value,
                                      child: new Text(
                                        value.caption ?? "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    model.selectAssetType(newValue);
                                  },
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        CustomDropdown(
                          label: model.parameterList[0].assetLevel1Name,
                          child: new DropdownButton<AssetName>(
                            isExpanded: true,
                            value: model.selectedAssetName,

                            hint: Text(
                                'Select ${model.parameterList[0].assetLevel1Name}'),
                            iconSize: 15,
                            icon: Icon(Icons.keyboard_arrow_down_sharp),
                            // itemHeight: 300,
                            elevation: 0,
                            style: TextStyle(color: Colors.black),
                            dropdownColor: Colors.white,
                            items: model.assetNameList.map((value) {
                              return new DropdownMenuItem<AssetName>(
                                value: value,
                                child: new Text(
                                  value.caption ?? "",
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                model.selectedAssetName = newValue;
                              });
                            },
                          ),
                        ),
                        // SizedBox(
                        //   height: size.height * 0.04,
                        // ),
                        Row(
                          children: [
                            Icon(Icons.code),
                            SizedBox(width: 5),
                            Text('Barcode',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        CustomDropdown(
                          label: 'Asset Type',
                          child: new DropdownButton<String>(
                            isExpanded: true,
                            value: isParent,

                            hint: Text('Select Asset Type'),
                            iconSize: 15,
                            icon: Icon(Icons.keyboard_arrow_down_sharp),
                            // itemHeight: 300,
                            elevation: 0,
                            style: TextStyle(color: Colors.black),
                            dropdownColor: Colors.white,
                            items: [
                              'Asset is Parent Item',
                              'Asset is Child Item'
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                isParent = newValue;
                              });
                            },
                          ),
                        ),

                        isParent == 'Asset is Parent Item'
                            ? Container()
                            : Column(
                                children: [
                                  CustomTextFieldWidget(
                                      readOnly: true,
                                      label: 'Parent Asset Name Barcode',
                                      controller: parentBarcode,
                                      validator: (val) =>
                                          Validators().isEmpty(val),
                                      onChanged: (val) {
                                        if (val.length >= 10) {
                                          var option = model
                                              .iterateForSimilarBarcode(val);
                                          if (option) {
                                            setState(() {
                                              parentBarcode.text = '';
                                            });
                                          }
                                        }
                                      }
                                      // hintText: 'Asset Owner',
                                      ),
                                  CustomButton('CLICK TO SCAN BARCODE',
                                      onPressed: () async {
                                    parentBarcode.text =
                                        await model.scanBarcode();
                                  }),
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                                ],
                              ),

                        CustomTextFieldWidget(
                            label: isParent == 'Asset is Parent Item'
                                ? 'Barcode'
                                : 'Child Asset Name Barcode',
                            // hintText: 'Asset Owner',?
                            readOnly: true,
                            controller: childBarcode,
                            onChanged: (val) {
                              if (val.length >= 10) {
                                var option =
                                    model.iterateForSimilarBarcode(val);
                                if (option) {
                                  setState(() {
                                    childBarcode.text = '';
                                  });
                                }
                              }
                            },
                            validator: (val) => Validators().isEmpty(val)),
                        CustomButton('CLICK TO SCAN BARCODE',
                            onPressed: () async {
                          childBarcode.text = await model.scanBarcode();
                        }),
                      ],
                    ])),

                //!SECOND PAGE!!!!!!!!
                ///
                ///
                ///
                ///
                ///
                Form(
                    key: formKey2,
                    child: Column(
                      children: [
                        if (model.secondpage) ...[
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Text('Other Asset Details',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Row(
                            children: [
                              Icon(Icons.info),
                              SizedBox(width: 5),
                              Text('Other Asset Information',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          model.parameterList[0].manufacturer == 'Yes'
                              ? CustomTextFieldWidget(
                                  label: 'Manufacturer',
                                  controller: manufacturer,
                                  validator: (val) => Validators().isEmpty(val))
                              : Container(),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          model.parameterList[0].serialNo == 'Yes'
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label: 'Serial Number',
                                        controller: serialNumber,
                                        onChanged: (val) {
                                          if (val.length >= 10) {
                                            var option = model
                                                .iterateForSimilarBarcode(val);
                                            if (option) {
                                              setState(() {
                                                serialNumber.text = '';
                                              });
                                            }
                                          }
                                        },
                                        validator: (val) =>
                                            Validators().isEmpty(val)),
                                    CustomButton('CLICK TO SCAN BARCODE',
                                        onPressed: () async {
                                      serialNumber.text =
                                          await model.scanBarcode();
                                    }),
                                  ],
                                )
                              : Container(),
                          //     SizedBox(
                          //   height: size.height * 0.04,
                          // ),

                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          model.parameterList[0].chasisNo == 'Yes'
                              ? CustomTextFieldWidget(
                                  label: 'Chasis Number',
                                  controller: chasisNumber,
                                  validator: (val) => Validators().isEmpty(val))
                              : Container(),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          model.parameterList[0].engineN0 == "Yes"
                              ? CustomTextFieldWidget(
                                  // validator: (val) => Validators().isEmpty(val),
                                  label: 'Engine Number',
                                  controller: engineNumber,
                                  validator: (val) => Validators().isEmpty(val))
                              : Container(),
                          SizedBox(
                            height: size.height * 0.03,
                          ),

                          // CustomTextFieldWidget(
                          //     label: 'Old Asset Number', controller: oldAssetNumber),
                          // SizedBox(
                          //   height: size.height * 0.04,
                          // ),
                          CustomDropdown(
                            label: 'Asset Condition',
                            child: new DropdownButton<String>(
                              isExpanded: true,
                              value: model.selectedContiion ?? '',

                              hint: Text('Select Condition'),
                              iconSize: 15,
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                              // itemHeight: 300,
                              elevation: 0,
                              style: TextStyle(color: Colors.black),
                              dropdownColor: Colors.white,
                              items: model.assetConditionList
                                  .map((e) => e.condition)
                                  .map((value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value ?? "",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  model.selectedContiion = newValue;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          CustomTextFieldWidget(
                              label: 'Your Comment',
                              controller: comment,
                              validator: (val) => Validators().isEmpty(val)),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          CustomDropdown(
                            label: 'Status',
                            child: new DropdownButton<String>(
                              isExpanded: true,
                              value: model.selectedStatus,

                              hint: Text('Select Status'),
                              iconSize: 15,
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                              // itemHeight: 300,
                              elevation: 0,
                              style: TextStyle(color: Colors.black),
                              dropdownColor: Colors.white,
                              items: model.siteIssues
                                  .map((e) => e.issue)
                                  .map((value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value ?? " ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  model.selectedStatus = newValue;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),

                          model.controlList[2].status == 'Active'
                              ? Column(
                                  children: [
                                    CustomDropdown(
                                      label: model
                                              .controlList[2].userDefinedName ??
                                          'Extra DropDown',
                                      child: new DropdownButton<String>(
                                        isExpanded: true,
                                        value: model.drop1SelectedValue,

                                        hint: Text('Select '),
                                        iconSize: 15,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_sharp),
                                        // itemHeight: 300,
                                        elevation: 0,
                                        style: TextStyle(color: Colors.black),
                                        dropdownColor: Colors.white,
                                        items: model.drop1DataList
                                            .map((e) => e.caption)
                                            .map((value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(
                                              value ?? " ",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            model.drop1SelectedValue = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),
                          // SizedBox(
                          //   height: size.height * 0.04,
                          // ),
                          model.controlList[3].status == 'Active'
                              ? Column(
                                  children: [
                                    CustomDropdown(
                                      label: model
                                              .controlList[3].userDefinedName ??
                                          'Extra DropDown',
                                      child: new DropdownButton<String>(
                                        isExpanded: true,
                                        value: model.drop2SelectedValue,

                                        hint: Text('Select'),
                                        iconSize: 15,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_sharp),
                                        // itemHeight: 300,
                                        elevation: 0,
                                        style: TextStyle(color: Colors.black),
                                        dropdownColor: Colors.white,
                                        items: model.drop2DataList
                                            .map((e) => e.caption)
                                            .map((value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(
                                              value ?? " ",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            model.drop2SelectedValue = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[4].status == "Active"
                              ? Column(
                                  children: [
                                    CustomDropdown(
                                      label: model
                                              .controlList[4].userDefinedName ??
                                          'Extra DropDown',
                                      child: new DropdownButton<String>(
                                        isExpanded: true,
                                        value: model.drop3SelectedValue,

                                        hint: Text(
                                            'Select ${model.controlList[4].userDefinedName ?? ''}'),
                                        iconSize: 15,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_sharp),
                                        // itemHeight: 300,
                                        elevation: 0,
                                        style: TextStyle(color: Colors.black),
                                        dropdownColor: Colors.white,
                                        items: model.drop3DataList
                                            .map((e) => e.caption)
                                            .map((value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(
                                              value ?? " ",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            model.drop3SelectedValue = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),
                          // SizedBox(
                          //   height: size.height * 0.04,
                          // ),

                          model.controlList[0].status == 'Active'
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label: model.controlList[0]
                                                .userDefinedName ??
                                            'Extra Barcode',
                                        controller: extraBarcode1,
                                        onChanged: (val) {
                                          if (val.length >= 10) {
                                            var option = model
                                                .iterateForSimilarBarcode(val);
                                            if (option) {
                                              setState(() {
                                                extraBarcode1.text = '';
                                              });
                                            }
                                          }
                                        },
                                        validator: (val) =>
                                            Validators().isEmpty(val)
                                        // hintText: 'Asset Owner',
                                        ),
                                    CustomButton('CLICK TO SCAN BARCODE',
                                        onPressed: () async {
                                      extraBarcode1.text =
                                          await model.scanBarcode();
                                    }),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[1].status == 'Active'
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label: model.controlList[1]
                                                .userDefinedName ??
                                            'Extra Barcode',
                                        controller: extraBarcode2,
                                        onChanged: (val) {
                                          if (val.length >= 10) {
                                            var option = model
                                                .iterateForSimilarBarcode(val);
                                            if (option) {
                                              setState(() {
                                                extraBarcode2.text = '';
                                              });
                                            }
                                          }
                                        },
                                        validator: (val) =>
                                            Validators().isEmpty(val)
                                        // hintText: 'Asset Owner',
                                        ),
                                    CustomButton('CLICK TO SCAN BARCODE',
                                        onPressed: () async {
                                      extraBarcode2.text =
                                          await model.scanBarcode();
                                    }),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[5].status == "Active"
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label:
                                            '${model.controlList[5].userDefinedName ?? ''}',
                                        controller: extraTextField1,
                                        validator: (val) =>
                                            Validators().isEmpty(val)),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[6].status == "Active"
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label:
                                            '${model.controlList[6].userDefinedName ?? ''}',
                                        controller: extraTextField2,
                                        validator: (val) =>
                                            Validators().isEmpty(val)),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[7].status == "Active"
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label:
                                            '${model.controlList[7].userDefinedName ?? ''}',
                                        controller: extraTextField3,
                                        validator: (val) =>
                                            Validators().isEmpty(val)),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[8].status == "Active"
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label:
                                            '${model.controlList[8].userDefinedName ?? ''}',
                                        controller: extraTextField4,
                                        validator: (val) =>
                                            Validators().isEmpty(val)),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[9].status == "Active"
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label:
                                            '${model.controlList[9].userDefinedName ?? ' '}',
                                        controller: extraTextField5,
                                        validator: (val) =>
                                            Validators().isEmpty(val)),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[10].status == "Active"
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label:
                                            '${model.controlList[10].userDefinedName ?? 'Extra'}',
                                        controller: extraTextField6,
                                        validator: (val) =>
                                            Validators().isEmpty(val)),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[11].status == "Active"
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label:
                                            '${model.controlList[11].userDefinedName ?? 'Extra'}',
                                        controller: extraTextField7,
                                        validator: (val) =>
                                            Validators().isEmpty(val)),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),

                          model.controlList[12].status == "Active"
                              ? Column(
                                  children: [
                                    CustomTextFieldWidget(
                                        label:
                                            '${model.controlList[12].userDefinedName ?? ''}',
                                        controller: extraTextField8,
                                        validator: (val) =>
                                            Validators().isEmpty(val)),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ],
                    )),

                //!THIRD PAGE!!!!!!!!!!!!!!
                Form(
                    key: formKey3,
                    child: Column(
                      children: [
                        if (model.thirdPage) ...[
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Text('Add Images',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  image1 = await model.selextImage();
                                  setState(() {
                                    model.firstImageSelected = true;
                                  });
                                },
                                child: Card(
                                  child: Container(
                                      height: size.height * 0.1,
                                      child: model.firstImageSelected
                                          ? Image.file(image1,
                                              fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt,
                                              size: 60, color: Colors.grey)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  image2 = await model.selextImage();
                                  setState(() {
                                    model.secondImageSelected = true;
                                  });
                                },
                                child: Card(
                                  child: Container(
                                      height: size.height * 0.1,
                                      child: model.secondImageSelected
                                          ? Image.file(image2,
                                              fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt,
                                              size: 60, color: Colors.grey)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  image3 = await model.selextImage();
                                  setState(() {
                                    model.thirdImageSelected = true;
                                  });
                                },
                                child: Card(
                                  child: Container(
                                      height: size.height * 0.1,
                                      child: model.thirdImageSelected
                                          ? Image.file(image3,
                                              fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt,
                                              size: 60, color: Colors.grey)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  image4 = await model.selextImage();
                                  setState(() {
                                    model.fourthImageSelected = true;
                                  });
                                },
                                child: Card(
                                  child: Container(
                                      height: size.height * 0.1,
                                      child: model.fourthImageSelected
                                          ? Image.file(image4,
                                              fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt,
                                              size: 60, color: Colors.grey)),
                                ),
                              ),
                            ],
                          ),
                          model.isLoading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor))
                              : CustomButton('Complete', height: 60,
                                  onPressed: () {
                                  // if (formKey.currentState!.validate()) {

                                  // ignore: unnecessary_null_comparison

                                  // photo1 =
                                  //     model.convertImageToBase64(image1.path);
                                  // if (image2.path.isNotEmpty) {
                                  //   photo2 =
                                  //       model.convertImageToBase64(image2.path);
                                  // }
                                  // // var photo2 = model.convertImageToBase64(image2.path);
                                  // if (image3.path.isNotEmpty) {
                                  //   photo3 =
                                  //       model.convertImageToBase64(image3.path);
                                  // }

                                  // if (image4.path.isNotEmpty) {
                                  //   photo4 =
                                  //       model.convertImageToBase64(image4.path);
                                  // }
                                  var result = model.saveCaptureData(
                                      comment: comment.text,
                                      isParent: isParent,
                                      barcode: childBarcode.text,
                                      serialNo: serialNumber.text,
                                      parentBarcode: parentBarcode.text,
                                      barcodeExtra1: extraBarcode1.text,
                                      barcodeExtra2: extraBarcode2.text,
                                      text1: extraTextField1.text,
                                      text2: extraTextField2.text,
                                      text3: extraTextField3.text,
                                      text4: extraTextField4.text,
                                      text5: extraTextField5.text,
                                      text6: extraTextField6.text,
                                      text7: extraTextField7.text,
                                      text8: extraTextField8.text,
                                      //Todo:
                                      // photo1: photo1,
                                      // photo2: photo2,
                                      // photo3: photo3,
                                      // photo4: photo4,
                                      owner: assetOwner.text);

                                  if (result == true) {
                                    childBarcode.clear();
                                    assetOwner.clear();
                                    parentBarcode.clear();
                                    manufacturer.clear();
                                    serialNumber.clear();
                                    chasisNumber.clear();
                                    comment.clear();
                                    extraBarcode1.clear();
                                    extraBarcode2.clear();
                                    extraTextField1.clear();
                                    extraTextField2.clear();
                                    extraTextField3.clear();
                                    extraTextField4.clear();
                                    extraTextField5.clear();
                                    extraTextField6.clear();
                                    extraTextField7.clear();
                                    extraTextField8.clear();
                                    image1 = File('');
                                    image2 = File("");
                                    image3 = File("");
                                    image4 = File("");
                                  }
                                  // } else {}
                                })
                        ]
                      ],
                    ))
              ],
            ),
          )),
        ),
        bottomNavigationBar: Container(
            color: Colors.transparent,
            height: size.height * 0.1,
            child: Row(children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        model.setFirstPage(true);
                        model.setSecondPage(false);
                        model.setThirdPage(false);
                      },
                      child: Text('Step 1',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.black)))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        if (formKey1.currentState!.validate()) {
                          model.setFirstPage(false);
                          model.setSecondPage(true);
                          model.setThirdPage(false);
                        }
                      },
                      child: Text('Step 2',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.black)))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        if (formKey2.currentState!.validate()) {
                          model.setFirstPage(false);
                          model.setSecondPage(false);
                          model.setThirdPage(true);
                        }
                      },
                      child: Text('Step 3',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.black)))),
            ])),
      ),
    );
  }
}
