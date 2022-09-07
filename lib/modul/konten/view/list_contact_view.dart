import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_crud/constant/style.dart';
import 'package:simple_crud/modul/konten/binding/konten_controller.dart';
import 'package:simple_crud/modul/konten/controller/list_controller.dart';
import 'package:simple_crud/modul/konten/model/list_model.dart';
import 'package:simple_crud/modul/konten/view/create_view.dart';
import 'package:simple_crud/modul/konten/view/detail_view.dart';

class HalamanList extends StatefulWidget {
  const HalamanList({Key? key}) : super(key: key);

  @override
  State<HalamanList> createState() => _HalamanListState();
}

class _HalamanListState extends State<HalamanList> {
  final data = Get.find<ListController>();
  @override
  void initState() {
    super.initState();
    data.getLists(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
        backgroundColor: CustomStyle.color3,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomStyle.color3,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(HalamanCreate(), binding: KontenBinding());
        },
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              if (data.isLoading.value == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (data.listData.isNotEmpty) {
                  return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: data.listData.length,
                      itemBuilder: (BuildContext context, index) {
                        return templateCard(data.listData[index]);
                      });
                } else {
                  return const Center(child: Text('Data Kosong'));
                }
              }
            })),
      ),
    );
  }

  Widget templateCard(Datum data) {
    return GestureDetector(
      onTap: () {
        Get.to(
            HalamanDetail(
              id: data.id.toString(),
            ),
            binding: KontenBinding());
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[500]!,
                width: 0.4,
              ),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 14, 18),
          child: Row(
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: CustomStyle.color3,
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: Center(
                    child: Text(
                  data.firstName![0].toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: CustomStyle.fontSizeHeader + 2,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.firstName! + data.lastName!,
                      style: TextStyle(
                          color: CustomStyle.fontColorBlack,
                          fontSize: CustomStyle.fontSizeSubTitle,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data.email!,
                      style: TextStyle(fontSize: CustomStyle.fontSizeSmall - 2),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Icon(
                Icons.star_outline_rounded,
                color: CustomStyle.fontColorGrey,
              )
            ],
          )),
    );
  }
}
