import 'package:flutter/material.dart';

class RutTienDialog extends StatelessWidget {
  const RutTienDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Color darkBlue = const Color.fromARGB(255, 0, 41, 135);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: BorderSide(color: darkBlue, width: 1),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.av_timer_rounded,
            color: darkBlue,
            size: 72,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning,
                color: Colors.amber[900],
                size: 22,
              ),
              Text(
                ' RÚT TIỀN KHỎI VÍ',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Lưu ý: Nếu rút tiền ra khỏi ví trước hạn rút thì bạn sẽ không nhận được lãi suất',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            'Bạn có chắc chắn rút tiền?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: darkBlue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    'Hủy bỏ',
                    style: TextStyle(
                      color: darkBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: darkBlue,
                  ),
                  child: const Text(
                    'Rút tiền',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
