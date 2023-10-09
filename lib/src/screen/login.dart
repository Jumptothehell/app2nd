import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff1BC28E), Color(0xff8FE1A1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                child: Image.asset(
                  'assets/img/logo.png',
                ),
              ),
              Expanded(
                child: Container(
                  height: 340,
                  decoration: const BoxDecoration(
                    color: Color(0x90FFFFFF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 28, right: 28),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        margin: const EdgeInsets.only(left: 60, right: 60),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide.none,
                            left: BorderSide.none,
                            right: BorderSide.none,
                            bottom: BorderSide(width: 1),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'เข้าสู่ระบบ',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      Expanded(
                        child: logInForm(context),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 180,
              )
            ],
          ),
        ),
      ),
    );
  }

  Form logInForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          const SizedBox(
            width: 30,
            height: 260,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: mailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาใส่อีเมลล์';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'อีเมลล์',
                    filled: true,
                    fillColor: Colors.white,
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
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาใส่รหัสผ่าน';
                    }
                    return null;
                  },
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // Toggle password visibility without changing _isObscured
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                      child: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushNamedAndRemoveUntil(
                        //         '/register',
                        //         (Route<dynamic> route) =>
                        //             false);
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'สมัครบัญชีผู้ใช้',
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: Color(0xff54855F)),
                      ),
                    ),
                    const InkWell(
                      child: Text(
                        'ลืมรหัสผ่าน ?',
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: Color(0xff54855F)),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // print('ยืนยัน');
                      // Navigator.of(context)
                      //     .pushNamed('/');
                    }
                  },
                  child: const Text('เข้าสู่ระบบ'),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 30,
            height: 260,
          )
        ],
      ),
    );
  }
}
