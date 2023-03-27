import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_online_mobile/app/theme/app_colors.dart';

import '../controllers/therapist_profile_controller.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TherapistProfileView extends GetView<TherapistProfileController> {
  const TherapistProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: TherapistProfileController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.darkPurple,
                title: Text(
                  'دەربارەی ئەم ئەندامە',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.23,
                      width: Get.width,
                      color: AppColors.darkPurple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.white,
                          ),
                          Text(
                            controller.userName.value,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            controller.userRole.value,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 0.6,
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'دەربارەی ئەم ئەندامە',
                              style: TextStyle(
                                color: AppColors.darkPurple,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Text(
                              controller.bio.value,
                              style: TextStyle(
                                color: AppColors.darkPurple,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Text(
                            'کاتەکانی بەردەست',
                            style: TextStyle(
                              color: AppColors.darkPurple,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i < controller.datesAvailable.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.3,
                                      decoration: BoxDecoration(
                                        color: AppColors.darkPurple,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          controller.datesAvailable[i]
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              DatePicker.showDateTimePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2021, 3, 5),
                                  maxTime: DateTime(2021, 6, 7),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                if (date.isAtSameMomentAs(
                                  DateTime(
                                      controller.minDate.year,
                                      controller.minDate.month,
                                      controller.minDate.day,
                                      controller.minDate.hour,
                                      controller.minDate.minute),
                                )
                                ) 
                                {
                                  print('confirm $date');
                                  controller.selectedDate.value =
                                      date.toString();
                                } else {
                                  print("date not available");
                                }
                              }, currentTime: DateTime.now());
                            },
                            child: const Text("کاتێک هەڵبژێرە"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: controller.selectedDate.value == null
                                  ? null
                                  : () {
                                      () async {
                                        await controller
                                            .checkIfCurrentUdserHasStars();
                                      };
                                    },
                              child: Text('پەیوەندی بکە'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    controller.selectedDate.value == null
                                        ? Colors.black
                                        : AppColors.darkPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                enabledMouseCursor: SystemMouseCursors.click,
                                shadowColor: Colors.black,
                                elevation: 5,
                                // surfaceTintColor: Colors.black,
                                visualDensity: VisualDensity.lerp(
                                  // this is the line that is causing the issue
                                  VisualDensity.adaptivePlatformDensity,
                                  VisualDensity.adaptivePlatformDensity,
                                  1,
                                ),
                                animationDuration: Duration(milliseconds: 1000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
