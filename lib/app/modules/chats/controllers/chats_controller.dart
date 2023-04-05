import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ChatsController extends GetxController {
  //TODO: Implement ChatsController

  RxString currentUserId = ''.obs;
  changeIndex(index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        Get.toNamed(Routes.CHATS);
        break;
      case 2:
        Get.toNamed(Routes.SIGN_UP);
        break;
      case 3:
        Get.toNamed(Routes.HOME);
        break;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    FirebaseAuth auth = FirebaseAuth.instance;
    currentUserId.value = auth.currentUser!.uid;
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
