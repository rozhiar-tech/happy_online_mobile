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
                "Chats",
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
                    .collection('chatRooms')
                    .where('members',
                        arrayContains: controller.currentUserId.value)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        final data = document.data() as Map<String, dynamic>;
                        final members = List<String>.from(data['members']);
                        members.remove(controller.currentUserId.value);
                        final otherUserId = members.first;
                        controller.doctorUid.value = otherUserId;
                        final lastMessage = data['lastMessage'];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.CHAT_SCREEN, arguments: {
                                'chatRoomId': document.id,
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.darkPurple,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                // style: ListTileStyle.list,
                                // dense: true,
                                title: Text(
                                  'Chat with Doctor',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  lastMessage['text'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
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
