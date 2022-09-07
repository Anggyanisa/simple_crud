import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_crud/modul/Auth/binding/auth_binding.dart';
import 'package:simple_crud/modul/Auth/view/login_view.dart';
import 'package:simple_crud/modul/konten/binding/konten_controller.dart';
import 'package:simple_crud/modul/konten/view/list_contact_view.dart';
import 'package:simple_crud/modul/konten/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sportax',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: '/login',
            page: () => const halamanLogin(),
            binding: AuthBinding()),
        GetPage(
            name: '/halaman_beranda',
            page: () => const HalamanList(),
            binding: KontenBinding()),
      ],
      initialRoute: '/login',
    );
  }
}
