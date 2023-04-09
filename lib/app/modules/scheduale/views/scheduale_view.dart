import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:happy_online_mobile/app/theme/app_colors.dart';

import '../controllers/scheduale_controller.dart';

class SchedualeView extends GetView<SchedualeController> {
  const SchedualeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: SchedualeController(),
        builder: (controller) {
          return Scaffold(
              body: SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  Text(
                    "کاتی ئیشکردنت دیاری بکە",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkPurple,
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
                          maxTime: DateTime(2021, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text("کاتی ئیشکردنت دیاری بکە"),
                  )
                ],
              ),
            ),
          ));
        });
  }
}
