import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_online_mobile/app/theme/app_colors.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Payment"),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Back"),
            ),
            Row(
              children: [
                Container(
                  height: Get.height * 0.1,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                    color: AppColors.darkPurple,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
