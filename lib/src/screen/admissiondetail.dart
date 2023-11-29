import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class AdmissionDetailScreen extends StatefulWidget {
  const AdmissionDetailScreen({super.key});

  @override
  State<AdmissionDetailScreen> createState() => _AdmissionDetailScreenState();
}

class _AdmissionDetailScreenState extends State<AdmissionDetailScreen> {
  String employeeName = "นายxxxxx";
  String employePhone = "081-xxx-xxxx";
  String object = "หนังสือเรียนจำนวน 50 เล่ม";
  String picture = "assets/img/logo.png";
  String address = "ถนน A ชอย 53";
  String date = "15/01/2566";

  String projectStatus = 'หน่วยงานตอบรับ';
  @override
  Widget build(BuildContext context) {
    String? receivedStatus =
        ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
        appBar: topAppBar('รายละเอียดการเข้ารับ', true),
        body: receivedStatus == 'หน่วยงานตอบรับ'
            ? Column(
                children: [
                  buildEmployeeCard(context),
                  buildDonationCard(),
                ],
              )
            : buildDonationCard());
  }

  Card buildDonationCard() {
    return Card(
      margin: _cardMargin(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "ข้อมูลการบริจาค",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: _textPadding(),
              child: Text(
                "สิ่งของที่ต้องการบริจาค : $object",
              ),
            ),
            Padding(
              padding: _textPadding(),
              child: const Text(
                "รูปสิ่งของที่ต้องการบริจาค :",
              ),
            ),
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    picture,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    picture,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: _textPadding(),
              child: Text(
                "สถานที่ส่งมอบของ : $address",
              ),
            ),
            Padding(
              padding: _textPadding(),
              child: Text(
                "วันนัดส่งมอบ : $date",
              ),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsets _cardMargin() => const EdgeInsets.all(20);

  Card buildEmployeeCard(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      margin: _cardMargin(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "ข้อมูลของพนักงานเข้ารับ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: _textPadding(),
              child: Text(
                "ชื่อพนักงาน : $employeeName",
              ),
            ),
            Padding(
              padding: _textPadding(),
              child: Text(
                "เบอร์โทรติดต่อ : $employePhone",
              ),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsets _textPadding() =>
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0);
}
