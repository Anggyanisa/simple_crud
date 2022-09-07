import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simple_crud/constant/style.dart';
import 'package:simple_crud/modul/Auth/controller/login_controller.dart';
import 'package:simple_crud/modul/template/controller/custom_getx_function.dart';
import 'package:simple_crud/modul/template/view/template_form.dart';

// ignore: camel_case_types
class halamanLogin extends StatefulWidget {
  const halamanLogin({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _halamanLoginState createState() => _halamanLoginState();
}

// ignore: camel_case_types
class _halamanLoginState extends State<halamanLogin> {
  final data = Get.find<AuthController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController txtusername = TextEditingController();
  final TextEditingController txtpassword = TextEditingController();
  bool _validateuser = false;
  bool _validatepass = false;
  bool _isHidePassword = true;
  late String device;

  @override
  void initState() {
    super.initState();
  }

  void _tooglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 32),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: CustomStyle.margin_per_widget + 20,
                          ),
                          Text(
                            "Halo,",
                            style: TextStyle(
                                fontSize: 20, color: CustomStyle.colorOrange),
                          ),
                          Text(
                            "Selamat Datang",
                            style: TextStyle(
                                fontSize: 25,
                                color: CustomStyle.color3,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: CustomStyle.margin_per_widget + 20,
                          ),
                          TemplateForm(
                            hintText: 'Email',
                            controller: txtusername,
                            prefixIcon: const Icon(Icons.person_rounded),
                            enabled: true,
                            color: Colors.grey,
                            fillColor: CustomStyle.colorGrey,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 55,
                            width: 350,
                            decoration: BoxDecoration(
                              color: CustomStyle.colorGrey,
                              border: Border.all(
                                width: 3.0,
                                color: CustomStyle.colorGrey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18.0)),
                            ),
                            child: TextField(
                              controller: txtpassword,
                              style: const TextStyle(color: Colors.grey),
                              obscureText: _isHidePassword,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock_outline_rounded,
                                      color: CustomStyle.fontColorGrey),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _tooglePasswordVisibility();
                                    },
                                    child: Icon(
                                      _isHidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: CustomStyle.fontColorGrey,
                                    ),
                                  ),
                                  hintText: 'Password',
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(0, 16, 0, 0),
                                  hintStyle: TextStyle(
                                    color: CustomStyle.fontColorGrey,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: CustomStyle.margin_inner_widget + 14,
                          ),
                          Container(
                            height: 45,
                            width: 350,
                            child: ElevatedButton(
                              onPressed: () {
                                if (txtusername.text.isNotEmpty &&
                                    txtpassword.text.isNotEmpty) {
                                  data.doLogin(
                                      txtusername.text, txtpassword.text);
                                } else {
                                  CustomGetXFunction.showSnackbar(
                                      'Data Tidak Boleh Kosong');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: CustomStyle.color3,
                                  onPrimary: Colors.white),
                              child: const Text(
                                "Masuk",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: CustomStyle.margin_inner_widget + 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
