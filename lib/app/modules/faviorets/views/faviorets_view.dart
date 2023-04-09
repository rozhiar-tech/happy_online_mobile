import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../theme/app_colors.dart';
import '../controllers/faviorets_controller.dart';

class FavioretsView extends GetView<FavioretsController> {
  const FavioretsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: FavioretsController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: [
                Icons.home,
                LineIcons.comment,
                Icons.favorite,
                Icons.person,
              ],
              activeIndex: 2,
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
            body: Center(
              child: Text(
                controller.welcome.value,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        });
  }
}
