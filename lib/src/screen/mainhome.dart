import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

Widget buildProject(int index) => Container(
      width: 200,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text('$index'),
      ),
    );

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                color: const Color.fromARGB(255, 27, 194, 141),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 80,
                      ),
                    ),
                    Text(
                      "สวัสดี, ผู้ใช้งาน",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              // SingleChildScrollView(
              SizedBox(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'โครงการแนะนำ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            child: Text(
                              'ดูทั้งหมด',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Color.fromARGB(
                                  255,
                                  27,
                                  194,
                                  141,
                                ),
                                color: Color.fromARGB(
                                  255,
                                  27,
                                  194,
                                  141,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(12),
                          itemBuilder: (context, index) {
                            return buildProject(index);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 30,
                            );
                          },
                          itemCount: 10),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 210,
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(20),
                          itemBuilder: (context, index) {
                            return buildProject(index);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: 10),
                    ),
                  ],
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
