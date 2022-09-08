import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Form(
      child: TextFormField(
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.black38,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          labelStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: HexColor("#eeeeee"),
          hintText: "Search",
          contentPadding: EdgeInsets.symmetric(
              vertical: width * .02, horizontal: width * .025),
          border: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(1),
            child: Icon(
              FluentSystemIcons.ic_fluent_search_regular,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

var outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide.none,
);
