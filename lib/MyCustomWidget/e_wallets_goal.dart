import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/ClassModel/e_wallets_model.dart';

class EWalletsGoalItem extends StatelessWidget {
  final EWalletsModel data;
  const EWalletsGoalItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
    Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                lightBlue,
                darkBlue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            data.icon,
            size: 40,
            color: Colors.white,
          ),
        ),
        Text(
          data.name,
          style: TextStyle(
            color: darkBlue,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
