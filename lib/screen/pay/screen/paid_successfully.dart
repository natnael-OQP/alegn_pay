import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaidSuccessfully extends StatelessWidget {
  const PaidSuccessfully({super.key});

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
              "Merchant",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              "Please fill the necessary information's",
              style: TextStyle(
                fontSize: 8,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.all(width * .01),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                    border: Border(
                      top: BorderSide(
                        width: width * .01,
                        color: Colors.white,
                      ),
                      left: BorderSide(
                        width: width * .01,
                        color: Colors.white,
                      ),
                      right: BorderSide(
                        width: width * .01,
                        color: Colors.white,
                      ),
                      bottom: BorderSide(
                        width: width * .01,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Image.asset(
                    "assets/images/Right.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(width * .05),
              const Text(
                "Paid Successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Enjoy your purchase",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
