import 'package:alegn_pay/navigation/navigation.dart';
import 'package:alegn_pay/resources/auth_controller.dart';
import 'package:alegn_pay/resources/auth_method.dart';
import 'package:alegn_pay/screen/login/components/input_field.dart';
import 'package:alegn_pay/screen/login/screen/forgot_password.dart';
import 'package:alegn_pay/screen/login/screen/personal_info.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginAccount extends StatefulWidget {
  const LoginAccount({super.key});

  @override
  State<LoginAccount> createState() => _LoginAccountState();
}

class _LoginAccountState extends State<LoginAccount> {
  bool value = false;
  final box = GetStorage();
  final userController = Get.put(AuthController());

  void signInUser() async {
    if (box.read("username") != null) {
      Get.to(() => const Navigation());
    } else {
      await userController
          .updateUsername(userController.usernameController.text);
      String res = await AuthMethods().signIn(
        email: userController.loginEmailController.text,
        password: userController.loginPasswordController.text,
      );
      if (res == "success") {
        Get.to(() => const Navigation());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              FluentSystemIcons.ic_fluent_ios_arrow_left_filled,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * .05,
              // vertical: width * .07,
            ),
            height: height * .7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login account",
                      style: TextStyle(
                        fontSize: 28,
                        height: width * .0027,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Please fill your login detail",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InputField(
                      textEditingController:
                          userController.loginEmailController,
                      type: TextInputType.emailAddress,
                      height: height,
                      width: width,
                      label: 'Email',
                      hint: 'Something@gmail.com',
                    ),
                    InputField(
                      textEditingController:
                          userController.loginPasswordController,
                      height: height,
                      width: width,
                      label: 'Password',
                      hint: '**********',
                      obscure: true,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: width * .01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: width * .7,
                        child: ElevatedButton(
                          onPressed: signInUser,
                          style: ElevatedButton.styleFrom(
                            primary: HexColor("#194BE7"),
                            padding: EdgeInsets.symmetric(
                              horizontal: width * .05,
                              vertical: width * .04,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * .03),
                            ),
                          ),
                          child: const Text(
                            "NEXT",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: width * .01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PersonalInfo(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: HexColor("#194BE7"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
