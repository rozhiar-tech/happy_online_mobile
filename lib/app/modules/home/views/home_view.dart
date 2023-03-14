import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_online_mobile/app/theme/app_colors.dart';

import '../controllers/home_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: [
              Icons.home,
              Icons.search,
              Icons.favorite,
              Icons.person,
            ],
            activeIndex: 0,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.softEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: (index) => print('Tab pressed $index'),
            activeColor: AppColors.darkPurple,
            inactiveColor: Colors.grey,
            splashColor: AppColors.darkPurple,
            splashSpeedInMilliseconds: 300,
            // notchAndCornersAnimation: borderRadiusAnimation,
            iconSize: 24.0,
            //other params
          ),
          body: Container(
            height: Get.height * 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: Get.height * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: Get.height * 0.2,
                            width: Get.width * 0.2,
                            // color: Colors.red,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/splash.jpg'),
                            ),
                          )
                        ],
                      )),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(10)),
                    ),
                    height: Get.height * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            textAlign: TextAlign.right,
                            ' تۆ لێرە پارێزراوی بگەڕێ لە نێوان باشترینەکان',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 3.0, top: 12),
                              child: Container(
                                height: Get.height * 0.07,
                                width: Get.width * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey[200]!,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: TextField(
                                    onChanged: (value) =>
                                        controller.searchText.value = value,
                                    // focusNode: controller.focusNode,

                                    maxLines: 1,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: controller.hintText.value,
                                      hintTextDirection: TextDirection.rtl,
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search_outlined,
                                color: AppColors.darkPurple,
                                size: 40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: Get.height * 0.47,
                      child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return docContainer();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class docContainer extends StatelessWidget {
  const docContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 10, top: 13),
      child: Container(
        height: Get.height * 0.17,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/splash.jpg'),
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 13.0, left: 10),
                  child: Text(
                    'Dr.Rozhiar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'specialist',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RatingBarIndicator(
                    rating: 3,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: AppColors.lightPink,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Spacer(),
                    SizedBox(
                      width: Get.width * 0.4,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.phone_android_rounded,
                          color: Colors.grey,
                          size: 30,
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
