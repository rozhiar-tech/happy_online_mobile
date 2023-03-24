import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignUpController extends GetxController {
  //TODO: Implement SignUpController

  RxString email = "".obs;
  RxString password = "".obs;
  RxString passwordConfirm = "".obs;
  RxString name = "".obs;
  RxString phone = "".obs;
  RxString signUpText = "جونە بڕۆ".obs;
  RxString lastName = "".obs;
  RxString nationalCode = "".obs;

  final count = 0.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future signUp(String email, String password, String name, String phone,
      String lastName, String nationalCode) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await firestore.collection("Users").doc(userCredential.user!.uid).set({
        "name": name,
        "phone": phone,
        "lastName": lastName,
        "nationalCode": nationalCode,
        "email": email,
        "uid": userCredential.user!.uid,
        "role": "user",
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', userCredential.user!.uid);

      Get.toNamed("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
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
