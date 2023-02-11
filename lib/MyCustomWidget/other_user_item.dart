import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/ClassModel/other_user_model.dart';

class OtherUserItem extends StatelessWidget {
  final OtherUser user;
  const OtherUserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6, bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundImage: AssetImage(user.image),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Bank - ${user.bankID}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
