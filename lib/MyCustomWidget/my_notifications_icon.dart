import 'package:flutter/material.dart';

class CustomNotifications extends StatefulWidget {
  const CustomNotifications({super.key});

  @override
  State<CustomNotifications> createState() => _CustomNotificationsState();
}

class _CustomNotificationsState extends State<CustomNotifications> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.notifications),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 0, 41, 135),
                )),
            constraints: const BoxConstraints(
              minWidth: 11,
              minHeight: 11,
            ),
          ),
        )
      ],
    );
  }
}
