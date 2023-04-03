import 'package:get/get.dart';

import '../controllers/therapist_home_controller.dart';

class TherapistHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistHomeController>(
      () => TherapistHomeController(),
    );
  }
}
