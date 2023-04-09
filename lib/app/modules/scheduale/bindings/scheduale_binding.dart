import 'package:get/get.dart';

import '../controllers/scheduale_controller.dart';

class SchedualeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedualeController>(
      () => SchedualeController(),
    );
  }
}
