import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _emailConroller = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(""),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xff1BC28E),
      // ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'โปรดกรอกอีเมลล์ที่ได้ลงทะเบียนไว้',
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _emailConroller,
                decoration: InputDecoration(
                  hintText: 'อีเมลล์',
                  errorText: _validate ? 'กรุณาใส่เมลล์ให้ถูกต้อง' : null,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _emailConroller.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                    });
                    if (_validate == false) {
                      Navigator.of(context).pushNamed('/reset');
                    }
                  },
                  child: const Text('ยืนยัน')),
            ),
          ],
        ),
      ),
    );
  }
}
