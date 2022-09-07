import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simple_crud/constant/const_variable.dart';
import 'package:simple_crud/modul/Auth/model/login_model.dart';

class AuthService extends GetConnect {
  var server = ConstVariable.server;
  AuthService() {
    httpClient.timeout = const Duration(seconds: 6000);
  }

  Future<dynamic> doLogin(String email, String password) async {
    print(email);

    print('$server/api/login;');
    Map<String, String> body = {
      'email': email,
      'password': password,
    };
    final response = await post('$server/api/login', body);
    if (kDebugMode) {
      print("RESPONNYA ${response.body}");
    }
    if (response.status.hasError) {
      return LoginModel(token: null);
    } else {
      return LoginModel.fromJson(response.body);
    }
  }
}
