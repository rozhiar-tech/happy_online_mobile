import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FocusNode focusNode = FocusNode();
  RxString hintText = 'بگەڕێ لە نێوان'.obs;
  RxString searchText = ''.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString userName = ''.obs;
  RxString userImage = ''.obs;
  RxString userRole = ''.obs;
  RxBool isLoading = true.obs;
  RxList docList = [].obs;

  Future getSearchResults(String searchField) async {
    return await firestore
        .collection('products')
        .where('searchKey',
            arrayContains: searchField.substring(0, 1).toUpperCase())
        .get();
  }

  clickOnbookButtonForTherapist(index) {
    print(index);
    Get.toNamed(Routes.THERAPIST_PROFILE, arguments: {
      'userId': index,
    });
  }

  changeIndex(index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        Get.toNamed(Routes.LOGIN);
        break;
      case 2:
        Get.toNamed(Routes.SIGN_UP);
        break;
      case 3:
        Get.toNamed(Routes.HOME);
        break;
    }
  }

  checkUserIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');
    if (uid != null) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  Future getTherapistUsers() async {
    final usersCollection = FirebaseFirestore.instance.collection('Users');

    final QuerySnapshot users =
        await usersCollection.where('role', isEqualTo: 'therapist').get();

    docList.value = users.docs;
  }

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    checkUserIsLoggedIn();
    await getTherapistUsers();
    isLoading.value = !isLoading.value;
    print(docList[0]['uid']);
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
