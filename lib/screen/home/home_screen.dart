import 'package:alegn_pay/screen/pay/pay_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset("assets/images/small logo.png"),
            const Text(
              "  ALEGN",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Text(
              " PAY",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FluentSystemIcons.ic_fluent_alert_regular,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .04,
          vertical: width * .07,
        ),
        child: Column(
          children: [
            Container(
              width: width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                vertical: width * .04,
                horizontal: width * .05,
              ),
              decoration: BoxDecoration(
                  color: HexColor("#1E4FE7"),
                  borderRadius: BorderRadius.circular(width * .03)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Total Credit Balance",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "860,000 ETB",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Gap(width * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconContainer(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => const PayScreen(),
                        ),
                      );
                    },
                    icon: FluentSystemIcons.ic_fluent_badge_regular,
                    width: width,
                    title: "Pay",
                    color: Colors.green),
                IconContainer(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => const PayScreen(),
                      ),
                    );
                  },
                  icon: FluentSystemIcons.ic_fluent_add_regular,
                  width: width,
                  title: "Credit Score",
                  color: Colors.indigo,
                ),
              ],
            ),
            Gap(width * .1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconContainer(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => const PayScreen(),
                      ),
                    );
                  },
                  icon: FluentSystemIcons.ic_fluent_badge_regular,
                  width: width,
                  title: "Pay off",
                  color: Colors.red,
                ),
                IconContainer(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => const PayScreen(),
                      ),
                    );
                  },
                  icon: FluentSystemIcons.ic_fluent_history_regular,
                  width: width,
                  title: "All activity",
                  color: Colors.pink,
                ),
              ],
            ),
            Gap(width * .1),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent Transactions",
                style: TextStyle(
                  color: HexColor("#1E4FE7"),
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            Gap(width * .05),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SmallButton(
                    width: width,
                    title: "all",
                  ),
                  Gap(width * .04),
                  SmallButton(
                    width: width,
                    title: "Paid",
                    icon: FluentSystemIcons.ic_fluent_history_regular,
                  ),
                  Gap(width * .04),
                  SmallButton(
                    width: width,
                    title: "Pay off",
                    icon: FluentSystemIcons.ic_fluent_history_regular,
                  ),
                ],
              ),
            ),
            Gap(width * .05),
            Container(
              width: width * .4,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset("assets/icons/list.png"),
                  Gap(width * .02),
                  const Text(
                    "There are no transaction made currently",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black26,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
    required this.width,
    required this.title,
    this.icon,
  }) : super(key: key);

  final double width;
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: HexColor("#E0E0E0"),
        padding: EdgeInsets.symmetric(
          horizontal: width * .03,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * .04),
        ),
      ),
      child: Row(
        children: [
          icon != null
              ? Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.black26,
                    ),
                    Gap(width * .01),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                  ],
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black26,
                  ),
                )
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer({
    Key? key,
    required this.width,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width * .20,
          height: width * .20,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 2,
              primary: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: width * .05,
                vertical: width * .04,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * .2),
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 36,
            ),
          ),
        ),
        Gap(width * .02),
        Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ))
      ],
    );
  }
}
