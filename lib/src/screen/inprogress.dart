import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  Future<String> fetchData() async {
    // ในที่นี้ให้กำหนด delay เพื่อจำลองการดึงข้อมูลจากที่อื่น
    // await Future.delayed(const Duration(seconds: 2));
    return 'ANB';
  }

  String projectName = "โครงการปันน้ำใจ";
  String address = "ถนน A ชอย 53";
  String date = "25/02/2566";

  String projectStatus = 'รอหน่วยงานยืนยัน';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar("กำลังดำเนินการ", false),
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
                return Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  height: 120,
                  child: InkWell(
                    onTap: () {
                      projectStatus == 'หน่วยงานตอบรับ'
                          ? const Text(
                              "หน่วยงานตอบรับ",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xff1BC28E)),
                            )
                          : projectStatus == 'รอหน่วยงานยืนยัน'
                              ? const Text(
                                  "รอหน่วยงานยืนยัน",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xff1BC28E)),
                                )
                              : projectStatus == 'หน่วยงานปฏิเสธ'
                                  ? const Column(
                                      children: [
                                        Text(
                                          "หน่วยงานปฏิเสธ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        Text(
                                          'สาเหตุ',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Colors.red,
                                              color: Colors.red),
                                        )
                                      ],
                                    )
                                  : Container();
                    },
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      // color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  projectName,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text("นัดรับที่ $address"),
                                Text("วันที่ $date")
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15.0, bottom: 15.0, left: 60),
                                child: VerticalDivider(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Center(
                                child: projectStatus == 'หน่วยงานตอบรับ'
                                    ? const Text(
                                        "หน่วยงานตอบรับ",
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Color(0xff1BC28E)),
                                      )
                                    : projectStatus == 'รอหน่วยงานยืนยัน'
                                        ? const Text(
                                            "รอหน่วยงานยืนยัน",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff1BC28E)),
                                          )
                                        : projectStatus == 'หน่วยงานปฏิเสธ'
                                            ? const Column(
                                                children: [
                                                  Text(
                                                    "หน่วยงานปฏิเสธ",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  Text(
                                                    'สาเหตุ',
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationColor:
                                                            Colors.red,
                                                        color: Colors.red),
                                                  )
                                                ],
                                              )
                                            : Container(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }
        },
      ),
    );
  }
}
