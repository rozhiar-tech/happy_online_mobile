import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class FavioretsController extends GetxController {
  //TODO: Implement FavioretsController
  RxString welcome= 'لە ماوەیەکی کەمدا ئێرەش بەردەست دەبێت'.obs;

   changeIndex(index) {
    switch (index) {
      case 0:
        Get.toNamed(
          Routes.HOME,
        );
        break;
      case 1:
        Get.toNamed(
          Routes.CHATS,
        );
        break;
      case 2:
        Get.toNamed(Routes.FAVIORETS);
        break;
      case 3:
        Get.toNamed(Routes.USER_PROFILE);
        break;
    }
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
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
