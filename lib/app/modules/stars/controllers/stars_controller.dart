import 'package:get/get.dart';

class StarsController extends GetxController {
  //TODO: Implement StarsController

  RxString userId = ''.obs;
  final count = 0.obs;

  final Map<String, dynamic> args = Get.arguments;

  userIdFromArgs() {
    userId.value = args['userId'];
  }

  @override
  void onInit() {
    super.onInit();
    userIdFromArgs();
    print(userId.value);
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
