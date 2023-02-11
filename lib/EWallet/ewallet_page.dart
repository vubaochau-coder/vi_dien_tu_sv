import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vi_dien_tu_sv/ClassModel/e_wallets_model.dart';
import 'package:vi_dien_tu_sv/EWallet/create_ewallet.dart';
import 'package:vi_dien_tu_sv/EWallet/ewallet_detail.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/e_wallets_item.dart';

class EWalletPage extends StatefulWidget {
  const EWalletPage({super.key});

  @override
  State<EWalletPage> createState() => _EWalletPageState();
}

class _EWalletPageState extends State<EWalletPage> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  List<EWalletsModel> walletGoals = [
    EWalletsModel(
      name: 'Mua nhà',
      dueDay: '30/06/2023',
      startDay: '01/01/2023',
      icon: Icons.home_rounded,
      money: 9678000,
      purpose: 0.36,
    ),
    EWalletsModel(
      name: 'Mua xe',
      dueDay: '22/04/2023',
      startDay: '12/12/2022',
      icon: Icons.directions_car,
      money: 560000,
      purpose: 0.31,
    ),
    EWalletsModel(
      name: 'Đám cưới',
      dueDay: '10/10/2022',
      startDay: '17/02/2023',
      icon: Icons.style,
      money: 450000,
      purpose: 0.12,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 258,
                alignment: Alignment.topCenter,
                child: Container(
                  height: 178,
                  padding: const EdgeInsets.only(
                    bottom: 18,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: darkBlue,
                    gradient: LinearGradient(
                      colors: [
                        darkBlue,
                        lightBlue,
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Siêu Ví",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 16),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 26, right: 26, top: 22, bottom: 22),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wallet,
                              color: Colors.grey[700],
                            ),
                            Text(
                              'Tổng giá trị trong ví',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(
                              width: 98,
                            ),
                            const Text(
                              'VNĐ',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              NumberFormat.simpleCurrency()
                                  .format(getTotal(walletGoals))
                                  .split('.')[0],
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: darkBlue,
                              ),
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 6, bottom: 6),
                              child: const Text(
                                '+3.14%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Danh sách các ví',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const CreateEWalletPage();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shadowColor: lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: darkBlue,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Thêm ví',
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return buildEWalletItem(walletGoals[index], context);
              },
              itemCount: walletGoals.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEWalletItem(EWalletsModel data, BuildContext context) {
    return InkWell(
      splashColor: Colors.blue[100],
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Future.delayed(
          const Duration(milliseconds: 120),
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
      child: EWalletItem(data: data),
    );
  }

  double getTotal(List<EWalletsModel> data) {
    double a = 0;
    for (var item in data) {
      a += item.money;
    }
    return a;
  }
}
