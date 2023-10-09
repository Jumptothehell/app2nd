import 'package:app2nd/src/screen/login.dart';
import 'package:app2nd/src/screen/register.dart';
// import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const MainApp(),
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MainApp(),
    // ),
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
      },
    );
  }
}
