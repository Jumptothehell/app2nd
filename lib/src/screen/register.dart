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

  bool? isPasswordMatch;
  bool _isPasswordObscured = true;
  bool _isCFPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'สมัครบัญชีผู้ใช้',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff1BC28E),
      ),
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
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/', (Route<dynamic> route) => false);
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
