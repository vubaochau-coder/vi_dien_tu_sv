import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/ClassModel/e_wallets_model.dart';
import 'package:vi_dien_tu_sv/EWallet/ewallet_detail.dart';
import 'package:vi_dien_tu_sv/EWallet/ewallet_page.dart';
import 'package:vi_dien_tu_sv/Pay%20Later/first_get_start_page.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/e_wallets_goal.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/my_carousel_slider_dots.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/my_notifications_icon.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/my_operation.dart';
import 'package:vi_dien_tu_sv/Transfer/contact_page.dart';
import 'package:vi_dien_tu_sv/nofifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  bool isUnShowBalance = true;
  String hideBalance = "*****";
  String realBalance = "123,456,789";
  String name = 'VU BAO CHAU';

  late final TabController controller;
  int indexAd = 0;

  List<Widget> widgets = const [
    Icon(Icons.laptop),
    Icon(Icons.phone_android),
    Icon(Icons.headphones),
    Icon(Icons.keyboard),
    Icon(Icons.mouse),
    Icon(Icons.memory)
  ];

  List<EWalletsModel> walletGoals = [
    EWalletsModel(
      name: 'Mua nhà',
      dueDay: '30/01/2023',
      startDay: '01/01/2023',
      icon: Icons.home_rounded,
      money: 30000000,
      purpose: 0.36,
    ),
    EWalletsModel(
      name: 'Mua xe',
      dueDay: '30/05/2023',
      startDay: '01/01/2023',
      icon: Icons.directions_car,
      money: 30000000,
      purpose: 0.36,
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: widgets.length,
      initialIndex: indexAd,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const NotificationsScreen();
                  },
                ),
              );
            },
            icon: const CustomNotifications(),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 14,
                right: 14,
                top: kToolbarHeight + MediaQuery.of(context).padding.top,
              ),
              height: 170 + kToolbarHeight + MediaQuery.of(context).padding.top,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                //color: darkBlue,
                gradient: LinearGradient(
                  colors: [
                    darkBlue,
                    lightBlue,
                    darkBlue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chào buổi sáng,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Số dư khả dụng',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isUnShowBalance = !isUnShowBalance;
                                  });
                                },
                                icon: Icon(
                                  isUnShowBalance
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              Text(
                                isUnShowBalance ? hideBalance : realBalance,
                                style: const TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 100,
                        height: 44,
                        margin: const EdgeInsets.only(right: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue.shade900,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900,
                            shadowColor: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'THÊM',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                    ),
                    child: Text(
                      'Tính năng chính',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 120),
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const ContactPage();
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: const Operator(
                          'Chuyển Tiền',
                          'images/transfer.png',
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: const Operator(
                          'Hóa Đơn',
                          'images/invoice.png',
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: const Operator(
                          'Ngân Hàng',
                          'images/bank.png',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 120),
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const FirstGetStartPage();
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: const Operator(
                          'Ứng Tiền',
                          'images/loan.png',
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 120),
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const EWalletPage();
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: const Operator(
                          'Siêu Ví',
                          'images/wallet.png',
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: const Operator(
                          'QR Code',
                          'images/qrcode.png',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                    ),
                    child: Text(
                      'Nhận thưởng Siêu Ví',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 86,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return buildEWallItem(walletGoals[index]);
                            },
                            itemCount: walletGoals.length,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const EWalletPage();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Xem ngay",
                                  style: TextStyle(
                                    color: darkBlue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_right_rounded,
                                  color: darkBlue,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                    ),
                    child: Text(
                      'Quảng cáo & Sự kiện',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: darkBlue,
                        width: 1,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width - 40,
                    child: CustomCarouselSlider(widgets),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEWallItem(EWalletsModel data) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        splashColor: lightBlue,
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Future.delayed(
            const Duration(milliseconds: 150),
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return EWalletDetail(
                      data: data,
                    );
                  },
                ),
              );
            },
          );
        },
        child: EWalletsGoalItem(data: data),
      ),
    );
  }
}
