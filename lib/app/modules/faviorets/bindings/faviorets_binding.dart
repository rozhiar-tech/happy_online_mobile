import 'package:get/get.dart';

import '../controllers/faviorets_controller.dart';

class FavioretsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavioretsController>(
      () => FavioretsController(),
    );
  }
}
