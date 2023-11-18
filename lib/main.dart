// import 'package:app2nd/src/screen/bottom_appbar.dart';
import 'package:app2nd/src/navigation/bottom_appbar.dart';
import 'package:app2nd/src/screen/forget_password/fp_1.dart';
import 'package:app2nd/src/screen/forget_password/fp_2.dart';
import 'package:app2nd/src/screen/forget_password/fp_3.dart';
import 'package:app2nd/src/screen/login.dart';
import 'package:app2nd/src/screen/register.dart';
// import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    // const MainApp(),
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MainApp(),
    // ),
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: true,
        //text Theme
        fontFamily: GoogleFonts.notoSansThai().fontFamily,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(fontSize: 16),
        ),
        //Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff1BC28E),
            foregroundColor: Colors.white,
            shadowColor: Colors.black,
            fixedSize: const Size(140, 32),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LogInScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forget': (context) => const ForgetPass(),
        '/reset': (context) => const ConfirmReset(),
        '/newpassword': (context) => const NewPassword(),
        '/bottom': (context) => const BottomBar()
      },
    );
  }
}
