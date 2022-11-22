import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/my_textfiled_custom.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);

  Color passBackground = const Color.fromRGBO(238, 238, 238, 1);

  Color confirmBackground = const Color.fromRGBO(238, 238, 238, 1);

  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          '3/3',
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
                    'Reset',
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
                    'Password',
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
                    'Set the new password for your account\nSo you login and access all the features.',
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
                    'Enter new password',
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
                CustomTextField(
                  "",
                  const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 18,
                    bottom: 18,
                  ),
                  Icons.vpn_key,
                  true,
                  passController,
                  TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm new password',
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
                CustomTextField(
                  "",
                  const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 18,
                    bottom: 18,
                  ),
                  Icons.lock_reset,
                  true,
                  confirmController,
                  TextInputType.text,
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
                      doneButtonClick();
                    },
                    child: const Text(
                      'Done',
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

  void doneButtonClick() {}
}
