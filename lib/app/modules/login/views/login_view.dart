import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_online_mobile/app/theme/app_colors.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX(
          init: LoginController(),
          builder: (controller) {
            return Scaffold(
              body: Container(
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height * 0.7,
                        width: Get.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                  "assets/aa.png",
                                ),
                              ),
                            ),
                            Text("چوونەژوورەوە"),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: Get.height * 0.1,
                              width: Get.width * 0.8,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        BorderSide(color: AppColors.lightPink),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        BorderSide(color: AppColors.lightPink),
                                  ),
                                  labelText: 'ئیمەیل',
                                ),
                                onChanged: (value) =>
                                    controller.email.value = value,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: Get.height * 0.1,
                              width: Get.width * 0.8,
                              child: TextField(
                                // textAlign: TextAlign.end,
                                obscureText: true,
                                textDirection: TextDirection.ltr,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: AppColors.lightPink),
                                  ),
                                  labelText: 'تێپەر وشە',
                                ),
                                onChanged: (value) =>
                                    controller.password.value = value,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: Get.width * 0.8,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await controller.login(
                                        controller.email.value,
                                        controller.password.value);
                                  },
                                  child: Text(controller.loginText.value),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.lightPink,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 50,
                                width: Get.width * 0.8,
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.SIGN_UP);
                                      },
                                      child: Text(
                                        "تۆماربکە",
                                        style: TextStyle(
                                            color: AppColors.lightPink),
                                      ),
                                    ),
                                    Text("هەژمارت نییە؟"),
                                  ],
                                )),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
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
