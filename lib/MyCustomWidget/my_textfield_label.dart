import 'package:flutter/material.dart';

class LabelTextField extends StatefulWidget {
  const LabelTextField(this.label, this.inputType, this.controller,
      {super.key});

  final String label;
  final TextInputType inputType;
  final TextEditingController controller;
  @override
  State<LabelTextField> createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<LabelTextField> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);

  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);

  Color txtBackground = const Color.fromRGBO(238, 238, 238, 1);

  FocusNode focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    focus.addListener(
      () {
        if (focus.hasFocus) {
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

    return TextField(
      keyboardType: widget.inputType,
      cursorColor: darkBlue,
      decoration: InputDecoration(
        label: Text(
          widget.label,
        ),
        labelStyle: TextStyle(
          color: focus.hasFocus ? darkBlue : Theme.of(context).disabledColor,
          fontSize: focus.hasFocus ? 18 : 15,
          fontWeight: focus.hasFocus ? FontWeight.bold : FontWeight.normal,
        ),
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
        contentPadding: const EdgeInsets.only(left: 12),
        prefixIconColor: darkBlue,
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
}
