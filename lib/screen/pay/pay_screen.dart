import 'package:alegn_pay/screen/pay/screen/merchant_screen.dart';
import 'package:alegn_pay/screen/pay/screen/school_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            FluentSystemIcons.ic_fluent_ios_arrow_left_filled,
            color: Colors.black,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Pay",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              "Choose the one whom you are going to pay ",
              style: TextStyle(
                fontSize: 8,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(width * .1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PrimaryButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext) => const MerchantScreen(),
                        ),
                      );
                    },
                    width: width,
                    title: "merchant",
                    image: "assets/icons/merchant.png"),
                PrimaryButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext) => const SchoolScreen(),
                        ),
                      );
                    },
                    width: width,
                    title: "School",
                    image: "assets/icons/school.png"),
              ],
            ),
            Gap(width * .07),
            const Text(
              "Coming Soon",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SecondaryButton(
                    width: width,
                    title: "Landlord",
                    image: "assets/icons/landlord.png"),
                SecondaryButton(
                    width: width,
                    title: "Hospital",
                    image: "assets/icons/hospital.png"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SecondaryButton(
                    width: width,
                    title: "Travel",
                    image: "assets/icons/travel.png"),
                SecondaryButton(
                    width: width,
                    title: "Event",
                    image: "assets/icons/event.png"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SecondaryButton(
                    width: width,
                    title: "Other",
                    image: "assets/icons/other.png"),
                SecondaryButton(
                    width: width,
                    title: "Pending",
                    image: "assets/icons/pending.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.width,
    required this.title,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String title, image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * .3,
      height: width * .3,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          alignment: Alignment.center,
          primary: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: width * .05,
            vertical: width * .04,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
              width: width * .002,
            ),
            borderRadius: BorderRadius.circular(width * .03),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            Gap(width * .02),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.width,
    required this.title,
    required this.image,
  }) : super(key: key);

  final double width;
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: width * .05),
      width: width * .28,
      height: width * .28,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 2,
          alignment: Alignment.center,
          primary: HexColor("#EEEEEE"),
          padding: EdgeInsets.symmetric(
            horizontal: width * .05,
            vertical: width * .04,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * .03),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            Gap(width * .02),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black26,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
