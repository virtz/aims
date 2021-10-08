import 'package:aims/ui/screens/auth/login/login_view_model.dart';
import 'package:aims/ui/widgets/custom_button.dart';
import 'package:aims/ui/widgets/custom_dropdown.dart';
import 'package:aims/ui/widgets/green_circle.dart';
import 'package:aims/ui/widgets/purple_circle.dart';
import 'package:aims/ui/widgets/textfield.dart';

import 'package:aims/ui/widgets/yellow_circle.dart';
import 'package:aims/utils/validator/auth_validator.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) {
        model.getClientList();
      },
      builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: Container()),
                      Center(
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
                      CustomDropdown(
                        child: new DropdownButton<String>(
                          isExpanded: true,

                          value: model.selectedClient,

                          hint: Text('Select Client'),
                          iconSize: 15,
                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                          // itemHeight: 300,
                          elevation: 0,
                          style: TextStyle(color: Colors.black),
                          dropdownColor: Colors.white,
                          items: model.clientList
                              .map((e) => e.clientName)
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: new Text(
                                      e ?? '',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              model.selectedClient = value;
                            });
                          },
                        ),
                      ),
                      CustomTextFieldWidget(
                        label: 'Name',
                        filled: null,
                        controller: name,
                        validator: AuthValidator().isEmpty,
                      ),
                      SizedBox(height: size.height * 0.03),
                      CustomTextFieldWidget(
                        validator: AuthValidator().isEmpty,
                        label: "Password",
                        controller: password,
                        obscureText: true,
                      ),
                      model.isBusy
                          ? Column(
                              children: [
                                SizedBox(height: size.height * 0.04),
                                CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Theme.of(context).primaryColor)),
                              ],
                            )
                          : CustomButton(
                              'Login',
                              // height: 50,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  model.login(
                                      name.text, password.text, context);
                                  // ignore: unnecessary_statements

                                }

                                // context.router.push(const Start());
                              },
                            ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
