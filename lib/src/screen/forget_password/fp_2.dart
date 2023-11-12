import 'package:flutter/material.dart';

class ConfirmReset extends StatefulWidget {
  const ConfirmReset({super.key});

  @override
  State<ConfirmReset> createState() => _ConfirmResetState();
}

class _ConfirmResetState extends State<ConfirmReset> {
  final passwordController = TextEditingController();
  bool _validate = false;
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
              child: Text(
                'กรอกรหัสที่ได้รับผ่านอีเมลล์',
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'ex. P3JUT2',
                  errorText: _validate ? 'กรุณาใส่รหัส' : null,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      passwordController.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                    });
                    if (_validate == false) {
                      Navigator.of(context).pushNamed('/newpassword');
                      //   Navigator.of(context).pushNamedAndRemoveUntil(
                      //       '/newpassword', (Route<dynamic> route) => false);
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
