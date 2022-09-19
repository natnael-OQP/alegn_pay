import 'package:alegn_pay/models/user.dart' as model;
import 'package:alegn_pay/resources/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final userController = Get.put(AuthController());
  final box = GetStorage();

  // sign up User
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
        model.User user = model.User(
          email: email,
          username: username,
          uid: credential.user!.uid,
          phoneNumber: phoneNumber,
        );

        _db.collection("users").doc(credential.user!.uid).set(user.toJson());
        // store data locally
        box.write("uid", credential.user!.uid);
        box.write("username", username);
        box.write("email", email);
        box.write("phoneNumber", phoneNumber);

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // sign In User
  Future signIn({
    required String email,
    required String password,
  }) async {
    String res = "some error occur";
    // sign in with email and password
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("************************************************");
      final DocumentReference document =
          _db.collection("users").doc(cred.user!.uid);

      await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
        Object data = snapshot.data;
      });
      // store data locally
      // box.write("uid", credential.user!.uid);
      // box.write("username", username);
      // box.write("email", email);
      // box.write("phoneNumber", phoneNumber);

    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
