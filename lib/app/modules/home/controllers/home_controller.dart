import 'package:get/get.dart';
import 'package:getxdictioaryapp/app/modules/home/models/word_response.dart';
import 'package:getxdictioaryapp/app/modules/home/services/api_services.dart';
import 'package:getxdictioaryapp/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxBool isloading = false.obs;
  RxBool iserror = false.obs;
  RxList<WordResponse> lw = [WordResponse()].obs;
  Future<void> searchaword(String s) async {
    isloading.value = true;
    try {
      lw.value = (await RemoteServices.fetchwordsfromdictionary(s))!;

      Get.toNamed(Routes.LIST)?.then((value) {
        isloading.value = false;
      });
    } catch (e) {
      iserror.value = true;
      isloading.value = false;
    }
  }

  void setright() {
    iserror.value = false;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
