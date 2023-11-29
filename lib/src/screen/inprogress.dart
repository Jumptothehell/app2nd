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

  Future<dynamic> callDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "สถานที่ไม่ตรงตามเงื่อนไขการเข้ารับซึ่งต้องเป็นในกทม. และปริมณฑ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Center(
            child: Column(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/accept');
                      },
                      child: const Text("เเก้ไขข้อมูล"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ลบ"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String projectName = "โครงการปันน้ำใจ";
  String address = "ถนน A ชอย 53";
  String date = "25/02/2566";

  String projectStatus = 'หน่วยงานตอบรับ';

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
            return buildProjectList(snapshot);
          }
        },
      ),
    );
  }

  ListView buildProjectList(AsyncSnapshot<dynamic> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: ((context, index) {
        return buildProjectCard(context);
      }),
    );
  }

  Container buildProjectCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      height: 120,
      child: InkWell(
        onTap: () {
          projectStatus == 'หน่วยงานตอบรับ' ||
                  projectStatus == 'รอหน่วยงานยืนยัน'
              ? Navigator.of(context)
                  .pushNamed('/admission', arguments: projectStatus)
              : null;
        },
        child: createCard(context),
      ),
    );
  }

  Card createCard(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
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
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 60),
                child: VerticalDivider(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 80,
              width: 80,
              child: buildProjectStatus(context),
            ),
          ),
        ],
      ),
    );
  }

  Center buildProjectStatus(BuildContext context) {
    return Center(
      child: projectStatus == 'หน่วยงานตอบรับ'
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
                  ? Column(
                      children: [
                        const Text(
                          "หน่วยงานปฏิเสธ",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                        InkWell(
                          onTap: () {
                            callDialog(context);
                          },
                          child: const Text(
                            'สาเหตุ',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                                color: Colors.red),
                          ),
                        )
                      ],
                    )
                  : Container(),
    );
  }
}
