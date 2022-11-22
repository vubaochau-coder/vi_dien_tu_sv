import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/ForgotPass/reset_pass.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/my_verify_textfield.dart';

class ForgotPass2 extends StatefulWidget {
  const ForgotPass2({super.key});

  @override
  State<ForgotPass2> createState() => _ForgotPass2State();
}

class _ForgotPass2State extends State<ForgotPass2> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);

  FocusNode inputFocus = FocusNode();
  Color inputBackground = const Color.fromRGBO(238, 238, 238, 1);

  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();

  FocusNode focus1 = FocusNode();
  FocusNode focus2 = FocusNode();
  FocusNode focus3 = FocusNode();
  FocusNode focus4 = FocusNode();

  static const int maxSeconds = 300;
  int mySeconds = maxSeconds;

  void startTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mySeconds > 0) {
        if (mounted) {
          setState(() {
            mySeconds--;
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          '2/3',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey,
          ),
          onPressed: (() {
            Navigator.of(context).pop();
          }),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 22,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: darkBlue,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your email',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: darkBlue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter the 4 digits code that you received\non your email.',
                    style: TextStyle(
                      height: 1.4,
                      color: lightBlue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter verification code',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VerifyCodeTextField(focus1, focus2, text1, false),
                    VerifyCodeTextField(focus2, focus3, text2, false),
                    VerifyCodeTextField(focus3, focus4, text3, false),
                    VerifyCodeTextField(focus4, focus1, text4, true),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('The code will be refreshed after ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          )),
                      Text(
                        "0${mySeconds ~/ 60}:${(mySeconds % 60).toString().padLeft(2, '0')}",
                        style: TextStyle(
                          color: lightBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Didn\'t get code?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          )),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'RESEND CODE',
                          style: TextStyle(color: lightBlue),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: darkBlue,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      minimumSize: const Size(double.infinity, 52),
                    ),
                    onPressed: () {
                      verifyButtonClick();
                    },
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyButtonClick() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const ResetPassword();
        },
      ),
    );
  }
}
