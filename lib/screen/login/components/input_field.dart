import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.height,
    required this.width,
    required this.hint,
    this.label,
  }) : super(key: key);

  final double height;
  final double width;
  final String? label;
  final String hint;

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
