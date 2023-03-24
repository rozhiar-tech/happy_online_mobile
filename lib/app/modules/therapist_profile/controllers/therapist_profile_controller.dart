import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_online_mobile/app/routes/app_pages.dart';

class TherapistProfileController extends GetxController {
  //TODO: Implement TherapistProfileController

  final Map<String, dynamic> args = Get.arguments;

  RxString userId = ''.obs;
  RxString userName = ''.obs;
  RxString userImage = ''.obs;
  RxString userRole = ''.obs;
  RxBool isLoading = true.obs;
  RxString bio = ''.obs;
  RxString currentUser = ''.obs;

  RxList docList = [].obs;

  userIdFromArgs() {
    userId.value = args['userId'];
  }

  Future getSingleTherapist(uid) async {
    final usersCollection = FirebaseFirestore.instance.collection('Users');

    final QuerySnapshot users =
        await usersCollection.where('uid', isEqualTo: uid).get();

    docList.value = users.docs;
  }

  setUserInformation() {
    userName.value = docList[0]['firstName'];
    // userImage.value = docList[0]['image'];
    userRole.value = docList[0]['role'];
    bio.value = docList[0]['bio'];
  }

  Future checkIfCurrentUdserHasStars() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    currentUser.value = _auth.currentUser!.uid;
    final usersCollection = FirebaseFirestore.instance.collection('Users');

    final QuerySnapshot users = await usersCollection
        .where('uid', isEqualTo: currentUser.value)
        .where('stars', isGreaterThan: 0)
        .get();

    if (users.docs.length > 0) {
      print("user has stars");
    } else {
      Get.defaultDialog(
        title: "پێویستت بە ستاری زیاترە بۆ پەیوەندی کردن",
        middleText: "دەتەوێت ستار بکڕیت",
        textConfirm: "باشە",
        textCancel: "نەخێر",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.toNamed(Routes.STARS, arguments: {
            'userId': currentUser.value,
          });
          // Get.toNamed(Routes.HOME);
        },
        onCancel: () => Get.close,
      );
    }
  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    userIdFromArgs();
    await getSingleTherapist(userId.value);
    setUserInformation();
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
