import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  RxString email = "".obs;
  RxString password = "".obs;
  RxString loginText = "جونە ژوورەوە".obs;

  Future checkIfUserIsTherapistOrNormalUser(uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var doc = await firestore.collection('Users').doc(uid).get();
    if (doc.exists) {
      if (doc.data()!['role'] == 'therapist') {
        Get.offAllNamed(Routes.THERAPIST_HOME, arguments: {
          'userId': uid,
        });
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', userCredential.user!.uid);
      checkIfUserIsTherapistOrNormalUser(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  checkIfUserisTherapistOrNormaluser2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString('uid');
    checkIfUserIsTherapistOrNormalUser(uid);
  }

  final count = 0.obs;
  @override
  void onInit() async {
    await checkIfUserisTherapistOrNormaluser2();
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
