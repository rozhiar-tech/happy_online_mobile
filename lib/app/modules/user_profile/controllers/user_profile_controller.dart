import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:happy_online_mobile/app/routes/app_pages.dart';

class UserProfileController extends GetxController {
  //TODO: Implement UserProfileController

  RxString userName = 'john'.obs;
  RxString currentUserId = ''.obs;
  RxInt stars = 0.obs;
  RxList doclist = [].obs;

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.toNamed(Routes.LOGIN);
  }

  changeIndex(index) {
    switch (index) {
      case 0:
        Get.toNamed(
          Routes.HOME,
        );
        break;
      case 1:
        Get.toNamed(
          Routes.CHATS,
        );
        break;
      case 2:
        Get.toNamed(Routes.FAVIORETS);
        break;
      case 3:
        Get.toNamed(Routes.USER_PROFILE);
        break;
    }
  }

  Future getUserInformation(uid) async {
    final usersCollection = FirebaseFirestore.instance.collection('Users');

    final QuerySnapshot users =
        await usersCollection.where('uid', isEqualTo: uid).get();

    doclist.value = users.docs;
  }

  setUserInformation() {
    userName.value = doclist[0]['firstName'];
    stars.value = doclist[0]['stars'];
    print(doclist);
  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    currentUserId.value = FirebaseAuth.instance.currentUser!.uid;
    await getUserInformation(currentUserId.value);
    setUserInformation();
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
