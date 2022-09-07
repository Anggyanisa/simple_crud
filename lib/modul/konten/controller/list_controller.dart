import 'package:get/get.dart';
import 'package:simple_crud/modul/konten/model/create_model.dart';
import 'package:simple_crud/modul/konten/model/detail_model.dart';
import 'package:simple_crud/modul/konten/model/list_model.dart';
import 'package:simple_crud/modul/konten/service/konten_service.dart';
import 'package:simple_crud/modul/template/controller/custom_getx_function.dart';

class ListController extends GetxController {
  var isLoading = false.obs;
  var listData = <Datum>[].obs;
  var dataDetail = Data().obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    super.onInit();
  }

  Future getLists(page) async {
    isLoading.value = true;
    ListModel data = await KontenService().getList(page);
    if (data.data != null) {
      listData.value = data.data!;
    } else {
      listData.value = [];
    }
    isLoading.value = false;
  }

  Future getDetail(id) async {
    DetailModel data = await KontenService().getDetail(id);
    if (data.data != null) {
      dataDetail.value = data.data!;
    }
  }

  Future postData(name, job) async {
    // isLoading.value = true;
    CreateModel data = await KontenService().postData(name, job);
    if (data != null) {
      CustomGetXFunction.successDialog("berhasil", 'berhasil Tambah Data');
    }
  }
}
