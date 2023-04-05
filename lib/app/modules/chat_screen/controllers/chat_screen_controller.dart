import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:async/async.dart';

class ChatScreenController extends GetxController {
  //TODO: Implement ChatScreenController
  RxString senderId = ''.obs;
  RxString recipientId = ''.obs;
  Map<String, dynamic> args = Get.arguments;

  setArguments() {
    senderId.value = args['senderId'];
    recipientId.value = args['reciepientId'];
  }

  TextEditingController messageController = TextEditingController();

  final CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('Messages');

  final CollectionReference userMessagesCollection =
      FirebaseFirestore.instance.collection('UserMessages');

  Future<void> sendMessage(String senderId, String recipientId, String text) {
    return messagesCollection
        .doc(senderId + recipientId)
        .collection('chats')
        .doc()
        .set({
      'senderId': senderId,
      'recipientId': recipientId,
      'text': text,
      'timestamp': DateTime.now(),
    });
  }

  Future<void> setUserMessages(
      String senderId, String recipientId, String text) {
    return userMessagesCollection
        .doc(recipientId)
        .collection('messages')
        .doc()
        .set({
      'senderId': senderId,
      'recipientId': recipientId,
      'text': text,
      'timestamp': DateTime.now(),
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    setArguments();
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
