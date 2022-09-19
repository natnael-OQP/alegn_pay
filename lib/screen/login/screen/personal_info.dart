import 'package:alegn_pay/resources/auth_controller.dart';
import 'package:alegn_pay/resources/auth_method.dart';
import 'package:alegn_pay/screen/login/components/input_field.dart';
import 'package:alegn_pay/screen/login/screen/account_info.dart';
import 'package:alegn_pay/screen/login/screen/work_info.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final userController = Get.put(AuthController());
  final box = GetStorage();

  void signUpUser() async {
    if (box.read("username") != null) {
      Get.to(() => const WorkInfo());
    } else {
      String res = await AuthMethods().signUpUser(
        email: userController.emailController.text,
        password: userController.passwordController.text,
        phoneNumber: userController.phoneNumberController.text,
        username: userController.usernameController.text,
      );
      if (res == "success") {
        Get.to(() => const WorkInfo());
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * .04,
            vertical: width * .07,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create new account",
                style: TextStyle(
                  fontSize: 28,
                  height: width * .0027,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                "Please fill the input below here",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * .15,
                  right: width * .15,
                  top: height * .035,
                  bottom: height * .01,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconContainer(
                          index: 1,
                          onTap: () => {},
                        ),
                        Expanded(
                          child: Container(
                            height: 3,
                            color: Colors.black12,
                          ),
                        ),
                        IconContainer(
                          index: 2,
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const WorkInfo(),
                              ),
                            )
                          },
                        ),
                        Expanded(
                          child: Container(
                            height: 3,
                            color: Colors.black12,
                          ),
                        ),
                        IconContainer(
                          index: 3,
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AccountInfo(),
                              ),
                            )
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InputField(
                    textEditingController: userController.usernameController,
                    height: height,
                    width: width,
                    label: 'Full Name',
                    hint: 'Enter Your Full Name',
                  ),
                  InputField(
                    textEditingController: userController.phoneNumberController,
                    type: TextInputType.number,
                    height: height,
                    width: width,
                    label: 'Phone Number',
                    hint: '0911290838',
                  ),
                  InputField(
                    textEditingController: userController.emailController,
                    type: TextInputType.emailAddress,
                    height: height,
                    width: width,
                    label: 'Email',
                    hint: 'Something@gmail.com',
                  ),
                  InputField(
                    textEditingController: userController.passwordController,
                    height: height,
                    width: width,
                    label: 'Password',
                    hint: '**********',
                    obscure: true,
                  ),
                ],
              ),
              Gap(height * .13),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width * .7,
                      child: ElevatedButton(
                        onPressed: signUpUser,
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
                    padding: EdgeInsets.only(top: width * .03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Gap(width * .02),
                        Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#194BE7"),
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
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final VoidCallback onTap;
  final int index;

  const IconContainer({
    Key? key,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          "$index",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
