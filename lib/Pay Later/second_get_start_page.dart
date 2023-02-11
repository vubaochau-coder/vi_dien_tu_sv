import 'package:flutter/material.dart';

class SecondGetStartPage extends StatelessWidget {
  const SecondGetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
    Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('images/pig_blue.png'),
            height: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mở ',
                style: TextStyle(
                  color: darkBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              Text(
                'Ví trả sau',
                style: TextStyle(
                  color: darkBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "Dùng trước, trả sau miễn phí",
            style: TextStyle(
              color: lightBlue,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 54,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.credit_card_off_outlined,
                      color: darkBlue,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Không chứng minh thu nhập',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.percent,
                      color: darkBlue,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Không tính lãi ',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'đến 30 ngày',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mobile_friendly_outlined,
                      color: darkBlue,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Miễn phí ',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'dịch vụ 3 giao dịch đầu tiên',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.gpp_good_sharp,
                      color: darkBlue,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Khóa ví bất cứ lúc nào',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
