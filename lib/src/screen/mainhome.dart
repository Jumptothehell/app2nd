import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

Widget buildProject(int index) => Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 250,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/project'),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 160,
                      child: Image.asset(
                        'assets/img/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Text("Name"),
                                Text(
                                  "สวัสดีครับพี่น้อง",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 30,
          );
        },
        itemCount: index,
      ),
    );

Widget buildNews(int index) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 200,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      child: Image.asset(
                        'assets/img/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 1000,
                        color: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "สวัสดีครับพี่น้อง",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 30,
            );
          },
          itemCount: index),
    ),
  );
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 120,
                color: const Color.fromARGB(255, 27, 194, 141),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 80,
                      ),
                    ),
                    Text(
                      'สวัสดี, ผู้ใช้งาน',
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 280,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 6,
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "โครงการแนะนำ",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const InkWell(
                            child: Text(
                              "ดูทั้งหมด",
                              style: TextStyle(
                                color: Color.fromARGB(
                                  255,
                                  27,
                                  194,
                                  141,
                                ),
                                decoration: TextDecoration.underline,
                                decorationColor: Color.fromARGB(
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
                    const Divider(
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: buildProject(2),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              buildNews(3)
            ],
          ),
        ),
      ),
    );
  }
}
