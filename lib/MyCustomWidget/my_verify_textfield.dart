import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyCodeTextField extends StatefulWidget {
  const VerifyCodeTextField(
      this.myFocus, this.nextFocus, this.textController, this.isLast,
      {super.key});

  final FocusNode myFocus;
  final FocusNode nextFocus;
  final TextEditingController textController;
  final bool isLast;
  @override
  State<VerifyCodeTextField> createState() => _VerifyCodeTextFieldState();
}

class _VerifyCodeTextFieldState extends State<VerifyCodeTextField> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);

  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);

  Color txtBackground = const Color.fromRGBO(238, 238, 238, 1);
  Color hasText = const Color.fromRGBO(227, 242, 253, 1);

  @override
  Widget build(BuildContext context) {
    widget.myFocus.addListener(
      () {
        if (widget.myFocus.hasFocus) {
          setState(() {
            txtBackground = Colors.white;
          });
        } else {
          setState(() {
            txtBackground = const Color.fromRGBO(238, 238, 238, 1);
          });
        }
      },
    );
    return SizedBox(
      height: 64,
      width: 64,
      child: TextField(
        controller: widget.textController,
        focusNode: widget.myFocus,
        onChanged: (value) {
          if (!widget.isLast) {
            if (value.length == 1) {
              FocusScope.of(context).requestFocus(widget.nextFocus);
            }
          }
        },
        style: TextStyle(
          color: lightBlue,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: darkBlue,
              width: 2,
            ),
          ),
          fillColor:
              widget.textController.text.isEmpty ? txtBackground : hasText,
          filled: true,
        ),
      ),
    );
  }
}
