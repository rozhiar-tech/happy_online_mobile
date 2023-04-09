import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX(
          init: SignUpController(),
          builder: (controller) {
            return Scaffold(
              body: Container(
                height: Get.height,
                width: Get.width,
                // color: Colors.amber,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          "assets/splash.jpg",
                        ),
                      ),
                      Text("تۆماربوون"),
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
                          onChanged: (value) => controller.email.value = value,
                        ),
                      ),
                      Container(
                        height: Get.height * 0.1,
                        width: Get.width * 0.8,
                        child: TextField(
                          obscureText: true,
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
                            labelText: 'پاسۆرد',
                          ),
                          onChanged: (value) =>
                              controller.password.value = value,
                        ),
                      ),
                      Container(
                        height: Get.height * 0.1,
                        width: Get.width * 0.8,
                        child: TextField(
                          obscureText: true,
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
                            labelText: 'پاسۆرد دووبارە',
                          ),
                          onChanged: (
                            value,
                          ) =>
                              controller.passwordConfirm.value = value,
                        ),
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
                            labelText: 'ناو',
                          ),
                          onChanged: (value) => controller.name.value = value,
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.lightPink,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () async {
                            await controller.signUp(
                              controller.email.value,
                              controller.password.value,
                              controller.name.value,
                              controller.phone.value,
                              controller.lastName.value,
                              controller.nationalCode.value,
                            );
                          },
                          child: Text(
                            controller.signUpText.value,
                          )),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
