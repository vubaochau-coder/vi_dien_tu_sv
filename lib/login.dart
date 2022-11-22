import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/CreateAccount/create_acc.dart';
import 'package:vi_dien_tu_sv/ForgotPass/forgot_pass.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/my_textfiled_custom.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isUnshowPass = true;
  bool loadingLogIn = false;
  bool loadingOtherLogin = false;
  FocusNode textUserNameFocus = FocusNode();
  FocusNode textPassFocus = FocusNode();
  Color txtUserNameBackground = const Color.fromRGBO(238, 238, 238, 1);
  Color txtPassBackground = const Color.fromRGBO(238, 238, 238, 1);
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.height;
    double screenHeight = y -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: screenHeight * 0.3,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset('images/paypal_name_cropped.png'),
                ),
                SizedBox(
                  height: screenHeight * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.7 * 0.2,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: darkBlue,
                              ),
                            ),
                            Text(
                              'to Account',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.7 * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              "Enter your email",
                              const EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 18,
                                bottom: 18,
                              ),
                              Icons.person,
                              false,
                              usernameController,
                              TextInputType.emailAddress,
                            ),
                            CustomTextField(
                              "Password",
                              const EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 18,
                                bottom: 18,
                              ),
                              Icons.vpn_key,
                              true,
                              passwordController,
                              TextInputType.visiblePassword,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.7 * 0.05,
                      ),
                      SizedBox(
                        height: screenHeight * 0.7 * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                  setState(() {
                                    loadingLogIn = true;
                                  });
                                  Future.delayed(
                                    const Duration(seconds: 3),
                                    () {
                                      setState(() {
                                        loadingLogIn = false;
                                      });
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return const MainScreen();
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: loadingLogIn
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            width: 18,
                                            height: 18,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Logging in...',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const Text(
                                        'Log In',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: lightBlue,
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
                                  setState(() {
                                    loadingOtherLogin = true;
                                  });
                                  Future.delayed(
                                    const Duration(seconds: 3),
                                    () {
                                      setState(() {
                                        loadingOtherLogin = false;
                                      });
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return const MainScreen();
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: loadingOtherLogin
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            width: 18,
                                            height: 18,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Loading...',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const Text(
                                        'Use Phone Number',
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
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 10),
                        height: screenHeight * 0.7 * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: () {
                                  forgotPassButtonClick(context);
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: darkBlue,
                                ),
                                child: const Text(
                                  'Forgot Password?',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                              child: VerticalDivider(
                                color: lightBlue,
                                thickness: 2,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: () {
                                  createAccButtonClick(context);
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: lightBlue,
                                ),
                                child: const Text('Create Account'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void forgotPassButtonClick(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const ForgotPassword();
        },
      ),
    );
  }

  void createAccButtonClick(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const CreateAccount();
        },
      ),
    );
  }
}
