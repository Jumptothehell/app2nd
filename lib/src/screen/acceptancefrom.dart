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

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dateCtrl.text =
            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
      });
    }
  }

  Future<dynamic> callDialog(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          Center(
            child: Column(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/main',
                          (Route<dynamic> route) => false,
                          arguments: 1, // ส่ง index ที่ 3 ไปยัง _BottomBarState
                        );
                      },
                      child: const Text("ใช่"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ไม่"),
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

  Column formField(String text, String errorText, Icon? icon, String hintText,
      TextInputType inputType, TextEditingController controller) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(text),
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
            suffixIcon: icon,
            // const Icon(Icons.abc),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
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
                formField('ชื่อตัวแทนบริจาค', 'กรุณาใส่ชื่อ', null,
                    'ชื่อ-นามสกุล', TextInputType.name, nameCtrl),
                formField('เบอร์โทรศัพท์', 'กรุณาใส่เบอร์โทรศัพท์', null,
                    'เบอร์โทรศัพท์', TextInputType.phone, phoneCtrl),
                formField(
                    'สิ่งของที่ต้องการบริจาค',
                    'กรุณาระบุของที่ต้องการบริจาค',
                    null,
                    'สิ่งของที่ต้องการบริจาค',
                    TextInputType.text,
                    objCtrl),
                formField(
                    'รูปสิ่งของที่ต้องการบริจาค',
                    'กรุณาใส่รูป',
                    const Icon(Icons.photo_size_select_actual_rounded),
                    'แนบไฟล์',
                    TextInputType.text,
                    picCtrl),
                // AbsorbPointer(
                //   child: formField(
                //       'รูปสิ่งของที่ต้องการบริจาค',
                //       'กรุณากรอกสถานที่ส่งมอบของ',
                //       const IconButton(Icons.location_on),
                //       'กรอกที่อยู่',
                //       TextInputType.streetAddress,
                //       addressCtrl),
                // ),
                GestureDetector(
                  child: Column(children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('สถานที่ส่งมอบของ'),
                    ),
                    TextFormField(
                      controller: addressCtrl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "กรุณากรอกสถานที่ส่งมอบของ";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () => print('click'),
                            icon: const Icon(Icons.location_on)),
                        hintText: 'กรอกที่อยู่',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ]),
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: Column(children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text('วันนัดส่งมอบของ'),
                      ),
                      TextFormField(
                        controller: dateCtrl,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_month),
                          hintText: 'วัน/เดือน/ปี',
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      ),
                    ]),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      callDialog(context,
                          "โปรดตรวจสอบข้อมูลของท่าน\nไม่สามารถยกเลิกได้ในภายหลัง");
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     '/main', (Route<dynamic> route) => false);
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
