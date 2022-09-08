import 'package:alegn_pay/navigation/navigation.dart';
import 'package:alegn_pay/screen/login/components/input_field.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class EnterNewPassword extends StatelessWidget {
  const EnterNewPassword({super.key});

  @override
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(width * .1),
            Center(
              child: Image.asset(
                "assets/images/new password.png",
                height: height * .3,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: height * .5,
              padding: EdgeInsets.all(width * .05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width * .05),
                  topRight: Radius.circular(width * .05),
                ),
              ),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Enter new password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                    const Text(
                      "Enter your new password",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    InputField(
                      height: height,
                      width: width,
                      label: 'Enter Your New Password',
                      hint: 'Enter Your New Password',
                    ),
                    InputField(
                      height: height,
                      width: width,
                      label: 'Confirm Your  password',
                      hint: 'Confirm Your  password',
                    ),
                    Gap(width * .05),
                    SizedBox(
                      width: width * .7,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuilderContext) => const Navigation()));
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
            )
          ],
        ),
      ),
    );
  }
}
