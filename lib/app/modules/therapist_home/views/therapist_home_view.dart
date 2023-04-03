import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_online_mobile/app/theme/app_colors.dart';

import '../controllers/therapist_home_controller.dart';

class TherapistHomeView extends GetView<TherapistHomeController> {
  const TherapistHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: TherapistHomeController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.2,
                      width: Get.width,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              controller.userImage.value,
                              scale: 0.5,
                            ),
                            radius: 50,
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
                    Container(
                      height: Get.height * 0.7,
                      width: Get.width,
                      child: ListView.builder(
                        itemCount: controller.datesAvailable.length,
                        itemBuilder: (context, index) {
                          return controller.datesAvailable.isEmpty
                              ? Center(
                                  child: Text(
                                    'No dates available',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkPurple,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: Get.height * 0.2,
                                  width: Get.width,
                                  // color: Colors.grey[200],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: Get.height * 0.09,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightPink,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            controller.datesAvailable[index]
                                                ['date'],
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.darkPurple,
                                            ),
                                          ),
                                          Text(
                                            controller.datesAvailable[index]
                                                ['patientId'],
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.darkPurple,
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
                    Text("data")
                  ],
                ),
              ),
            ),
          );
        });
  }
}
