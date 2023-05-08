import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_online_mobile/app/theme/app_colors.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: UserProfileController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: [
                Icons.home,
                LineIcons.comment,
                Icons.favorite,
                Icons.person,
              ],
              activeIndex: 3,
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
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.3,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.darkPurple,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/aa.png'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          controller.userName.value,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'User',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: 'Sign Out',
                                  middleText: 'دڵنیای لە چونە دەرەوە؟',
                                  textConfirm: 'بەڵێ',
                                  textCancel: 'نەخێر',
                                  confirmTextColor: Colors.white,
                                  cancelTextColor: AppColors.darkPurple,
                                  buttonColor: AppColors.darkPurple,
                                  onConfirm: () {
                                    controller.signOut();
                                  },
                                );
                              },
                              icon: Icon(Icons.logout)),
                          SizedBox(height: 20),
                          Text(
                            'Stars',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'You have ${controller.stars.value} stars',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          // Wrap(
                          //   spacing: 10,
                          //   children: [
                          //     Chip(label: Text('Flutter')),
                          //     Chip(label: Text('Dart')),
                          //     Chip(label: Text('JavaScript')),
                          //     Chip(label: Text('React')),
                          //     Chip(label: Text('Node.js')),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
