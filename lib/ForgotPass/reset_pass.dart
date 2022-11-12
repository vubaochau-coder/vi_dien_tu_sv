import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);

  FocusNode passFocus = FocusNode();
  Color passBackground = const Color.fromRGBO(238, 238, 238, 1);
  FocusNode confirmFocus = FocusNode();
  Color confirmBackground = const Color.fromRGBO(238, 238, 238, 1);

  bool isUnshowPass = true;
  bool isUnshowConfirm = true;

  @override
  Widget build(BuildContext context) {
    passFocus.addListener(
      () {
        if (passFocus.hasFocus) {
          setState(() {
            passBackground = Colors.white;
          });
        } else {
          setState(() {
            passBackground = const Color.fromRGBO(238, 238, 238, 1);
          });
        }
      },
    );
    confirmFocus.addListener(
      () {
        if (confirmFocus.hasFocus) {
          setState(() {
            confirmBackground = Colors.white;
          });
        } else {
          setState(() {
            confirmBackground = const Color.fromRGBO(238, 238, 238, 1);
          });
        }
      },
    );
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
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.vpn_key),
                    prefixIconColor: lightBlue,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: lightBlue,
                        width: 2,
                      ),
                    ),
                    fillColor: passBackground,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(isUnshowPass
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isUnshowPass = !isUnshowPass;
                        });
                      },
                    ),
                    suffixIconColor: lightBlue,
                  ),
                  focusNode: passFocus,
                  obscureText: isUnshowPass,
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
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.lock_reset),
                    prefixIconColor: lightBlue,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: lightBlue,
                        width: 2,
                      ),
                    ),
                    fillColor: confirmBackground,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(isUnshowConfirm
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isUnshowConfirm = !isUnshowConfirm;
                        });
                      },
                    ),
                    suffixIconColor: lightBlue,
                  ),
                  focusNode: confirmFocus,
                  obscureText: isUnshowConfirm,
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
