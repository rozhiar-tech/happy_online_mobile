import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../routes/app_pages.dart';

class ChatsController extends GetxController {
  RxString doctorId = ''.obs;
  RxString patientId = ''.obs;
  RxString docName = ''.obs;
  RxList doclist = [].obs;
  RxList doclist2 = [].obs;
  RxString doctorUid = ''.obs;

  checkIfcurrentUserIsnormalUser() async {
    final usersCollection = FirebaseFirestore.instance.collection('Users');

    final QuerySnapshot users = await usersCollection
        .where('uid', isEqualTo: currentUserId.value)
        .where('role', isEqualTo: 'user')
        .get();

    doclist2.value = users.docs;

    if (doclist2.length > 0) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.THERAPIST_HOME, arguments: {
        'userId': currentUserId.value,
      });
    }
  }

  //TODO: Implement ChatsController

  RxString currentUserId = ''.obs;
  changeIndex(index) async {
    switch (index) {
      case 0:
        await checkIfcurrentUserIsnormalUser();
        break;
      case 1:
        Get.toNamed(Routes.CHATS);
        break;
      case 2:
        Get.toNamed(Routes.SIGN_UP);
        break;
      case 3:
        Get.toNamed(Routes.HOME);
        break;
    }
  }

  getDoctorName(uid) async {
    final usersCollection = FirebaseFirestore.instance.collection('Users');

    final QuerySnapshot users =
        await usersCollection.where('uid', isEqualTo: uid).get();

    doclist2.value = users.docs;

    if (doclist2.length > 0) {
      docName.value = doclist2[0]['firstName'];
    } else {
      docName.value = 'Doctor';
    }
  }

  final count = 0.obs;
  @override
  onInit() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    currentUserId.value = auth.currentUser!.uid;
    await getDoctorName(doctorUid.value);

    super.onInit();
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
