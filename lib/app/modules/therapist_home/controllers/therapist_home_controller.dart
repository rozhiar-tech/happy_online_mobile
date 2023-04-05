import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:happy_online_mobile/app/routes/app_pages.dart';

class TherapistHomeController extends GetxController {
  //TODO: Implement TherapistHomeController

  final Map<String, dynamic> args = Get.arguments;
  RxString userId = ''.obs;
  RxString userName = ''.obs;
  RxString userImage = ''.obs;
  RxString userRole = ''.obs;
  RxBool isLoading = true.obs;
  RxList docList = [].obs;
  RxList datesAvailable = [].obs;
  RxString date = ''.obs;

  userIdFromArgs() {
    userId.value = args['userId'];
  }

  Future getTheTherapistInfo(uid) async {
    final usersCollection = FirebaseFirestore.instance.collection('Users');

    final QuerySnapshot users =
        await usersCollection.where('uid', isEqualTo: uid).get();

    docList.value = users.docs;

    userName.value = docList[0]['firstName'];
    userRole.value = docList[0]['role'];
    userImage.value = docList[0]['photoUrl'];
  }

  Future getTheSchedual(uid) async {
    final usersCollection = FirebaseFirestore.instance
        .collection('Users')
        .where('uid', isEqualTo: uid);

    final QuerySnapshot users = await usersCollection
        .get()
        .then((value) => value.docs[0].reference.collection('schedule').get());

    datesAvailable.value = users.docs;
    date.value = datesAvailable[0]['date'];
  }

  setTheDates() {
    date.value = datesAvailable[0]['date'];
  }

  sendUsertoChatScreen(senderId, reciepientId) {
    Get.toNamed(Routes.CHAT_SCREEN, arguments: {
      'senderId': senderId,
      'reciepientId': reciepientId,
    });
  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    userIdFromArgs();
    await getTheTherapistInfo(userId.value);
    await getTheSchedual(userId.value);

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
