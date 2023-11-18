import 'package:flutter/material.dart';

AppBar topAppBar(String titlename) {
  return AppBar(
    title: Text(
      titlename,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    ),
    centerTitle: true,
    backgroundColor: const Color(0xff1BC28E),
  );
}
