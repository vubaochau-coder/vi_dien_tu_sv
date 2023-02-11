import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vi_dien_tu_sv/ClassModel/e_wallets_model.dart';
import 'package:vi_dien_tu_sv/EWallet/dialog.dart';

class EWalletDetail extends StatefulWidget {
  final EWalletsModel data;
  const EWalletDetail({super.key, required this.data});

  @override
  State<EWalletDetail> createState() => _EWalletDetailState();
}

class _EWalletDetailState extends State<EWalletDetail> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  final DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 288,
                alignment: Alignment.topCenter,
                child: Container(
                  height: 198,
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
                    "Chi tiết ví",
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
                        left: 26, right: 26, top: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text(
                            'Ngày tạo ví: ${widget.data.startDay}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    lightBlue,
                                    darkBlue,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Icon(
                                widget.data.icon,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.data.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  NumberFormat.simpleCurrency()
                                      .format(widget.data.money)
                                      .split('.')[0]
                                      .split('\$')[1],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  NumberFormat.simpleCurrency()
                                      .format(widget.data.money *
                                              widget.data.purpose /
                                              100 +
                                          widget.data.money)
                                      .split('.')[0]
                                      .split('\$')[1],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "+${widget.data.purpose}%/ngày",
                                  style: TextStyle(
                                    color: lightBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Tiến trình',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "${(daysBetween(convertStringToDate(widget.data.dueDay), DateTime.now()) / daysBetween(convertStringToDate(widget.data.dueDay), convertStringToDate(widget.data.startDay)) * 100).toStringAsFixed(2)}%",
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.grey[300],
                          ),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey[300],
                            color: darkBlue,
                            value: daysBetween(
                                    convertStringToDate(widget.data.dueDay),
                                    DateTime.now()) /
                                daysBetween(
                                    convertStringToDate(widget.data.dueDay),
                                    convertStringToDate(widget.data.startDay)),
                            minHeight: 6,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Biến động số dư',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '7 ngày gần nhất',
                  style: TextStyle(
                    color: darkBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return buildItem(index);
              },
              itemCount: 7,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 6),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: darkBlue,
                    ),
                    child: const Text(
                      'Nạp tiền',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const RutTienDialog();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: darkBlue,
                            width: 2,
                          )),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Rút tiền',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(int index) {
    final date = DateTime(now.year, now.month, now.day - 1 - index);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 6, right: 8, left: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('dd/MM/yyyy').format(date),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Lãi suất',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              '+${(widget.data.money * widget.data.purpose / 100).toStringAsFixed(0)}đ',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime convertStringToDate(String dateString) {
    return DateFormat("dd/MM/yyyy").parse(dateString);
  }

  int daysBetween(DateTime end, DateTime now) {
    return end.difference(now).inDays;
  }

  double laiSuat(DateTime start, DateTime now, double lai, double tienBanDau) {
    int day = daysBetween(now, start);
    double heso = 1 + lai / 100;
    for (int i = 0; i < day; i++) {
      heso *= heso;
    }
    double nowMoney = tienBanDau * heso;
    double beforeMoney = tienBanDau * heso / (1 + lai / 100);
    return nowMoney - beforeMoney;
  }
}
