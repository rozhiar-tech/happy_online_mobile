import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_online_mobile/app/theme/app_colors.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/therapist_home_controller.dart';

class TherapistHomeView extends GetView<TherapistHomeController> {
  const TherapistHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: TherapistHomeController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: [
                Icons.home,
                LineIcons.comment,
              ],
              activeIndex: 0,
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
            ),
            body: SafeArea(
              child: Container(
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 0.3,
                        width: Get.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      controller.userImage.value,
                                      scale: 0.5,
                                    ),
                                    radius: 50,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: 'چوونە دەرەوە',
                                        content: const Text(
                                          'دڵنیای لە چوونە دەرەوە؟',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.darkPurple,
                                          ),
                                        ),
                                        confirm: TextButton(
                                          onPressed: () {
                                            FirebaseAuth.instance.signOut();
                                            Get.offAllNamed('/login');
                                          },
                                          child: const Text(
                                            'بەڵێ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.darkPurple,
                                            ),
                                          ),
                                        ),
                                        cancel: TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            'نەخێر',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.darkPurple,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.logout))
                              ],
                            ),
                            Text(
                              controller.userName.value,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkPurple,
                              ),
                            ),
                            Text(
                              controller.userRole.value,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkPurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            controller.datesAvailable.isEmpty
                                ? 'No dates available'
                                : 'Available Dates',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkPurple,
                            ),
                          ),
                          Container(
                            height: Get.height * 0.7,
                            width: Get.width,
                            child: ListView.builder(
                              itemCount: controller.datesAvailable.length,
                              itemBuilder: (context, index) {
                                return controller.datesAvailable.isEmpty
                                    ? const Center(
                                        child: Text(
                                          'No dates available',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.darkPurple,
                                          ),
                                        ),
                                      )
                                    : controller.chatRoomCreated.value
                                        ? const Center(
                                            child: Text(
                                              'You have already created a chat room',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.darkPurple,
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            height: Get.height * 0.2,
                                            width: Get.width,
                                            // color: Colors.grey[200],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: Get.height * 0.09,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: controller
                                                          .chatRoomCreated.value
                                                      ? Colors.grey
                                                      : AppColors.darkPurple,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      controller.datesAvailable[
                                                          index]['date'],
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: IconButton(
                                                        onPressed: controller
                                                                .chatRoomCreated
                                                                .value
                                                            ? null
                                                            : () async {
                                                                await controller.createChatRoom(
                                                                    controller.datesAvailable[
                                                                            index]
                                                                        [
                                                                        'doctorId'],
                                                                    controller.datesAvailable[
                                                                            index]
                                                                        [
                                                                        'patientId']);
                                                                controller
                                                                    .sendUsertoChatScreen();
                                                              },
                                                        icon: const Icon(
                                                          LineIcons.phoneVolume,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
