import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:async/async.dart';
import 'package:uuid/uuid.dart';

class ChatScreenController extends GetxController {
  //TODO: Implement ChatScreenController
  RxString chatRoomId = ''.obs;
  Map<String, dynamic> args = Get.arguments;
  Uuid uuid = Uuid();
  RxString hintText = 'type a message....'.obs;
  RxString currentUser = ''.obs;

  setArguments() {
    chatRoomId.value = args['chatRoomId'];
  }

  TextEditingController messageController = TextEditingController();

  Future sendMessage(chatRoomId, text) async {
    await FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .add({
      'text': text,
      'timestamp': Timestamp.now(),
      'senderId': currentUser.value,
    });
  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    await setArguments();
    FirebaseAuth auth = FirebaseAuth.instance;
    currentUser.value = auth.currentUser!.uid;
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
