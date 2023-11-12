import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool? isPasswordMatch;
  bool _isPasswordObscured = true;
  bool _isCFPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1BC28E),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('กรอกรหัสผ่านใหม่'),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                obscureText: _isPasswordObscured,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่รหัสผ่าน';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'รหัสผ่านใหม่',
                  // errorText: _validate ? 'กรุณาใส่รหัส' : null,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
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
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  obscureText: _isCFPasswordObscured,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณายืนยันรหัสผ่าน';
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      return 'รหัสผ่านไม่ตรงกัน';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'ยืนยันรหัสผ่าน',
                    // errorText: _validate ? 'กรุณาใส่รหัส' : null,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
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
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ยืนยัน'),
            ),
          ],
        ),
      ),
    );
  }
}
