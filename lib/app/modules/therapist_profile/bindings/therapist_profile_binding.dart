import 'package:get/get.dart';

import '../controllers/therapist_profile_controller.dart';

class TherapistProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapistProfileController>(
      () => TherapistProfileController(),
    );
  }
}
