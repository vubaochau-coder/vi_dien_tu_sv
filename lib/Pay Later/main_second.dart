import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/Pay%20Later/first_register.dart';
import 'package:vi_dien_tu_sv/Pay%20Later/second_get_start_page.dart';
import 'package:vi_dien_tu_sv/Pay%20Later/third_get_start_page.dart';

class MainSecondPage extends StatefulWidget {
  const MainSecondPage({super.key});

  @override
  State<MainSecondPage> createState() => _MainSecondPageState();
}

class _MainSecondPageState extends State<MainSecondPage> {
  final controller = PageController(initialPage: 0);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              SecondGetStartPage(),
              ThirdGetStartPage(),
            ],
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                DotsIndicator(
                  dotsCount: 2,
                  axis: Axis.horizontal,
                  position: currentPage.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(27, 9),
                    spacing: const EdgeInsets.all(4),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  height: 48,
                  width: 360,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: lightBlue,
                          width: 2,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (currentPage == 0) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const FirstRegisterPayLater();
                            },
                          ),
                        );
                      }
                    },
                    child: Text(
                      currentPage == 0 ? 'Tiếp tục' : 'Khám phá ngay',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: lightBlue,
                        fontSize: 18,
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
