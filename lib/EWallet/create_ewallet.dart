import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEWalletPage extends StatefulWidget {
  const CreateEWalletPage({super.key});

  @override
  State<CreateEWalletPage> createState() => _CreateEWalletPageState();
}

class _CreateEWalletPageState extends State<CreateEWalletPage> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  DateTime myDate = DateTime.now();
  int selected = 1;
  List<String> dropDownValues = [
    'Học tập',
    'Gia đình',
    'Làm đẹp',
    'Du lịch',
    'Mua sắm',
    'Khác'
  ];
  List<IconData> dropDownIcon = [
    Icons.menu_book_sharp,
    Icons.family_restroom,
    Icons.face_retouching_natural,
    Icons.travel_explore,
    Icons.shopping_cart,
    Icons.outlet_sharp,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 178,
                padding: const EdgeInsets.only(
                  bottom: 18,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: darkBlue,
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
                alignment: Alignment.center,
                child: const Text(
                  "Tạo Siêu Ví",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Số tiền',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: darkBlue,
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      child: Center(
                        widthFactor: 2.0,
                        child: Text(
                          'VNĐ',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    hintText: 'xxx,xxx,xxx',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: darkBlue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Ngày rút ví',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                              primary: darkBlue,
                              onPrimary: Colors.white,
                            )),
                            child: child!,
                          );
                        },
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2100),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            myDate = value;
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: lightBlue,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dateFormat.format(myDate),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.calendar_month,
                          color: darkBlue,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Tên ví',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  keyboardType: TextInputType.text,
                  cursorColor: darkBlue,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    hintText: 'Tên ví...',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: darkBlue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Mục đích',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value!;
                                });
                              },
                              activeColor: darkBlue,
                            ),
                            const Text(
                              'Học tập',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.menu_book_outlined,
                              color: darkBlue,
                              size: 18,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value!;
                                });
                              },
                              activeColor: darkBlue,
                            ),
                            const Text(
                              'Gia đình',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.family_restroom,
                              color: darkBlue,
                              size: 18,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 3,
                              groupValue: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value!;
                                });
                              },
                              activeColor: darkBlue,
                            ),
                            const Text(
                              'Làm đẹp',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.face_retouching_natural,
                              color: darkBlue,
                              size: 18,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 4,
                              groupValue: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value!;
                                });
                              },
                              activeColor: darkBlue,
                            ),
                            const Text(
                              'Du lịch',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.travel_explore,
                              color: darkBlue,
                              size: 18,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 5,
                              groupValue: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value!;
                                });
                              },
                              activeColor: darkBlue,
                            ),
                            const Text(
                              'Mua sắm',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.shopping_cart,
                              color: darkBlue,
                              size: 18,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 6,
                              groupValue: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value!;
                                });
                              },
                              activeColor: darkBlue,
                            ),
                            const Text(
                              'Khác',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.outlet_sharp,
                              color: darkBlue,
                              size: 18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Thêm ví',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
