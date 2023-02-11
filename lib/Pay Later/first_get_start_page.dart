import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/Pay%20Later/main_second.dart';

class FirstGetStartPage extends StatelessWidget {
  const FirstGetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 180, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('images/svpay_logo.png'),
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 38,
            ),
            const Text(
              "Chào mừng bạn đến với tính năng dùng trước trả sau của SVPay",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Tính năng dùng trước - trả sau của SVPay là một tính năng vô cùng mới và tiện lợi, bạn sẽ không ngờ đến khả năng của nó.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Hãy cùng nhau tìm hiểu thêm về\ntính năng này nào!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const MainSecondPage();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Bắt đầu thôi nào",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
