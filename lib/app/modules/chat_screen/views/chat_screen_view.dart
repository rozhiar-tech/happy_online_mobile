import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

import '../controllers/chat_screen_controller.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  const ChatScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ChatScreenController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Messages")
                          .doc(controller.senderId.value +
                              controller.recipientId.value)
                          .collection("chats")
                          .orderBy('timestamp', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print("has data ${snapshot.data!.docs.length}");
                          return ListView.builder(
                            reverse: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: controller
                                              .senderId.value ==
                                          snapshot.data!.docs[index]['senderId']
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: controller.senderId.value ==
                                                snapshot.data!.docs[index]
                                                    ['senderId']
                                            ? Colors.blue
                                            : Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        snapshot.data!.docs[index]['text'],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      DateFormat('hh:mm')
                                          .format(snapshot
                                              .data!.docs[index]['timestamp']
                                              .toDate())
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.messageController,
                            decoration:
                                InputDecoration(hintText: 'Type a message...'),
                          ),
                        ),
                        SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            if (controller.messageController.text.isNotEmpty) {
                              controller.sendMessage(
                                  controller.senderId.value,
                                  controller.recipientId.value,
                                  controller.messageController.text);
                              controller.setUserMessages(
                                  controller.senderId.value,
                                  controller.recipientId.value,
                                  controller.messageController.text);
                              controller.messageController.clear();
                            }
                          },
                          icon: Icon(Icons.send),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
