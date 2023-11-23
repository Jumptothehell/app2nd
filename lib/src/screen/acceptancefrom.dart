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
          child: createForm(),
        ),
      ),
    );
  }

  Column formField(String text, String errorText, String hintText,
      TextInputType inputType, TextEditingController controller) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(text),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          keyboardType: inputType,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorText;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
        ),
      ],
    );
  }

  Form createForm() {
    return Form(
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
                formField('ชื่อตัวแทนบริจาค', 'กรุณาใส่ชื่อ', 'ชื่อ-นามสกุล',
                    TextInputType.name, nameCtrl),
                formField('เบอร์โทรศัพท์', 'กรุณาใส่เบอร์โทรศัพท์',
                    'เบอร์โทรศัพท์', TextInputType.phone, phoneCtrl),
                formField(
                    'สิ่งของที่ต้องการบริจาค',
                    'กรุณาระบุของที่ต้องการบริจาค',
                    'สิ่งของที่ต้องการบริจาค',
                    TextInputType.text,
                    objCtrl),
                formField('สถานที่ส่งมอบของ', 'กรุณาใส่รูป', 'แนบไฟล์',
                    TextInputType.text, picCtrl),
                formField(
                    'รูปสิ่งของที่ต้องการบริจาค',
                    'กรุณากรอกสถานที่ส่งมอบของ',
                    'กรอกที่อยู่',
                    TextInputType.streetAddress,
                    addressCtrl),
                formField('วันนัดส่งมอบของ', 'กรุณาใส่วันนัดส่งมอบของ',
                    'วัน/เดือน/ปี', TextInputType.datetime, dateCtrl),
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
    );
  }
}
