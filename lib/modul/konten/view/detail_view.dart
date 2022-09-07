import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_crud/constant/style.dart';
import 'package:simple_crud/modul/konten/controller/list_controller.dart';

class HalamanDetail extends StatefulWidget {
  String? id;
  HalamanDetail({this.id});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  final detail = Get.find<ListController>();
  @override
  void initState() {
    super.initState();
    detail.getDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomStyle.backgroundColor,
        body: Container(
          color: Colors.white,
          child: Obx(() {
            if (detail.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (detail.dataDetail.value.firstName != null) {
                return SingleChildScrollView(
                    child: Stack(children: [
                  Container(
                      color: CustomStyle.color3,
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () => Get.back(),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 25,
                                )),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Icon(
                                  Icons.star_outline_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                const Icon(
                                  Icons.create_rounded,
                                  color: Colors.white,
                                  size: 25,
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 95, 16, 82),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 150,
                            ),
                            Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              detail.dataDetail.value.firstName! +
                                  " " +
                                  detail.dataDetail.value.lastName!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'Poppins'),
                            ),
                            Container(
                                padding: const EdgeInsets.only(top: 30),
                                child: cardEdit(detail.dataDetail.value.email)),
                          ]))
                ]));
              } else {
                return const Center(child: Text('Data Kosong'));
              }
            }
          }),
        ));
  }

  Widget cardEdit(email) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Center(
                    child: Container(
                        width: 25,
                        height: 25,
                        child: Icon(
                          Icons.mail,
                          color: CustomStyle.color3,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        email,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: CustomStyle.color3,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        'E-Mail',
                        style: TextStyle(
                            fontSize: 13,
                            color: CustomStyle.fontColorGrey,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: CustomStyle.color3,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
