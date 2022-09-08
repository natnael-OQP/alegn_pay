import 'package:alegn_pay/screen/home/home_screen.dart';
import 'package:alegn_pay/screen/pay/pay_screen.dart';
import 'package:alegn_pay/screen/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List Screens = [
    const HomeScreen(),
    const Center(
      child: Text("history"),
    ),
    const PayScreen(),
    const Center(
      child: Text("repay"),
    ),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(
          color: Colors.blue,
        ),
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FluentSystemIcons.ic_fluent_home_regular,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentSystemIcons.ic_fluent_history_regular,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentSystemIcons.ic_fluent_add_circle_filled,
              color: Colors.blueAccent,
            ),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentSystemIcons.ic_fluent_currency_regular,
            ),
            label: 'repay',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentSystemIcons.ic_fluent_settings_regular,
            ),
            label: 'setting',
          ),
        ],
      ),
      body: Screens[_selectedIndex],
    );
  }
}
