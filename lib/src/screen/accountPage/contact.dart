import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar("ติดต่อเจ้าหน้าที่", true),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ช่องทางการติดต่อ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text("Email: finalpass@.gmail.com")
          ],
        ),
      ),
    );
  }
}
