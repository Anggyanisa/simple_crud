import 'package:get/get.dart';
import 'package:simple_crud/modul/konten/controller/list_controller.dart';

class KontenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListController());
  }
}
