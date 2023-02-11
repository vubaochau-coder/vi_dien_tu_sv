import 'package:flutter/material.dart';

class ThirdGetStartPage extends StatelessWidget {
  const ThirdGetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
    Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
    double iconSize = 30;
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Chấp nhận thanh toán các chi phí sinh viên cũng như dịch vụ thanh toán tại hơn 100.000 cửa hàng, chuỗi bán lẻ trên toàn quốc.',
            style: TextStyle(
              color: darkBlue,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Sau khi mở ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: 'Ví Trả Sau',
                  style: TextStyle(
                    color: lightBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const TextSpan(
                  text:
                      ' thành công, bạn có thể sử dụng ví để thanh toán dịch vụ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.facebook,
                color: const Color(0xFF3b5998),
                size: iconSize,
              ),
              Icon(
                Icons.tiktok_outlined,
                color: Colors.black,
                size: iconSize,
              ),
              Icon(
                Icons.discord,
                color: const Color(0xFF5865F2),
                size: iconSize,
              ),
              Icon(
                Icons.telegram,
                color: const Color(0xff0088cc),
                size: iconSize,
              ),
              Icon(
                Icons.adobe,
                color: const Color(0xffED2224),
                size: iconSize,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'và rất nhiều dịch vụ khác.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
