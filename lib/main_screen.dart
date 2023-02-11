import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/Voucher/voucher_page.dart';

import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  bool isUnShowBalance = true;
  String hideBalance = "*****";
  String realBalance = "123,456.00";
  int bottomNavIndex = 1;
  final screens = const [
    VoucherScreen(),
    HomePage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        showUnselectedLabels: true,
        selectedItemColor: darkBlue,
        // selectedLabelStyle: const TextStyle(
        //   color: Colors.white,
        // ),
        unselectedItemColor: lightBlue,
        currentIndex: bottomNavIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.discount_outlined),
            label: 'Voucher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistical',
          ),
        ],
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
          });
        },
      ),
    );
  }
}
