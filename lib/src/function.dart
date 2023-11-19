import 'package:flutter/material.dart';

AppBar topAppBar(String titlename, bool isBacked) {
  return AppBar(
    title: Text(
      titlename,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    ),
    automaticallyImplyLeading: isBacked,
    centerTitle: true,
    backgroundColor: const Color(0xff1BC28E),
  );
}
