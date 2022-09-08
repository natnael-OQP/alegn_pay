import 'package:alegn_pay/screen/login/components/input_field.dart';
import 'package:alegn_pay/screen/login/screen/account_info.dart';
import 'package:alegn_pay/screen/login/screen/personal_info.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class WorkInfo extends StatefulWidget {
  const WorkInfo({super.key});

  @override
  State<WorkInfo> createState() => _WorkInfoState();
}

class _WorkInfoState extends State<WorkInfo> {
  List<String> numberOfMonths = [
    'Employed',
    'Self employed',
    'Employee',
  ];

  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            FluentSystemIcons.ic_fluent_ios_arrow_left_filled,
            color: Colors.black,
          ),
        ),
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
                "Please fill your Work and Legal information's",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * .15,
                  right: width * .15,
                  top: height * .035,
                  bottom: height * .01,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconContainer(
                          index: 1,
                          onTap: () => {},
                        ),
                        Expanded(
                          child: Container(
                            height: 3,
                            color: HexColor("#194BE7"),
                          ),
                        ),
                        IconContainer(
                          index: 2,
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const WorkInfo(),
                              ),
                            )
                          },
                        ),
                        Expanded(
                          child: Container(
                            height: 3,
                            color: Colors.black12,
                          ),
                        ),
                        IconContainer(
                          index: 3,
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AccountInfo(),
                              ),
                            )
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InputField(
                    height: height,
                    width: width,
                    label: 'Employment Status',
                    hint: 'Enter Employment Status',
                    suffixIcon: DropDownMenu(
                      hint: 'Employment Status',
                      menuList: numberOfMonths,
                      selectedItem: selectedStatus,
                      onChanged: (value) => setState(
                        () => selectedStatus = value.toString(),
                      ),
                    ),
                  ),
                  InputField(
                    height: height,
                    width: width,
                    label: 'Tin Number',
                    hint: 'Enter Tin Number',
                  ),
                  InputField(
                    height: height,
                    width: width,
                    label: 'id Number',
                    hint: 'Enter Tin Number',
                  ),
                ],
              ),
              Gap(height * .13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * .4,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PersonalInfo(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .05,
                          vertical: width * .04,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * .03),
                        ),
                        side: const BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      child: const Text(
                        "BACK",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * .4,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AccountInfo(),
                          ),
                        );
                      },
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final VoidCallback onTap;
  final int index;

  const IconContainer({
    Key? key,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: index == 1 ? HexColor("#194BE7") : Colors.black12,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          "$index",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    Key? key,
    required this.hint,
    required this.menuList,
    this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  final String hint;
  final List<String> menuList;
  final String? selectedItem;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: selectedItem,
        hint: Text(
          hint,
          style: TextStyle(
            color: Colors.grey.shade700,
            letterSpacing: 1,
          ),
        ),
        items: menuList.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                color: Colors.grey.shade700,
                letterSpacing: 1,
              ),
            ),
          );
        }).toList(),
        style: TextStyle(
          color: Colors.grey.shade700,
          letterSpacing: 1,
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        onChanged: onChanged,
        buttonHeight: 42,
        buttonWidth: double.maxFinite,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        itemHeight: 40,
      ),
    );
  }
}
