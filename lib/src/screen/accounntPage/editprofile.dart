import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final mailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool _isPasswordObscured = true;

  Future openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "ข้อมูลไม่มีการเปลี่ยนแปลง",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Center(
              child: Column(
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context).pop();
                  //   },
                  //   child: const Text("ยืนยัน"),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("กลับ"),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  Future openAnotherDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "ยืนยันการเเก้ไขข้อมูล",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Center(
                child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const EditProfileScreen()),
                    );
                  },
                  child: const Text("ยืนยัน"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("กลับ"),
                ),
              ],
            ))
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: topAppBar("แก้ไขข้อมูลส่วนตัว", true),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 50, right: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameCtrl,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    hintText: "ชื่อ-นามสกุล",
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneCtrl,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    hintText: "เบอร์โทรศัพท์",
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: addressCtrl,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    hintText: "ที่อยู่",
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: mailCtrl,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    hintText: "อีเมลล์",
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: _isPasswordObscured,
                  keyboardType: TextInputType.text,
                  controller: passwordCtrl,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: "รหัสผ่าน",
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
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
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nameCtrl.text.isEmpty &&
                        phoneCtrl.text.isEmpty &&
                        addressCtrl.text.isEmpty &&
                        mailCtrl.text.isEmpty &&
                        passwordCtrl.text.isEmpty) {
                      openDialog(context);
                    } else {
                      openAnotherDialog(context);
                    }
                  },
                  child: const Text('ยืนยัน'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
