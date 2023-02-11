import 'package:flutter/material.dart';

class Operator extends StatefulWidget {
  const Operator(this.name, this.logo, {super.key});

  final String logo;
  final String name;
  @override
  State<Operator> createState() => _OperatorState();
}

class _OperatorState extends State<Operator> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        border: Border.all(
          color: darkBlue,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: lightBlue,
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 6, left: 4, right: 4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  widget.logo,
                ),
                fit: BoxFit.contain,
                opacity: 0.3,
              ),
            ),
          ),
          // Image.asset(
          //   widget.logo,
          //   height: 36,
          //   fit: BoxFit.cover,
          // ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Text(
              textAlign: TextAlign.center,
              widget.name,
              style: TextStyle(
                color: darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}
