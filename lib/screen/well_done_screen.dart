import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class WellDoneScreen extends StatelessWidget {
  const WellDoneScreen({super.key});

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
        backgroundColor: Colors.transparent,
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
                          color: HexColor("#194BE7"),
                        ),
                        left: BorderSide(
                          width: width * .01,
                          color: HexColor("#194BE7"),
                        ),
                        right: BorderSide(
                          width: width * .01,
                          color: HexColor("#194BE7"),
                        ),
                        bottom: BorderSide(
                          width: width * .01,
                          color: HexColor("#194BE7"),
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
                  "Well Done!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
