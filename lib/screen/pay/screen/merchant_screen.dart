import 'package:alegn_pay/navigation/navigation.dart';
import 'package:alegn_pay/screen/login/components/input_field.dart';
import 'package:alegn_pay/screen/login/screen/drop_down_menu.dart';
import 'package:alegn_pay/screen/pay/screen/paid_successfully.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({super.key});

  @override
  State<MerchantScreen> createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  List<String> numberOfMonths = [
    '3 month, 5000/month',
    '4 month, 5000/month',
    '6 month, 5000/month',
    '8 month, 5000/month',
    '12 month, 5000/month',
  ];

  String? selectedMonth;
  var getResult = 'Unknown';

  void scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        getResult = qrCode;
      });

      Get.to(() => const PaidSuccessfully());
    } on PlatformException {
      getResult = "Failed to scan QR code.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.to(() => const Navigation());
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
        color: HexColor("#eeeeee"),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * .05, vertical: width * .06),
          child: Column(
            children: [
              InputField(
                height: height,
                width: width,
                label: 'Merchant Name',
                hint: 'Merchant Name',
              ),
              InputField(
                height: height,
                width: width,
                label: 'Merchant Id',
                hint: 'Merchant Id',
              ),
              InputField(
                height: height,
                width: width,
                label: 'Total Price',
                hint: 'Total Price',
              ),
              InputField(
                height: height,
                width: width,
                label: 'Payment Duration',
                hint: 'Payment Duration',
                suffixIcon: DropDownMenu(
                  hint: 'Payment Duration',
                  menuList: numberOfMonths,
                  selectedItem: selectedMonth,
                  onChanged: (value) => setState(
                    () => selectedMonth = value.toString(),
                  ),
                ),
              ),
              Gap(height * .1),
              const Text(
                "or scan QR Code",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Image.asset("assets/icons/QRcode.png"),
              Gap(height * .04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * .4,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
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
                        scanQR();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#2CA66C"),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .05,
                          vertical: width * .04,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * .03),
                        ),
                      ),
                      child: const Text(
                        "PAY",
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
