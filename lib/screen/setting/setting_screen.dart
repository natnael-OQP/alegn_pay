import 'package:alegn_pay/screen/setting/search_form.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final box = GetStorage();

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
            automaticallyImplyLeading: false,
            // leading: IconButton(
            //   onPressed: () {
            //     Get.to(() => const Navigation());
            //   },
            //   icon: const Icon(
            //     FluentSystemIcons.ic_fluent_ios_arrow_left_filled,
            //     color: Colors.white,
            //   ),
            // ),
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                top: height * .15,
                left: 0,
                right: 0,
                child: Container(
                  height: height * .8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * .05),
                      topRight: Radius.circular(width * .05),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * .15 - 40,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * .05,
                    right: width * .05,
                    bottom: width * .05,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: width * .25,
                        width: width * .25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(width * .2),
                        ),
                        child: Image.asset(
                          "assets/images/otp-verification.png",
                          width: width * .4,
                          height: width * .4,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          box.read("username"),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "+251 ${(box.read("phoneNumber")).toString().substring(1)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Gap(width * .05),
                      const SearchForm(),
                      Gap(width * .05),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "PROFILE",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SettingCard(
                        width: width,
                        image: "assets/icons/account.png",
                        title: "Account detail",
                      ),
                      SettingCard(
                        width: width,
                        image: "assets/icons/document.png",
                        title: "Document",
                      ),
                      Gap(width * .05),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "BANK DETAIL",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SettingCard(
                        width: width,
                        image: "assets/icons/document.png",
                        title: "Bank Account",
                      ),
                      Gap(width * .05),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "NOTIFICATION",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SettingRadioCard(
                        width: width,
                        image: "assets/icons/activities.png",
                        title: "Activities notifications",
                        desc: "Payment Success, Failed and other activities",
                      ),
                      SettingRadioCard(
                        width: width,
                        image: "assets/icons/sms.png",
                        title: "SMS notifications ",
                      ),
                      Gap(width * .05),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "SECURITY",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SettingCard(
                        width: width,
                        image: "assets/icons/password.png",
                        title: "Change password",
                      ),
                      SettingCard(
                        width: width,
                        image: "assets/icons/privacy.png",
                        title: "Privacy",
                      ),
                      Gap(width * .05),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "DISPLAY",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SettingRadioCard(
                        width: width,
                        image: "assets/icons/dark.png",
                        title: "Dark mode",
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "SUPPORT",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SettingCard(
                        width: width,
                        image: "assets/icons/help.png",
                        title: "Help & Support",
                      ),
                      SettingCard(
                        width: width,
                        image: "assets/icons/about.png",
                        title: "About",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class SettingCard extends StatelessWidget {
  const SettingCard({
    Key? key,
    required this.width,
    required this.title,
    required this.image,
  }) : super(key: key);

  final double width;
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: width * .03),
      child: Row(
        children: [
          Image.asset(image),
          Gap(width * .03),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Icon(
                      FluentSystemIcons.ic_fluent_ios_chevron_right_regular,
                      size: 30,
                      color: Colors.black38,
                    ),
                  ],
                ),
                Gap(width * .01),
                Container(
                  height: width * .001,
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SettingRadioCard extends StatelessWidget {
  const SettingRadioCard({
    Key? key,
    required this.width,
    required this.title,
    required this.image,
    this.desc,
  }) : super(key: key);

  final double width;
  final String title, image;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: width * .03),
      child: Row(
        children: [
          Image.asset(image),
          Gap(width * .03),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    desc == null
                        ? Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "$desc",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    Switch(
                      value: desc == null ? false : true,
                      onChanged: (value) {
                        true;
                      },
                      activeTrackColor: Colors.green,
                      activeColor: Colors.white,
                    )
                  ],
                ),
                Gap(width * .01),
                Container(
                  height: width * .001,
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
