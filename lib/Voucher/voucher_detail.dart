import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:vi_dien_tu_sv/ClassModel/voucher_model.dart';

class VoucherDetail extends StatefulWidget {
  final VoucherModel data;
  const VoucherDetail({super.key, required this.data});

  @override
  State<VoucherDetail> createState() => _VoucherDetailState();
}

class _VoucherDetailState extends State<VoucherDetail> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: darkBlue,
        foregroundColor: Colors.white,
        title: Text(
          widget.data.title,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const SizedBox(
                  height: 300,
                  width: double.infinity,
                ),
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'images/gearVN_background.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 12,
                  right: 12,
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const Dash(
                            length: 296,
                          ),
                          const Text(
                            'GearVN - Ưu đãi đến 4tr đơn từ 12tr',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'HSD: ${widget.data.hsd}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Colors.blue[100],
                            ),
                            margin: const EdgeInsets.only(top: 12, bottom: 18),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Text(
                              'Hết hạn sau 4 ngày',
                              style: TextStyle(
                                color: darkBlue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 106,
                  left: 126,
                  right: 126,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Card(
                      elevation: 5,
                      child: Image.asset(
                        'images/gearVN.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'THÔNG TIN CHUNG',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'SVPay tặng bạn thẻ quà ưu đãi đến 4,000,000Đ cho hóa đơn từ 12,000,000Đ khi mua sắm các cửa hàng chi nhá nh của GearVN. Thanh toán cùng SVPay ngay bạn nhé!',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          'HƯỚNG DẪN SỬ DỤNG\nĐầu tiên, vào [ QUÀ CỦA TÔI ] để chọn thẻ quà > Nhấn nút [ SỬ DỤNG ]; chọn hình thức thanh toán phù hợp với cửa hàng và thanh toán theo một trong hai cách dưới đây:',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: darkBlue,
                                  size: 18,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' Cách 1: Thanh toán bằng QR THANH TOÁN: Chọn QR THANH TOÁN, đưa Mã QR cho thu ngân hoặc máy quét tự động > Nghe tiếng “píp” nghĩa là thanh toán đã thành công.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: darkBlue,
                                  size: 18,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' Cách 2: Thanh toán bằng QUÉT MÃ: Quét mã trên màn hình thu ngân > Kiểm tra số tiền được giảm trừ & bấm xác nhận để hoàn tất thanh toán.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: ' QUY ĐỊNH THẺ QUÀ:\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: darkBlue,
                                  size: 20,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' Mỗi thẻ có giá trị tối đa ưu đãi 4.000.000đ được sử dụng 01 lần trên hóa đơn có giá trị tối thiểu 12.000.000đ.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: darkBlue,
                                  size: 20,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' Áp dụng tại các hệ thống GearVN trên toàn quốc.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: darkBlue,
                                  size: 20,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' Chương trình có thể kết thúc trước thời hạn khi hết ngân sách.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: darkBlue,
                                  size: 20,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' Thẻ quà tặng không có giá trị quy đổi thành tiền mặt.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: darkBlue,
                                  size: 20,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' Thẻ quà KHÔNG được CỘNG GỘP, và KHÔNG được hoàn lại đối với các giao dịch yêu cầu hoàn tiền.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: darkBlue,
                                  size: 20,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' Mỗi khách hàng chỉ nhận một thẻ quà duy nhất trong suốt thời gian chương trình diễn ra.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: darkBlue,
                                  size: 20,
                                ),
                              ),
                              const TextSpan(
                                text: ' Không được thu mua thẻ quà.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: darkBlue,
                                  size: 20,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' SVPay có toàn quyền quyết định với giao dịch có yếu tốt gian lận.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: darkBlue,
                                  size: 20,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    ' Vui lòng đọc kỹ hướng dẫn trên, để trải nghiệm thanh toán và áp dụng thẻ quà với SVPay được tốt nhất.\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb,
                          color: Colors.amber[300],
                          size: 22,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          'Trợ giúp',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Sử dụng',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
