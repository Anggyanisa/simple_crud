import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simple_crud/constant/const_variable.dart';
import 'package:simple_crud/modul/konten/model/create_model.dart';
import 'package:simple_crud/modul/konten/model/detail_model.dart';
import 'package:simple_crud/modul/konten/model/list_model.dart';

class KontenService extends GetConnect {
  var server = ConstVariable.server;
  KontenService() {
    httpClient.timeout = const Duration(seconds: 6000);
  }

  Future<dynamic> getList(page) async {
    final response = await get(
      '$server/api/users?page=$page',
    );
    if (kDebugMode) {
      print("RESPONNYA ${response.body}");
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return ListModel.fromJson(response.body);
    }
  }

  Future<dynamic> getDetail(id) async {
    final response = await get(
      '$server/api/users/$id',
    );
    if (kDebugMode) {
      print("RESPONNYA ${response.body}");
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return DetailModel.fromJson(response.body);
    }
  }

  Future<dynamic> postData(name, job) async {
    final response =
        await post('$server/api/users', FormData({'name': name, 'job': job}));
    if (kDebugMode) {
      print("RESPONNYA ${response.body}");
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return CreateModel.fromJson(response.body);
    }
  }
}
