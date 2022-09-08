import 'package:alegn_pay/screen/login/components/input_field.dart';
import 'package:alegn_pay/screen/login/otp_verification.dart';
import 'package:alegn_pay/screen/login/screen/work_info.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  bool value = false;
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
                "Please fill your Account information's",
                style: TextStyle(
                  fontSize: 15,
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
                            color: HexColor("#194BE7"),
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
                  Container(
                    margin: EdgeInsets.only(top: width * .09),
                    height: height * .055,
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(width * .02),
                          ),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.black38,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: " CBE, Awash Bank, Nib International Bank",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        ),
                      ),
                    ),
                  ),
                  InputField(
                    height: height,
                    width: width,
                    hint: 'Enter Your CBE bank account',
                  ),
                  InputField(
                    height: height,
                    width: width,
                    hint: 'Enter Your Awash bank account',
                  ),
                  InputField(
                    height: height,
                    width: width,
                    hint: 'Enter Your New Password',
                  ),
                  InputField(
                    height: height,
                    width: width,
                    hint: 'Confirm Your Password',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: width * .01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "I agree to the",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Gap(height * .04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * .4,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const WorkInfo(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .05,
                          vertical: width * .04,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * .03),
                        ),
                        side: const BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      child: const Text(
                        "BACK",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * .4,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const OTPVerification(),
                          ),
                        );
                      },
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
                        "FINISH",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
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
          color: index == 1 ? HexColor("#194BE7") : Colors.black12,
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
