import 'package:alegn_pay/resources/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final userController = Get.put(AuthController());

  Future signUpUser({
    required String email,
    required String password,
    required String phoneNumber,
    required String username,
  }) async {
    String res = 'some error ocurred';
    // check if it is not empty
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          phoneNumber.isNotEmpty) {
        // register use
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // add use to database
        _db.collection("users").doc(credential.user!.uid).set({
          "uid": credential.user!.uid,
          "username": username,
          "email": email,
          "phoneNumber": phoneNumber,
        });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
