import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar("กำลังดำเนินการ", false),
    );
  }
}