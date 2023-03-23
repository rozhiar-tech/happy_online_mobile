import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TherapistProfileController extends GetxController {
  //TODO: Implement TherapistProfileController

  final Map<String, dynamic> args = Get.arguments;

  RxString userId = ''.obs;
  RxString userName = ''.obs;
  RxString userImage = ''.obs;
  RxString userRole = ''.obs;
  RxBool isLoading = true.obs;
  RxString bio=''.obs;

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
    bio.value=docList[0]['bio'];
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
