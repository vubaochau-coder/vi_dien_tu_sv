import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vi_dien_tu_sv/ClassModel/phieu_no.dart';
import 'package:vi_dien_tu_sv/Pay%20Later/main_paylater.dart';

class DanhSachPhieuNo extends StatefulWidget {
  final List<PhieuNo> listData;
  const DanhSachPhieuNo({super.key, required this.listData});

  @override
  State<DanhSachPhieuNo> createState() => _DanhSachPhieuNoState();
}

class _DanhSachPhieuNoState extends State<DanhSachPhieuNo> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                            return const MainPayLaterPage();
                          }), (route) => false);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Danh sách phiếu nợ',
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
                bottom: 90,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffCAF0F8).withOpacity(0.38),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.timer_sharp,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Lưu ý: \n- Miễn phí lãi suất từ nay đến 28/02/2023',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 14,
                right: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DANH SÁCH PHIẾU NỢ',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lightbulb_circle_outlined,
                          color: lightBlue,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Expanded(
                          child: Text(
                            'Có thể bạn đã biết: Thanh toán càng sớm, sẽ chịu lãi ít hơn',
                            style: TextStyle(
                              color: Colors.black87,
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
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return buildBill(widget.listData[index]);
              },
              itemCount: widget.listData.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBill(PhieuNo item) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(top: 4, bottom: 4, left: 14, right: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${NumberFormat.simpleCurrency().format(double.parse(item.soTien)).split('\$')[1].split('.')[0]}đ',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
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
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffC7C4C4).withOpacity(0.29),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Số tiền phải trả:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff002987).withOpacity(0.54),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${NumberFormat.simpleCurrency().format(soTienPhaiTra(item.soTien, item.laiSuat, item.ngayHetHan)).split('\$')[1].split('.')[0]}đ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color(0xff002987).withOpacity(0.54),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lãi suất: '
                  '${NumberFormat.simpleCurrency().format(soTienPhaiTra(item.soTien, item.laiSuat, item.ngayHetHan) - double.parse(item.soTien)).split('\$')[1].split('.')[0]}đ'
                  '(${item.laiSuat}%/tháng)',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
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
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  ),
                  child: const Text(
                    'Thanh toán',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
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

  double soTienPhaiTra(String money, double laiSuat, String endDay) {
    if (daysBetween(convertStringToDate(endDay), DateTime.now()) < 0) {
      return double.parse(money) + double.parse(money) * laiSuat / 100;
    } else {
      return double.parse(money);
    }
  }
}
