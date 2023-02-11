import 'package:flutter/material.dart';
import 'package:vi_dien_tu_sv/ClassModel/other_user_model.dart';
import 'package:vi_dien_tu_sv/MyCustomWidget/other_user_item.dart';
import 'package:vi_dien_tu_sv/Transfer/transfer_page.dart';
import 'package:vi_dien_tu_sv/main_screen.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Color darkBlue = const Color.fromARGB(255, 0, 41, 135);
  Color lightBlue = const Color.fromARGB(255, 0, 133, 204);
  List<OtherUser> listUser = [
    OtherUser(
      name: 'Mark Jonhson',
      bankID: '0079 8892 8839 1102',
      image: 'images/man1.jpg',
    ),
    OtherUser(
      name: 'Clarissa Bates',
      bankID: '0079 1234 3358 7245',
      image: 'images/woman.jpg',
    ),
    OtherUser(
      name: 'Klay Thompson',
      bankID: '1211 3854 2374 8502',
      image: 'images/man2.jpg',
    ),
    OtherUser(
      name: 'Peter Parker',
      bankID: '0063 1145 2467 8745',
      image: 'images/boy.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 56,
        leading: Container(
          alignment: Alignment.centerRight,
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: darkBlue,
                width: 2,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return const MainScreen();
                }), (route) => false);
              },
              child: Icon(
                Icons.arrow_back,
                color: darkBlue,
              ),
            ),
          ),
        ),
        title: const Text(
          "Contact",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextField(
                cursorColor: darkBlue,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  prefixIconColor: darkBlue,
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Search contact',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: darkBlue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              "Recent Transfer",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return buildRecentContact(listUser[index]);
                },
                itemCount: listUser.length,
              ),
            ),
            Divider(
              color: Colors.grey[700],
              endIndent: 12,
              indent: 12,
            ),
            const Text(
              "All Contacts",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return buildRecentContact(listUser[index]);
                },
                itemCount: listUser.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRecentContact(OtherUser user) {
    return InkWell(
      splashColor: lightBlue,
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Future.delayed(const Duration(milliseconds: 120), () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return TransferPage(user: user);
          }));
        });
      },
      child: OtherUserItem(
        user: user,
      ),
    );
  }
}
