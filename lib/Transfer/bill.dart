import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:intl/intl.dart';
import 'package:vi_dien_tu_sv/ClassModel/other_user_model.dart';
import 'package:vi_dien_tu_sv/Transfer/contact_page.dart';
import 'package:vi_dien_tu_sv/main_screen.dart';

class BillPage extends StatefulWidget {
  final OtherUser user;
  final String money;
  const BillPage({super.key, required this.user, required this.money});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  bool showBalance = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: darkBlue,
                ),
                Positioned(
                  bottom: 0,
                  left: 12,
                  right: 12,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 26,
                        ),
                        Image.asset(
                          'images/check.png',
                          height: 68,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Giao dịch thành công!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 6),
                          child: Text(
                            'Số tiền của bạn đã được chuyển khoản thành công!',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 26,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                            right: 12,
                            bottom: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: double.infinity,
                              ),
                              const Text(
                                'Số tiền',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "-${NumberFormat.simpleCurrency().format(double.parse(widget.money)).split('.')[0].split('\$')[1]}đ",
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Trạng thái',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Thành công',
                                    style: TextStyle(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Thời gian',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('dd/MM/yyyy, hh:mm aa')
                                        .format(DateTime.now()),
                                    style: TextStyle(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Dash(
                                dashColor: Colors.grey,
                                dashLength: 8,
                                dashGap: 4,
                                length: 304,
                                dashThickness: 2,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'No. Ref',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '11876785922378',
                                    style: TextStyle(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Chiếu khấu',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Miễn phí',
                                    style: TextStyle(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nguồn tiền',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Ví SVPay',
                                    style: TextStyle(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Dash(
                                dashColor: Colors.grey,
                                dashLength: 8,
                                dashGap: 4,
                                length: 304,
                                dashThickness: 2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Số dư sau giao dịch',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    showBalance ? '1.453.000' : '******',
                                    style: TextStyle(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showBalance = !showBalance;
                                      });
                                    },
                                    icon: Icon(
                                      showBalance
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: darkBlue,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Người nhận',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    widget.user.name,
                                    style: TextStyle(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Số tài khoản',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    widget.user.bankID,
                                    style: TextStyle(
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 14, right: 14, bottom: 18, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 48,
                  width: 156,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const ContactPage();
                      }), (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: darkBlue,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'Giao dịch mới',
                      style: TextStyle(
                        color: darkBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 156,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const MainScreen();
                      }), (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Màn hình chính',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
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
}
