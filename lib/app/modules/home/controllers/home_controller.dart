import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FocusNode focusNode = FocusNode();
  RxString hintText = 'بگەڕێ لە نێوان'.obs;
  RxString searchText = ''.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString userName = ''.obs;
  RxString userImage = ''.obs;
  RxString userRole = ''.obs;

  Future getSearchResults(String searchField) async {
    return await firestore
        .collection('products')
        .where('searchKey',
            arrayContains: searchField.substring(0, 1).toUpperCase())
        .get();
  }

  Future getTherapistUsers() async {
    return await firestore
        .collection('Users')
        .where('role', isEqualTo: 'therapist')
        .get();
  }

  setCredentilasFromFirebase(String name, String image, String role) {
    userName.value = name;
    userImage.value = image;
    userRole.value = role;
  }

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getTherapistUsers();
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
