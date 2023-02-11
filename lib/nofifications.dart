import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vi_dien_tu_sv/ClassModel/notification_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  bool allSelected = true;
  bool transferSelected = false;
  bool invoiceSelected = false;
  bool voucherSelected = false;

  List<Notify> notifies = [
    Notify("Send money", "You transferred \$100.0000 to Lionel Messi", false,
        DateTime(2022, 11, 27), "Transfer"),
    Notify("Send money", "You transferred \$50.0000 to Emma Watson", false,
        DateTime(2022, 11, 25), "Transfer"),
    Notify("Transfer", "You received \$1.000.000 from Cristiano Ronaldo", true,
        DateTime(2022, 11, 23), "Transfer"),
    Notify("Reminder", "You have an Electricity bill to pay", false,
        DateTime(2022, 11, 23), "Invoice"),
    Notify("Send money", "You transferred \$100.000 to Nguyen Khanh", true,
        DateTime(2022, 11, 22), "Transfer"),
    Notify("Invoice", "You paid \$70.000 for the water bill in October", true,
        DateTime(2022, 11, 22), "Invoice"),
  ];

  final dateFormat = DateFormat('E dd/MM');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        elevation: 0,
        title: const Text(
          "Notifications",
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.playlist_add_check_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 38,
                      width: 60,
                      margin: const EdgeInsets.only(
                        left: 4,
                        top: 4,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                          color: allSelected
                              ? darkBlue
                              : const Color.fromRGBO(238, 238, 238, 1),
                        ),
                        color: allSelected ? Colors.white : Colors.grey[200],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          setState(() {
                            allSelected = true;
                            transferSelected = false;
                            invoiceSelected = false;
                            voucherSelected = false;
                          });
                        },
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: allSelected ? darkBlue : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 38,
                      width: 90,
                      margin: const EdgeInsets.only(
                        left: 4,
                        top: 4,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                          color: transferSelected
                              ? darkBlue
                              : const Color.fromRGBO(238, 238, 238, 1),
                        ),
                        color:
                            transferSelected ? Colors.white : Colors.grey[200],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          setState(() {
                            transferSelected = true;
                            allSelected = false;
                            invoiceSelected = false;
                            voucherSelected = false;
                          });
                        },
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            color: transferSelected ? darkBlue : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 38,
                      width: 90,
                      margin: const EdgeInsets.only(
                        left: 4,
                        top: 4,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                          color: invoiceSelected
                              ? darkBlue
                              : const Color.fromRGBO(238, 238, 238, 1),
                        ),
                        color:
                            invoiceSelected ? Colors.white : Colors.grey[200],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          setState(() {
                            allSelected = false;
                            transferSelected = false;
                            invoiceSelected = true;
                            voucherSelected = false;
                          });
                        },
                        child: Text(
                          'Invoice',
                          style: TextStyle(
                            color: invoiceSelected ? darkBlue : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 38,
                      width: 90,
                      margin: const EdgeInsets.only(
                        left: 4,
                        top: 4,
                        bottom: 4,
                        right: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                          color: voucherSelected
                              ? darkBlue
                              : const Color.fromRGBO(238, 238, 238, 1),
                        ),
                        color:
                            voucherSelected ? Colors.white : Colors.grey[200],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          setState(() {
                            voucherSelected = true;
                            transferSelected = false;
                            allSelected = false;
                            invoiceSelected = false;
                          });
                        },
                        child: Text(
                          'Voucher',
                          style: TextStyle(
                            color: voucherSelected ? darkBlue : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 13,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return buildListView(context, index);
                  },
                  itemCount: notifies.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          notifies[index].read = true;
        });
      },
      child: SizedBox(
        height: 100,
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(
                    left: 4,
                  ),
                  child: Image(
                    image: notifies[index].type == "Transfer"
                        ? const AssetImage("images/transfer.png")
                        : const AssetImage("images/invoice.png"),
                    fit: BoxFit.contain,
                    height: 70,
                    width: 40,
                    opacity: notifies[index].read
                        ? const AlwaysStoppedAnimation(0.5)
                        : null,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 4,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            notifies[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: notifies[index].read
                                  ? darkBlue.withOpacity(0.3)
                                  : darkBlue,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            dateFormat.format(notifies[index].dateTime),
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        notifies[index].subTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 13,
                          color:
                              notifies[index].read ? Colors.grey : Colors.black,
                        ),
                      ),
                      const Text(
                        'Click to see detail',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
