import 'package:flutter/material.dart';

class IndexIndicator extends StatelessWidget {
  const IndexIndicator({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(bgColor: index == 0),
        Indicator(bgColor: index == 1),
        Indicator(bgColor: index == 2),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.bgColor,
  }) : super(key: key);

  final bool bgColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      child: Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.all(width * .015),
        decoration: BoxDecoration(
          color: bgColor ? Colors.blue : Colors.black,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
