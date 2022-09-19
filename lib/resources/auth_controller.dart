import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final username = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final phoneNumber = ''.obs;
  final isLoading = false.obs;
  // final employmentStatus = ''.obs;
  // final tinNumber = ''.obs;
  // final idNumber = ''.obs;
  // final cbeBankAccount = ''.obs;
  // increment() => ;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  updateUsername(String name) {
    username(name);
  }

  updateLoading() {
    isLoading(true);
  }

  updateEmail(String name) {
    email(name);
  }

  updatePassword(String name) {
    password(name);
  }

  updatePhoneNumber(String name) {
    phoneNumber(name);
  }
}
