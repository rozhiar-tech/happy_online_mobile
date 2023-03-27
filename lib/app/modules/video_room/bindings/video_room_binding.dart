import 'package:get/get.dart';

import '../controllers/video_room_controller.dart';

class VideoRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoRoomController>(
      () => VideoRoomController(),
    );
  }
}
