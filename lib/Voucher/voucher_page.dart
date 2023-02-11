import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/ClassModel/voucher_model.dart';
import 'package:vi_dien_tu_sv/Custom%20Widget/voucher_item.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  int selected = 0;

  List<VoucherModel> vouchers = [
    VoucherModel(
        'GearVN', 'Giảm giá 20% cho tất cả sản phẩm', '15/04/2023', 'gearVN'),
    VoucherModel(
        'GearVN', 'Giảm giá 10% cho tất cả sản phẩm', '01/03/2023', 'gearVN'),
    VoucherModel(
        'GearVN', 'Giảm giá 15% cho tất cả sản phẩm', '22/03/2023', 'gearVN'),
    VoucherModel(
        'Figma', 'Giảm giá 20% khi mua gói Premium', '25/05/2023', 'figma'),
    VoucherModel(
        'Iris', 'Giảm giá 10% cho tất cả khóa học', '01/03/2023', 'iris'),
    VoucherModel(
        'Figma', 'Giảm giá 35% khi mua gói Premium', '22/03/2023', 'figma'),
    VoucherModel('Iris', 'Giảm giá 15% cho lớp tân sinh', '01/03/2023', 'iris'),
    VoucherModel(
        'Iris', 'Giảm giá 20% khóa luyện thi IELTS', '01/03/2023', 'iris'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Voucher',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        backgroundColor: darkBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 0;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: darkBlue,
                    ),
                    color: selected == 0 ? darkBlue : Colors.white,
                  ),
                  child: Text(
                    'Tất cả',
                    style: TextStyle(
                      color: selected == 0 ? Colors.white : lightBlue,
                      fontWeight:
                          selected == 0 ? FontWeight.bold : FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: darkBlue,
                    ),
                    color: selected == 1 ? darkBlue : Colors.white,
                  ),
                  child: Text(
                    'Hóa đơn',
                    style: TextStyle(
                      color: selected == 1 ? Colors.white : lightBlue,
                      fontWeight:
                          selected == 1 ? FontWeight.bold : FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: darkBlue,
                    ),
                    color: selected == 2 ? darkBlue : Colors.white,
                  ),
                  child: Text(
                    'Học tập',
                    style: TextStyle(
                      color: selected == 2 ? Colors.white : lightBlue,
                      fontWeight:
                          selected == 2 ? FontWeight.bold : FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return buildListItem(vouchers[index]);
              },
              itemCount: vouchers.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(VoucherModel data) {
    return VoucherItem(data: data);
  }
}
