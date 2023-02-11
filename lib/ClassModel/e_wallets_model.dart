import 'package:flutter/cupertino.dart';

class EWalletsModel {
  final String name;
  final double money;
  final String dueDay;
  final String startDay;
  final double purpose;
  final IconData icon;

  EWalletsModel({
    required this.name,
    required this.money,
    required this.dueDay,
    required this.startDay,
    required this.purpose,
    required this.icon,
  });
}
