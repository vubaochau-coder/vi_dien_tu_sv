import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vi_dien_tu_sv/ClassModel/e_wallets_model.dart';
import 'package:vi_dien_tu_sv/Custom%20Widget/radial_progress.dart';

class EWalletItem extends StatelessWidget {
  final EWalletsModel data;
  const EWalletItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
    Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 12, top: 8, bottom: 8),
        child: Row(
          children: [
            RadialProgress(
              goalCompleted: daysBetween(
                      convertStringToDate(data.dueDay), DateTime.now()) /
                  daysBetween(convertStringToDate(data.dueDay),
                      convertStringToDate(data.startDay)),
              width: 4,
              progressColor: darkBlue,
              child: Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(6),
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
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  NumberFormat.simpleCurrency()
                      .format(data.money)
                      .split('.')[0],
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  NumberFormat.simpleCurrency()
                      .format(data.money * data.purpose / 100 + data.money)
                      .split('.')[0],
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '+ ${data.purpose}%',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  data.startDay,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  DateTime convertStringToDate(String dateString) {
    return DateFormat("dd/MM/yyyy").parse(dateString);
  }

  int daysBetween(DateTime end, DateTime now) {
    return end.difference(now).inDays;
  }
}
