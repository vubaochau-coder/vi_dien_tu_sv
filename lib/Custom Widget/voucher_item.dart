import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/ClassModel/voucher_model.dart';
import 'package:vi_dien_tu_sv/Voucher/voucher_detail.dart';

class VoucherItem extends StatelessWidget {
  final VoucherModel data;
  const VoucherItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: SizedBox(
          height: 94,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  data.type == 'gearVN'
                      ? 'images/gearVN.png'
                      : data.type == 'figma'
                          ? 'images/figma.png'
                          : 'images/irisENG.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.description,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          'HSD: ${data.hsd}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return VoucherDetail(data: data);
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Chi tiết',
                            style: TextStyle(
                              color: darkBlue,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
