import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Future<String> fetchData() async {
    // ในที่นี้ให้กำหนด delay เพื่อจำลองการดึงข้อมูลจากที่อื่น
    // await Future.delayed(const Duration(seconds: 2));
    return 'ANB';
  }

  String? carryDate = "15/02/2565";
  String? date = "01/02/2565";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar("ประวัติการบริจาค", false),
      body: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Text("ไม่มีข้อมูลที่ได้รับ");
            } else if (snapshot.hasError) {
              return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  return Column(children: [
                    ListTile(
                      title: const Text("มูลนิธิ"),
                      subtitle: Text("วันนัดส่งมอบ: $carryDate"),
                      trailing: Text("$date"),
                    ),
                    if (index < snapshot.data.length - 1) const Divider(),
                  ]);
                }),
              );
            }
          }),
    );
  }
}
