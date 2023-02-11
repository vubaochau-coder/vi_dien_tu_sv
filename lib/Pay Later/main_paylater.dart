import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vi_dien_tu_sv/ClassModel/phieu_no.dart';
import 'package:vi_dien_tu_sv/Pay%20Later/danh_sach_phieu_no.dart';
import 'package:vi_dien_tu_sv/main_screen.dart';

class MainPayLaterPage extends StatefulWidget {
  const MainPayLaterPage({super.key});

  @override
  State<MainPayLaterPage> createState() => _MainPayLaterPageState();
}

class _MainPayLaterPageState extends State<MainPayLaterPage> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  int money = 2013405;
  List<PhieuNo> ganHetHan = [
    PhieuNo(
      ngayVay: 'Tháng 12, 2022',
      soTien: '186595',
      ngayHetHan: '31/01/2023',
      laiSuat: 0.04,
    ),
    PhieuNo(
      ngayVay: 'Tháng 12, 2022',
      soTien: '50000',
      ngayHetHan: '22/01/2023',
      laiSuat: 0.04,
    ),
    PhieuNo(
      ngayVay: 'Tháng 12, 2022',
      soTien: '250000',
      ngayHetHan: '27/01/2023',
      laiSuat: 0.04,
    ),
    PhieuNo(
      ngayVay: 'Tháng 01, 2023',
      soTien: '140000',
      ngayHetHan: '15/02/2023',
      laiSuat: 0.037,
    ),
  ];
  List<PhieuNo> phieuNoList = [
    PhieuNo(
      ngayVay: 'Tháng 12, 2022',
      soTien: '186595',
      ngayHetHan: '31/01/2023',
      laiSuat: 0.25,
    ),
    PhieuNo(
      ngayVay: 'Tháng 12, 2022',
      soTien: '50000',
      ngayHetHan: '22/01/2023',
      laiSuat: 0.1,
    ),
    PhieuNo(
      ngayVay: 'Tháng 12, 2022',
      soTien: '250000',
      ngayHetHan: '27/01/2023',
      laiSuat: 0.29,
    ),
    PhieuNo(
      ngayVay: 'Tháng 01, 2023',
      soTien: '200000',
      ngayHetHan: '20/02/2023',
      laiSuat: 0.27,
    ),
    PhieuNo(
      ngayVay: 'Tháng 01, 2023',
      soTien: '140000',
      ngayHetHan: '15/02/2023',
      laiSuat: 0.22,
    ),
    PhieuNo(
      ngayVay: 'Tháng 02, 2023',
      soTien: '160000',
      ngayHetHan: '06/03/2023',
      laiSuat: 0.24,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const SizedBox(
                height: 240,
                width: double.infinity,
              ),
              Container(
                height: 240,
                width: double.infinity,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      darkBlue,
                      lightBlue,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return const MainScreen();
                          }), (route) => false);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Ví trả sau',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(
                        width: 48,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 12,
                right: 12,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 18, bottom: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' THẺ BẠC',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Số dư khả dụng',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    NumberFormat.simpleCurrency()
                                        .format(money)
                                        .split('.')[0]
                                        .split('\$')[1],
                                    style: TextStyle(
                                      color: Colors.blue[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                              child: VerticalDivider(
                                color: Colors.grey,
                                thickness: 4,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Số dư nợ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    NumberFormat.simpleCurrency()
                                        .format(3000000 - money)
                                        .split('.')[0]
                                        .split('\$')[1],
                                    style: TextStyle(
                                      color: Colors.red[300],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 14, bottom: 10),
            child: Text(
              'Ứng tiền dùng trước',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18),
                      label: const Text(
                        'Nhập số tiền cần rút',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: lightBlue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: darkBlue,
                    ),
                    child: const Text(
                      'Rút tiền',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 18, left: 14, bottom: 8, right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'PHIẾU NỢ CẦN THANH TOÁN',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DanhSachPhieuNo(listData: phieuNoList);
                    }));
                  },
                  child: Text(
                    'Tất cả',
                    style: TextStyle(
                      color: lightBlue,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return buildBill(ganHetHan[index]);
                },
                itemCount: ganHetHan.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBill(PhieuNo item) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.ngayVay,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: daysBetween(convertStringToDate(item.ngayHetHan),
                                DateTime.now()) >=
                            0
                        ? Colors.amber[100]
                        : Colors.red[100],
                  ),
                  child: Text(
                    formatText(daysBetween(
                        convertStringToDate(item.ngayHetHan), DateTime.now())),
                    style: TextStyle(
                      color: daysBetween(convertStringToDate(item.ngayHetHan),
                                  DateTime.now()) >=
                              0
                          ? Colors.amber[900]
                          : Colors.red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Ngày hết hạn: ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  item.ngayHetHan,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${NumberFormat.simpleCurrency().format(double.parse(item.soTien)).split('\$')[1].split('.')[0]}đ',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: darkBlue,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  ),
                  child: const Text(
                    'Thanh toán',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Phiếu nợ sẽ phát sinh thêm phí phạt nếu thanh toán trễ thời hạn',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              ),
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

  String formatText(int day) {
    if (day >= 0) {
      return 'Còn $day ngày';
    } else {
      return 'Quá hạn ${day.abs()} ngày';
    }
  }
}
