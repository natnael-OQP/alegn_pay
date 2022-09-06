import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
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
                "Please fill the input below here",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              InputField(
                height: height,
                width: width,
                label: 'Full Name',
                hint: 'Enter Your Full Name',
              ),
              InputField(
                height: height,
                width: width,
                label: 'Phone Number',
                hint: '0911290838',
              ),
              InputField(
                height: height,
                width: width,
                label: 'Email',
                hint: 'Something@gmail.com',
              ),
              InputField(
                height: height,
                width: width,
                label: 'Password',
                hint: '**********',
              ),
              Gap(height * .13),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * .7,
                  child: ElevatedButton(
                    onPressed: () {},
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
                      "NEXT",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: width * .03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    Gap(width * .02),
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#194BE7"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.height,
    required this.width,
    required this.label,
    required this.hint,
  }) : super(key: key);

  final double height;
  final double width;
  final String label, hint;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
