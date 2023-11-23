import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final mialCtrl = TextEditingController();
  String? _selectedValue;
  final passwordCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  final orzCtrl = TextEditingController();

  bool? isPasswordMatch;
  bool _isPasswordObscured = true;
  bool _isCFPasswordObscured = true;

  bool validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: topAppBar('สมัครบัญชีผู้ใช้', true),
      body: Row(
        children: [
          Container(
            width: 30,
          ),
          Expanded(
            child: registerForm(),
          ),
          Container(
            width: 30,
          ),
        ],
      ),
    );
  }

  Future openDialog(BuildContext contextEE) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "กรอกหมายเลขจดทะเบียนหน่วยงาน",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          content: TextField(
            controller: orzCtrl,
            decoration: InputDecoration(
              errorText: validate ? 'กรุณาใส่หมายเลขจดทะเบียนหน่วยงาน' : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      orzCtrl.text.isEmpty ? validate = true : validate = false;
                    },
                  );
                  if (validate == false) {
                    Navigator.of(context).pop();
                    seconOpenDailog(context);
                  }
                },
                child: const Text("ยืนยัน"),
              ),
            )
          ],
        ),
      );

  Future seconOpenDailog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "ท่านสามารถสร้างโครงการขอรับบริจาคได้\nเมื่อบัญชีถูกตรวจสอบแล้ว",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          content: const Text("โดยสามารถติดตามสถานะได้ที่หน้า บัญชี"),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
                child: const Text("ยืนยัน"),
              ),
            )
          ],
        ),
      );

  Form registerForm() {
    return Form(
      key: _formKey,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 700,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: nameCtrl,
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่ชื่อ';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'ชื่อ-นามสกุล / บริษัท',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: phoneCtrl,
                    style: Theme.of(context).textTheme.bodyMedium,
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: addressCtrl,
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่ที่อยู่';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'ที่อยู่',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: mialCtrl,
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่อีเมลล์';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'อีเมลล์',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 1000,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(
                        (0xff656267),
                      )),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        icon: const Icon(Icons.arrow_drop_down),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณาเลือกสถานะ';
                          }
                          return null;
                        },
                        items: <String>['หน่วยงาน / บริษัท', 'ประชาชน']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          if (value is String) {
                            setState(() {
                              _selectedValue = value;
                            });
                          }
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        hint: const Text('เลือกสถานะของคุณ'),
                        value: _selectedValue,
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: _isPasswordObscured,
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: passwordCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่รหัสผ่าน';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'รหัสผ่าน',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // Toggle password visibility without changing _isObscured
                          setState(() {
                            _isPasswordObscured = !_isPasswordObscured;
                          });
                        },
                        child: Icon(
                          _isPasswordObscured
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: _isCFPasswordObscured,
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: confirmPassCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณายืนยันรหัสผ่าน';
                      } else if (passwordCtrl.text != confirmPassCtrl.text) {
                        return 'รหัสผ่านไม่ตรงกัน';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'ยืนยันรหัสผ่าน',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // Toggle password visibility without changing _isObscured
                          setState(() {
                            _isCFPasswordObscured = !_isCFPasswordObscured;
                          });
                        },
                        child: Icon(
                          _isCFPasswordObscured
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_selectedValue == 'หน่วยงาน / บริษัท') {
                          openDialog(context);
                        } else {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (Route<dynamic> route) => false);
                        }
                      }
                    },
                    child: const Text('ยืนยัน'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
