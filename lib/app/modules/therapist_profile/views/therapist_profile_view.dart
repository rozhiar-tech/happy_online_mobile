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
              body: Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.lightPink,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: Get.height * 0.23,
                      width: Get.width,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: Image.asset(
                              'assets/splash.jpg',
                            ).image,
                          ),
                          Text(
                            controller.userName.value,
                            style: TextStyle(
                              color: AppColors.darkPurple,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            controller.userRole.value,
                            style: TextStyle(
                              color: AppColors.darkPurple,
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
                          // const Text(
                          //   'کاتەکانی بەردەست',
                          //   textAlign: TextAlign.left,
                          //   style: TextStyle(
                          //     color: AppColors.darkPurple,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          // SingleChildScrollView(
                          //   child: Row(
                          //     children: [
                          //       for (int i = 0;
                          //           i < controller.datesAvailable.length;
                          //           i++)
                          //         Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Container(
                          //             height: Get.height * 0.1,
                          //             width: Get.width * 0.15,
                          //             decoration: BoxDecoration(
                          //               color: AppColors.darkPurple,
                          //               borderRadius: BorderRadius.circular(10),
                          //             ),
                          //             child: Column(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               children: [
                          //                 Text(
                          //                   controller.datesAvailable[i]
                          //                               .toString()
                          //                               .substring(6, 7) ==
                          //                           "1"
                          //                       ? "Jan"
                          //                       : controller.datesAvailable[i]
                          //                                   .toString()
                          //                                   .substring(6, 7) ==
                          //                               "2"
                          //                           ? "Feb"
                          //                           : controller.datesAvailable[i]
                          //                                       .toString()
                          //                                       .substring(
                          //                                           6, 7) ==
                          //                                   "3"
                          //                               ? "Mar"
                          //                               : controller.datesAvailable[i]
                          //                                           .toString()
                          //                                           .substring(
                          //                                               6, 7) ==
                          //                                       "4"
                          //                                   ? "Apr"
                          //                                   : controller.datesAvailable[i]
                          //                                               .toString()
                          //                                               .substring(
                          //                                                   6, 7) ==
                          //                                           "5"
                          //                                       ? "May"
                          //                                       : controller.datesAvailable[i].toString().substring(6, 7) ==
                          //                                               "6"
                          //                                           ? "Jun"
                          //                                           : controller.datesAvailable[i].toString().substring(6, 7) == "7"
                          //                                               ? "Jul"
                          //                                               : controller.datesAvailable[i].toString().substring(6, 7) == "8"
                          //                                                   ? "Aug"
                          //                                                   : controller.datesAvailable[i].toString().substring(6, 7) == "9"
                          //                                                       ? "Sep"
                          //                                                       : controller.datesAvailable[i].toString().substring(6, 7) == "10"
                          //                                                           ? "Oct"
                          //                                                           : controller.datesAvailable[i].toString().substring(6, 7) == "11"
                          //                                                               ? "Nov"
                          //                                                               : controller.datesAvailable[i].toString().substring(6, 7) == "12"
                          //                                                                   ? "Dec"
                          //                                                                   : "error",
                          //                   style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 12,
                          //                   ),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 11,
                          //                 ),
                          //                 Text(
                          //                   controller.datesAvailable[i]
                          //                       .toString()
                          //                       .substring(8, 10),
                          //                   style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 20,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         )
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          // Column(
                          //   children: [
                          //     Row(
                          //       children: [
                          //         for (int i = 0;
                          //             i < controller.datesAvailable.length;
                          //             i++)
                          //           Padding(
                          //             padding: const EdgeInsets.all(8.0),
                          //             child: Container(
                          //               height: Get.height * 0.05,
                          //               width: Get.width * 0.2,
                          //               decoration: BoxDecoration(
                          //                 color: AppColors.darkPurple,
                          //                 borderRadius:
                          //                     BorderRadius.circular(10),
                          //               ),
                          //               child: Center(
                          //                 child: Text(
                          //                   controller.datesAvailable[i]
                          //                       .toString()
                          //                       .substring(11),
                          //                   style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 12,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           )
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // ElevatedButton(
                          //   onPressed: () async {
                          //     DatePicker.showDateTimePicker(context,
                          //         showTitleActions: true,
                          //         minTime: DateTime(2021, 3, 5),
                          //         maxTime: DateTime(2021, 6, 7),
                          //         onChanged: (date) {
                          //       print('change $date');
                          //     }, onConfirm: (date) {
                          //       if (controller.datesAvailable.contains(
                          //           date.toString().substring(0, 16))) {
                          //         Get.defaultDialog(
                          //             title: "کاتێک هەڵبژێرە",
                          //             middleText:
                          //                 "ئەم کاتە هەڵبژێی؟ ${date.toString().substring(0, 16)}",
                          //             textConfirm: "بەڵێ",
                          //             textCancel: "نەخێر",
                          //             confirmTextColor: Colors.white,
                          //             cancelTextColor: AppColors.darkPurple,
                          //             buttonColor: AppColors.darkPurple,
                          //             onConfirm: () async {
                          //               await controller.setTheDateToDoctor(
                          //                   date.toString().substring(0, 16));
                          //               Get.back();
                          //             },
                          //             onCancel: () {
                          //               Get.close;
                          //             });
                          //       } else {
                          //         Get.defaultDialog(
                          //             title: "کاتەکەت هەڵەیە ",
                          //             middleText:
                          //                 "کاتەکەت هەڵەیە تکایە کاتێکی تر هەڵبژێرە",
                          //             textConfirm: "باش",
                          //             confirmTextColor: Colors.white,
                          //             cancelTextColor: AppColors.darkPurple,
                          //             buttonColor: AppColors.darkPurple,
                          //             onConfirm: () {
                          //               Get.close;
                          //             },
                          //             onCancel: () {
                          //               Get.close;
                          //             });
                          //       }
                          //     }, currentTime: DateTime.now());
                          //   },
                          //   child: const Text("کاتێک هەڵبژێرە"),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                await controller.checkIfCurrentUdserHasStars();
                              },
                              child: Text('پەیوەندی بکە'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.darkPurple,
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
