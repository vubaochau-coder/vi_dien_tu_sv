import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/my_textfield_label.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/my_textfiled_custom.dart';

import '../MyCustomWidget/my_verify_textfield.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  int currentSteps = 0;
  Color inputBackground = const Color.fromRGBO(238, 238, 238, 1);
  bool isUnShowPass = true;
  bool isCheckBoxChecked = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  TextEditingController countryController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();

  FocusNode focus1 = FocusNode();
  FocusNode focus2 = FocusNode();
  FocusNode focus3 = FocusNode();
  FocusNode focus4 = FocusNode();

  String email = "";
  FocusNode focus = FocusNode();

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
  Widget build(BuildContext context) {
    focus.addListener(
      () {
        if (focus.hasFocus) {
          setState(() {
            inputBackground = Colors.white;
          });
        } else {
          setState(() {
            inputBackground = const Color.fromRGBO(238, 238, 238, 1);
          });
        }
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: IconButton.styleFrom(),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: darkBlue,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Stepper(
            margin: EdgeInsets.zero,
            elevation: 0,
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentSteps,
            onStepContinue: () {
              if (currentSteps < getSteps().length - 1) {
                setState(() {
                  currentSteps += 1;
                });
              }
            },
            onStepCancel: () {
              if (currentSteps > 0) {
                setState(() {
                  currentSteps -= 1;
                });
              }
            },
            onStepTapped: (value) {
              setState(() {
                currentSteps = value;
              });
            },
            controlsBuilder: (context, details) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                child: currentSteps < getSteps().length - 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (currentSteps == 0) {
                                startTime();
                              }
                              if (currentSteps < getSteps().length - 1) {
                                setState(() {
                                  currentSteps += 1;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkBlue,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Next'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: details.onStepCancel,
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: currentSteps == 0
                                  ? Colors.white10
                                  : lightBlue,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Cancel'),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkBlue,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Done'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: details.onStepCancel,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightBlue,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentSteps >= 0,
          content: page1(),
          title: const Text(''),
          label: currentSteps == 0 ? const Text('Account') : null,
          state: currentSteps >= 1
              ? StepState.complete
              : (currentSteps == 0 ? StepState.editing : StepState.indexed),
        ),
        Step(
          isActive: currentSteps >= 1,
          content: page2(),
          title: const Text(''),
          label: currentSteps == 1 ? const Text('Verification') : null,
          state: currentSteps >= 2
              ? StepState.complete
              : (currentSteps == 1 ? StepState.editing : StepState.indexed),
        ),
        Step(
          isActive: currentSteps >= 2,
          content: page3(),
          title: const Text(''),
          label: currentSteps == 2 ? const Text('Infomation') : null,
          state: currentSteps >= 3
              ? StepState.complete
              : (currentSteps == 2 ? StepState.editing : StepState.indexed),
        ),
      ];

  Widget page1() {
    return SizedBox(
      height: 390,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter your email',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            "",
            EdgeInsets.zero,
            Icons.email,
            false,
            emailController,
            TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter your password',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            "",
            EdgeInsets.zero,
            Icons.lock,
            true,
            passController,
            TextInputType.visiblePassword,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Confirm your password',
              style: TextStyle(
                color: darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            "",
            EdgeInsets.zero,
            Icons.lock_reset,
            true,
            confirmController,
            TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }

  Widget page2() {
    return SizedBox(
      height: 390,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'We emailed you a 4 digits verification code to',
              style: TextStyle(
                height: 1.4,
                color: lightBlue,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              emailController.text.toString(),
              style: TextStyle(
                height: 1.4,
                color: darkBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Enter the code to comfirm your email address.',
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
              VerifyCodeTextField(focus4, FocusNode(), text4, true),
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
        ],
      ),
    );
  }

  Widget page3() {
    return SizedBox(
      height: 390,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            LabelTextField(
              'Your full name',
              TextInputType.name,
              fullnameController,
            ),
            const SizedBox(
              height: 12,
            ),
            LabelTextField(
              'Phone number',
              TextInputType.phone,
              phoneController,
            ),
            const SizedBox(
              height: 12,
            ),
            LabelTextField(
              'Address',
              TextInputType.text,
              countryController,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              cursorColor: darkBlue,
              readOnly: true,
              focusNode: focus,
              decoration: InputDecoration(
                hintText: 'Date of birth',
                hintStyle: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
                contentPadding: const EdgeInsets.only(left: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.calendar_month,
                    color: focus.hasFocus
                        ? darkBlue
                        : Theme.of(context).disabledColor,
                  ),
                  onPressed: () {},
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: darkBlue,
                    width: 2,
                  ),
                ),
                fillColor: inputBackground,
                filled: true,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  shape: const CircleBorder(),
                  value: isCheckBoxChecked,
                  onChanged: (value) {
                    setState(() {
                      isCheckBoxChecked = value!;
                    });
                  },
                ),
                const Text(
                  'I agree with',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Terms & Conditions',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
