import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  String name = "ชื่อโครงการ";
  String receiver = "มูลนิธิศูนย์พิทักษ์สิทธิเด็ก";
  String place = "ถนน---ซอย---";
  String detail =
      "ในสถานการณ์การแพร่ระบาดของเชื้อไวรัสโควิด19 เชิญชวนทุกคนบริจาคสิ่งของทีี่จำเป็นต่อเด็กๆ";
  String object = "ของสำหรับเด็ก";
  String deliver = "ส่งทางไปรษณีย์\nหน่วยงานเข้ารับตามที่อยู่";
  String contact = "โทร : 02------";
  String condition = "อยู่ในกรุงเทพ";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: topAppBar("รายละเอียดโครงการ", true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 180,
                color: Colors.lightBlue,
                child: Image.asset("assets/img/logo.png"),
              ),
              Container(
                width: 500,
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'หน่วยงาน :',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(receiver),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'สถานที่ตั้ง :',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(place),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'รายละเอียด :',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(detail),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ของที่เปิดรับบริจาค :',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(object),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ข้อมูลการบริจาค :',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(deliver),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ติดต่อหน่วยงาน :',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(contact),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เงื่อนไขการเข้ารับ :',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(condition),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/accept'),
                      child: const Text(
                        "ตกลง",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
