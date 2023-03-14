import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FocusNode focusNode = FocusNode();
  RxString hintText='بگەڕێ لە نێوان'.obs;
  RxString searchText = ''.obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText.value = '';
      }
      else {
        hintText.value = 'بگەڕێ لە نێوان';
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
