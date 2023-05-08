import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../controllers/stars_controller.dart';

class StarsView extends GetView<StarsController> {
  const StarsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX(
          init: StarsController(),
          builder: (controller) {
            return Scaffold(
              body: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("کڕینی ستار"),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Get.back();
                      //   },
                      //   child: Text("Back"),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.3,
                              decoration: BoxDecoration(
                                color: AppColors.darkPurple,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "١ ستار",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "١٠،٠٠٠ دینار",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.3,
                              decoration: BoxDecoration(
                                color: AppColors.darkPurple,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "٢ ستار",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "٢٠،٠٠٠ دینار",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.3,
                              decoration: BoxDecoration(
                                color: AppColors.darkPurple,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  const Text(
                                    "٣ ستار",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    controller.price.value,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                                "بە داوای لێبوردنەوە لە ئێستا تەنها ڕێگە بۆ کڕینی ستار ناردنی پارەیە بۆ ئەکاونتی فاست پەی ئەم رەقەمە یاخود ناردنی بۆ ئەکاونتی ف ئای بی",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("0771 020 7959",
                                style: TextStyle(
                                  color: AppColors.darkPurple,
                                  fontSize: 20,
                                )),
                          ),
                          Text(
                              "لەگەڵ ناردنی ئاگادارمان بکەرەوە ستارەکان ئەکەینە ئەکاونتەکەتەوە")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
