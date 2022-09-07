import 'package:get/get.dart';
import 'package:simple_crud/modul/Auth/model/login_model.dart';
import 'package:simple_crud/modul/Auth/service/login_service.dart';
import 'package:simple_crud/modul/template/controller/custom_getx_function.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var login = ''.obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    super.onInit();
  }

  Future doLogin(String username, String password) async {
    CustomGetXFunction.showProgressDialog();
    LoginModel loginModel = await AuthService().doLogin(username, password);
    if (loginModel.token != null) {
      Get.back();
      login.value = 'true';
      Get.offAndToNamed('/halaman_beranda');
    } else {
      login.value = 'false';
      Get.back();
      CustomGetXFunction.showErrorSnackbar(message: 'Gagal Login!');
    }
  }
}
