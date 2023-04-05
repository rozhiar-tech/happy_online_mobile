import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ChatsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                controller.currentUserId.value,
                style: TextStyle(
                  color: AppColors.darkPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.darkPurple,
                ),
              ),
            ),
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: [
                Icons.home,
                LineIcons.comment,
                Icons.favorite,
                Icons.person,
              ],
              activeIndex: 1,
              gapLocation: GapLocation.none,
              notchSmoothness: NotchSmoothness.softEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
              onTap: (index) {
                controller.changeIndex(index);
              },
              activeColor: AppColors.darkPurple,
              inactiveColor: Colors.grey,
              splashColor: AppColors.darkPurple,
              splashSpeedInMilliseconds: 300,
              // notchAndCornersAnimation: borderRadiusAnimation,
              iconSize: 24.0,

              //other params
            ),
            body: SafeArea(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("UserMessages")
                    .doc(controller.currentUserId.value)
                    .collection("messages")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("has data ${snapshot.data!.docs.length}");
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              Get.toNamed(Routes.CHAT_SCREEN, arguments: {
                                "senderId": controller.currentUserId.value,
                                "recipientId": snapshot.data!.docs[index]['id'],
                                "recipientName": snapshot.data!.docs[index]
                                    ['name'],
                              });
                            },
                            leading: Text("${index + 1}"),
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
          );
        });
  }
}
