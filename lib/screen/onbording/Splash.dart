import 'package:alegn_pay/navigation/navigation.dart';
import 'package:alegn_pay/screen/onbording/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  @override
  void initState() {
    // box.erase();
    navigateToOnboardScreen();
    super.initState();
  }

  navigateToOnboardScreen() async {
    if (box.read("username") != null) {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      Get.to(() => const Navigation());
    } else {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      Get.to(() => const OnboardScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/bg.png",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset("assets/images/logo.png"),
              Gap(width * .1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ALEGN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                  Gap(width * .03),
                  const Text(
                    "PAY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                "Powered by Alegn Pay ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.white54,
                ),
              ),
              Gap(width * .1)
            ],
          ),
        ),
      ),
    );
  }
}
