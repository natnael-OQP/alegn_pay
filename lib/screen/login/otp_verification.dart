import 'package:alegn_pay/navigation/navigation.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/bg.png",
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              FluentSystemIcons.ic_fluent_ios_arrow_left_filled,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Image.asset(
                  "assets/images/otp-verification.png",
                  height: height * .435,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(width * .05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * .05),
                    topRight: Radius.circular(width * .05),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "OTP Verification",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Enter the OTP sent to ",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "+251-912-456-678",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Gap(width * .05),
                      //
                      PinCodeTextField(
                        length: 5,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        pinTheme: PinTheme(
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          inactiveColor: Colors.grey,
                          inactiveFillColor: Colors.transparent,
                          activeColor: Colors.transparent,
                          selectedFillColor: Colors.transparent,
                          // activeColor: Colors.transparent,
                          activeFillColor: Colors.white,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        controller: textEditingController,
                        cursorColor: Colors.grey,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't receive the OTP?",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "RESEND OTP",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * .7,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (builder) => const Navigation(),
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
                            "VERIFY & PROCEED",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
