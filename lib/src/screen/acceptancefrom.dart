import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class AcceptanceForm extends StatefulWidget {
  const AcceptanceForm({super.key});

  @override
  State<AcceptanceForm> createState() => _AcceptanceFormState();
}

class _AcceptanceFormState extends State<AcceptanceForm> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final objCtrl = TextEditingController();
  final picCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final dateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: topAppBar("รายละเอียดการเข้ารับ", true),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 700,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('ชื่อตัวแทนบริจาค'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: nameCtrl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาใส่ชื่อ';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'ชื่อ-นามสกุล',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('เบอร์โทรศัพท์'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneCtrl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาใส่เบอร์โทรศัพท์';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'เบอร์โทรศัพท์',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('สิ่งของที่ต้องการบริจาค'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: objCtrl,
                            minLines: 3,
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุของที่ต้องการบริจาค';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'สิ่งของที่ต้องการบริจาค',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('รูปสิ่งของที่ต้องการบริจาค'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: picCtrl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาใส่รูป';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'แนบไฟล์',
                              suffixIcon: Icon(Icons.image),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('สถานที่ส่งมอบของ'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            controller: addressCtrl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณากรอกสถานที่ส่งมอบของ';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.location_on),
                              hintText: 'กรอกที่อยู่',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('วันนัดส่งมอบของ'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.datetime,
                            controller: dateCtrl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาใส่วันนัดส่งมอบของ';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.calendar_month),
                              hintText: 'วัน/เดือน/ปี',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/main', (Route<dynamic> route) => false);
                          }
                        },
                        child: const Text(
                          "ตกลง",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
