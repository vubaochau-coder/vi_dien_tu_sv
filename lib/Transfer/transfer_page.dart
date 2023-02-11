import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vi_dien_tu_sv/ClassModel/other_user_model.dart';
import 'package:vi_dien_tu_sv/Transfer/bill.dart';

class TransferPage extends StatefulWidget {
  final OtherUser user;
  const TransferPage({super.key, required this.user});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  String money = '0';
  bool isDouble = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Transfer',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: darkBlue,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 22,
            left: 11,
            right: 11,
            child: Container(
              height: MediaQuery.of(context).size.height - 120,
              width: MediaQuery.of(context).size.width - 22,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 58,
                        width: 58,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(widget.user.image),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Bank - ${widget.user.bankID}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    NumberFormat.simpleCurrency()
                        .format(double.parse(money))
                        .split('.')[0],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 46,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            splashColor: lightBlue,
                            onPressed: () {
                              addNumber('1');
                            },
                            icon: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addNumber('2');
                            },
                            icon: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addNumber('3');
                            },
                            icon: Text(
                              '3',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              addNumber('4');
                            },
                            icon: Text(
                              '4',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addNumber('5');
                            },
                            icon: Text(
                              '5',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addNumber('6');
                            },
                            icon: Text(
                              '6',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              addNumber('7');
                            },
                            icon: Text(
                              '7',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addNumber('8');
                            },
                            icon: Text(
                              '8',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addNumber('9');
                            },
                            icon: Text(
                              '9',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (isDouble == false) {
                                addNumber('.');
                                isDouble = true;
                              }
                            },
                            icon: Text(
                              '.',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addNumber('0');
                            },
                            icon: Text(
                              '0',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              removeNumber();
                            },
                            icon: Icon(
                              Icons.backspace,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 300,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return BillPage(user: widget.user, money: money);
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Tiếp tục',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addNumber(String data) {
    setState(() {
      if (money[0] == '0' && money.length == 1) {
        money = data;
      } else {
        money += data;
      }
    });
  }

  void removeNumber() {
    setState(() {
      if (money.isNotEmpty) {
        money = money.substring(0, money.length - 1);
      }
      if (money.isEmpty) {
        money = '0';
      }
    });
  }
}
