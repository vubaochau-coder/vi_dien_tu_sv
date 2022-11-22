import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  const CustomTextField(this.hint, this.padding, this.prefix, this.isPassTxt,
      this.controller, this.inputType,
      {super.key});

  final String hint;
  final EdgeInsets padding;
  final IconData prefix;
  final bool isPassTxt;
  final TextEditingController controller;
  final TextInputType inputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);

  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);

  Color txtBackground = const Color.fromRGBO(238, 238, 238, 1);

  bool isUnShowPass = true;

  FocusNode focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    focus.addListener(() {
      if (focus.hasFocus) {
        setState(() {
          txtBackground = Colors.white;
        });
      } else {
        setState(() {
          txtBackground = const Color.fromRGBO(238, 238, 238, 1);
        });
      }
    });
    return TextField(
      obscureText: widget.isPassTxt ? isUnShowPass : false,
      keyboardType: widget.inputType,
      enableSuggestions: widget.isPassTxt ? false : true,
      autocorrect: widget.isPassTxt ? false : true,
      cursorColor: darkBlue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
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
        hintText: widget.hint,
        contentPadding: widget.padding,
        prefixIconColor: darkBlue,
        prefixIcon: Icon(
          widget.prefix,
          color: focus.hasFocus ? darkBlue : Theme.of(context).disabledColor,
        ),
        suffixIcon: widget.isPassTxt
            ? IconButton(
                icon: Icon(
                  isUnShowPass ? Icons.visibility_off : Icons.visibility,
                  color: focus.hasFocus
                      ? darkBlue
                      : Theme.of(context).disabledColor,
                ),
                onPressed: () {
                  setState(() {
                    isUnShowPass = !isUnShowPass;
                  });
                },
              )
            : null,
        fillColor: txtBackground,
        filled: true,
      ),
      focusNode: focus,
      onChanged: (value) {
        setState(() {
          widget.controller.text = value;
        });
      },
    );
  }

  bool isFocus() {
    if (focus.hasFocus) {
      return true;
    } else {
      return false;
    }
  }
}
