import 'package:alegn_pay/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: height * .1,
              left: width * .05,
              right: width * .05,
              bottom: width * .1,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/bg1.png",
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get credits anytime, anywhere, with no collateral!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                    Gap(width * .03),
                    SizedBox(
                      width: width * .7,
                      child: const Text(
                        "Get credits based on your income to purchase and get services right when and where you want",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: HexColor("#194BE7"),
                        dotColor: Colors.black45,
                        dotHeight: 10,
                      ),
                    ),
                    Gap(width * .1),
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                        child: const Text(
                          "Next",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: height * .1,
              left: width * .05,
              right: width * .05,
              bottom: width * .1,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/bg2.png",
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pay your credits on your chosen installment options",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                    Gap(width * .03),
                    SizedBox(
                      width: width * .7,
                      child: const Text(
                        "Choose the time duration and the amount of money based on your preferred options",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: HexColor("#194BE7"),
                        dotColor: Colors.black45,
                        dotHeight: 10,
                      ),
                    ),
                    Gap(width * .1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Skip",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Gap(width * .03),
                        TextButton(
                          onPressed: () => pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          ),
                          child: const Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: height * .1,
              left: width * .05,
              right: width * .05,
              bottom: width * .1,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/bg3.png",
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enjoy your purchase service without being worried about inflation",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                    Gap(width * .03),
                    SizedBox(
                      width: width * .7,
                      child: const Text(
                        "Knockdown inflation and purchase now, and enjoy every moment of your payment without stress",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: HexColor("#194BE7"),
                        dotColor: Colors.black45,
                        dotHeight: 10,
                      ),
                    ),
                    Gap(width * .1),
                    SizedBox(
                      width: width * .75,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: HexColor("#194BE7"),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * .05,
                            vertical: width * .04,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * .03),
                          ),
                        ),
                        child: const Text(
                          "Get Started",
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
        ],
      ),
    );
  }
}
