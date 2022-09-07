import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_crud/constant/style.dart';
import 'package:simple_crud/modul/konten/controller/list_controller.dart';

class HalamanCreate extends StatefulWidget {
  const HalamanCreate({Key? key}) : super(key: key);

  @override
  State<HalamanCreate> createState() => _HalamanCreateState();
}

class _HalamanCreateState extends State<HalamanCreate> {
  final TextEditingController txtname = TextEditingController();
  final TextEditingController txtjob = TextEditingController();
  final data = Get.find<ListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
        backgroundColor: CustomStyle.color3,
      ),
      body: Container(
        color: Colors.grey[100],
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(18, 25, 18, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: CustomStyle.color3,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0))),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 50,
                    )),
              ),
              // ignore: prefer_const_constructors
              TextField(
                controller: txtname,
                decoration: InputDecoration(
                  focusColor: CustomStyle.color3,
                  icon: Icon(Icons.person),
                  labelText: 'Name',
                  border: UnderlineInputBorder(),
                ),
              ),
              TextField(
                controller: txtjob,
                decoration: InputDecoration(
                  focusColor: CustomStyle.color3,
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.work),
                  labelText: 'Job',
                  // ignore: prefer_const_constructors
                  border: UnderlineInputBorder(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 45,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    data.postData(txtname.text, txtjob.text);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: CustomStyle.color3, onPrimary: Colors.white),
                  child: const Text(
                    "Create",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
