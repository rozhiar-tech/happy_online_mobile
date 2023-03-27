import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:get/get.dart';


import '../controllers/video_room_controller.dart';

class VideoRoomView extends GetView<VideoRoomController> {
  const VideoRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return GetX(
        init: VideoRoomController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Welcome to Flutter Explained - WebRTC"),
            ),
            body: Column(
              children: [
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.signaling.openUserMedia(
                            controller.localRenderer,
                            controller.remoteRenderer);
                      },
                      child: Text("Open camera & microphone"),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        controller.roomId = (await controller.signaling
                                .createRoom(controller.remoteRenderer))
                            as RxString?;
                        controller.textEditingController.text =
                            controller.roomId!.value;
                      },
                      child: Text("Create room"),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add roomId
                        controller.signaling.joinRoom(
                            "S58quWyXCkQgEr5t4Aw6",
                            controller.remoteRenderer);
                      },
                      child: Text('Join room'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.signaling.hangUp(controller.localRenderer);
                      },
                      child: const Text("Hangup"),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RTCVideoView(controller.localRenderer,
                              mirror: true),
                        ),
                        Container(
                          width: 180,
                          child: RTCVideoView(controller.remoteRenderer,
                             ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Join the following Room: "),
                      Flexible(
                        child: TextFormField(
                          controller: controller.textEditingController,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text("Room ID: ${controller.roomId.toString()}"),
                SizedBox(
                  height: 5,
                ),
                Text(controller.hello.value),

              ],
            ),
          );
        });
  }
}
