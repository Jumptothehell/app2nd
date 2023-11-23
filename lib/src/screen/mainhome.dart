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
              child: const Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 160,
                    )
                  ],
                ),
                // decorationClipBehavior = Clip.antiAliasWithSaveLayer,
                // shape = const RoundedRectangleBorder(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(20),
                //   ),
                // ),
                // elevation = 8,
                // child = Column(
                //   children: [
                //     SizedBox(
                //       height: 160,
                //       child: Image.asset(
                //         'assets/img/logo.png',
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //     Expanded(
                //       child: Center(
                //         child: Container(
                //           color: Colors.white,
                //           width: 250,
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: Column(
                //               children: [
                //                 const Text("Name"),
                //                 Text(
                //                   "สวัสดีครับพี่น้อง",
                //                   style: Theme.of(context).textTheme.bodySmall,
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
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
// import 'package:flutter/material.dart';
// // import 'package:app2nd/model/profile.dart';

// import 'package:http/http.dart' as http;
// import 'dart:io' show Platform;
// import 'dart:convert';

// // import 'package:image_picker/image_picker.dart';

// // late Future serverResponse;
// // String _localhost() {
// //   //ไว้เชื่อมhttp localhost
// //   if (Platform.isAndroid) {
// //     return 'http://10.0.2.2:3000';
// //   } else {
// //     // for iOS simulator
// //     return 'http://localhost:3000';
// //   }
// // }

// class MainHomePage extends StatefulWidget {
//   const MainHomePage({super.key});

//   @override
//   State<MainHomePage> createState() => _MainHomePageState();
// }

// class Project {
//   int? id;
//   String? projectImg;
//   String? projectName;
//   String? projectDatail;
//   Project({
//     this.id,
//     this.projectImg,
//     this.projectName,
//     this.projectDatail,
//   });
// }

// String? _localhost() {
//   if (Platform.isAndroid) {
//     return 'http://10.0.2.2:3000'; //return something but i dont know. In video 18.26
//   } else {
//     return 'http://localhost:3000';
//   }
// }
// // class Item{
// //   final String? img;
// //   final String? projectname;
// //   final String? projectdetail;

// // Item({
// //   this.img,
// //   this.projectname,
// //   this.projectdetail,
// // });
// // }

// //  Future<List<Item>> showData() async{
// //     final response =await http.get(Uri.parse(_localhost()+ "/showData"));
// //     var responseData= jsonDecode(response.body);

// //     List<Item> items = [];
// //     responseData.forEach((index,value){
// //       Item item= Item(
// //         img: value["img"],
// //         projectname: value["projectname"],
// //         projectdetail: value["projectdetail"],
// //       );
// //       items.add(item);
// //     });
// //     return items;
// //   }
// @override
// Widget buildProject(int index) => Padding(
//       padding: const EdgeInsets.only(
//         left: 20,
//         right: 20,
//       ),
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return SizedBox(
//             width: 250,
//             child: GestureDetector(
//               onTap: () => Navigator.pushNamed(context, '/project'),
//               child: Card(
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(20),
//                   ),
//                 ),
//                 elevation: 8,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 160,
//                       child: Image.asset(
//                         'assets/img/logo.png',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Expanded(
//                       child: Center(
//                         child: Container(
//                           color: Colors.white,
//                           width: 250,
//                           child: Padding(
//                             padding: const EdgeInsets.all(10),
//                             child: Column(
//                               children: [
//                                 const Text("Name"),
//                                 Text(
//                                   "สวัสดีครับพี่น้อง",
//                                   style: Theme.of(context).textTheme.bodySmall,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return const SizedBox(
//             width: 30,
//           );
//         },
//         itemCount: index,
//       ),
//     );

// Widget buildNews(int index) {
//   return Padding(
//     padding: const EdgeInsets.all(20),
//     child: SingleChildScrollView(
//       child: ListView.separated(
//           shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             return SizedBox(
//               height: 200,
//               child: Card(
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 elevation: 8,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 150,
//                       child: Image.asset(
//                         'assets/img/logo.png',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         width: 1000,
//                         color: Colors.white,
//                         child: const Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Text(
//                             "สวัสดีครับพี่น้อง",
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//           separatorBuilder: (context, index) {
//             return const SizedBox(
//               height: 30,
//             );
//           },
//           itemCount: index),
//     ),
//   );
// }

// class _MainHomePageState extends State<MainHomePage> {
//   // final ImagePicker _imagePicker = ImagePicker(); //ดึงรูปจากเครื่อง
//   // late PickedFile _pickedFile; // ใช้ late เพื่อระบุว่าจะกำหนดค่าทีหลัง

//   @override
//   void initState() {
//     super.initState();
//     // _pickedFile = PickedFile(""); // กำหนดค่าเริ่มต้นใน initState
//   }

//   // Future<void> _pickImage() async {
//   //   XFile? xFile = await _imagePicker.pickImage(source: ImageSource.gallery);

//   //   if (xFile != null) {
//   //     // ถ้า xFile ไม่เป็น null, ก็ทำการแปลงเป็น PickedFile
//   //     // _pickedFile = PickedFile(xFile.path);
//   //   }

//   //   setState(() {
//   //     // กำหนดค่าให้ _pickedFile
//   //   });
//   // }
//   Future? serverResponse;
//   @override
//   Widget build(BuildContext context) {
//     Future<List<Project>> showData() async {
//       final response = await http.get(Uri.parse("${_localhost()}/showData"));
//       var responseData = json.decode(response.body);

//       List<Project> projects = [];
//       responseData.forEaach((index, value) {
//         Project project = Project(
//           id: value["id"],
//           projectImg: value["projectImg"],
//           projectName: value["projectName"],
//           projectDatail: value["projectDatail"],
//         );
//         projects.add(project);
//       });
//       return projects;
//     }

//     setState(() {
//       //if connect pls remove // out.
//       serverResponse = showData();
//     });

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               Container(
//                 height: 120,
//                 color: const Color.fromARGB(255, 27, 194, 141),
//                 child: const Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.account_circle_outlined,
//                         size: 80,
//                       ),
//                     ),
//                     // Text(
//                     //   'สวัสดี, ' + Profile.username,
//                     //   style: Theme.of(context).textTheme.titleLarge,
//                     // )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 280,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 6,
//                         left: 10,
//                         right: 10,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "โครงการแนะนำ",
//                             style: Theme.of(context).textTheme.titleMedium,
//                           ),
//                           const InkWell(
//                             child: Text(
//                               "ดูทั้งหมด",
//                               style: TextStyle(
//                                 color: Color.fromARGB(
//                                   255,
//                                   27,
//                                   194,
//                                   141,
//                                 ),
//                                 decoration: TextDecoration.underline,
//                                 decorationColor: Color.fromARGB(
//                                   255,
//                                   27,
//                                   194,
//                                   141,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       color: Colors.grey,
//                     ),
//                     FutureBuilder(
//                       future: serverResponse,
//                       builder: (BuildContext context, AsyncSnapshot snapshot) {
//                         return Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20),
//                             child: ListView.builder(
//                               itemCount: 2,
// // itemCount: snapshot.data.length,
//                               shrinkWrap: true,
//                               itemBuilder: ((context, index) {
//                                 return SizedBox(
//                                   // width: 250,
//                                   child: GestureDetector(
//                                       // onTap: () async => Navigator.pushNamed(
//                                       //     context, "/project"),
//                                       // child: Card(
//                                       //   clipBehavior: Clip.antiAliasWithSaveLayer,
//                                       //   shape: const RoundedRectangleBorder(
//                                       //     borderRadius: BorderRadius.all(
//                                       //       Radius.circular(20),
//                                       //     ),
//                                       //   ),
//                                       //   elevation: 8,
//                                       //   child: Column(
//                                       //     children: [
//                                       //       SizedBox(
//                                       //         height: 160,
//                                       //         // String? imgProject
//                                       //         child: Image.asset(
//                                       //           "assets/img/logo.png",
//                                       //           fit: BoxFit.cover,
//                                       //         ),
//                                       //       ),
//                                       //       Expanded(
//                                       //         child: Center(
//                                       //           child: Container(
//                                       //             color: Colors.white,
//                                       //             width: 250,
//                                       //             child: Padding(
//                                       //               padding:
//                                       //                   const EdgeInsets.all(10),
//                                       //               child: Column(
//                                       //                 // String? nameProject
//                                       //                 children: [
//                                       //                   const Text("Name"),
//                                       //                   Text(
//                                       //                     "สวัสดีครับ",
//                                       //                     style: Theme.of(context)
//                                       //                         .textTheme
//                                       //                         .bodySmall,
//                                       //                   )
//                                       //                 ],
//                                       //               ),
//                                       //             ),
//                                       //           ),
//                                       //         ),
//                                       //       )
//                                       //     ],
//                                       //   ),
//                                       // ),
//                                       ),
//                                 );
//                               }),
//                             ),
//                           ),
//                         );
// //                         if (snapshot.data != null) {
// //                           return const Expanded(
// //                             child: Center(
// //                               child: Text("No data"),
// //                             ),
// //                           );
// //                         } else {
// //                           return Expanded(
// //                             child: Padding(
// //                               padding:
// //                                   const EdgeInsets.only(left: 20, right: 20),
// //                               child: ListView.builder(
// //                                 itemCount: 2,
// // // itemCount: snapshot.data.length,
// //                                 shrinkWrap: true,
// //                                 itemBuilder: ((context, index) {
// //                                   return SizedBox(
// //                                     width: 250,
// //                                     child: GestureDetector(
// //                                       child: Container(
// //                                         color: Colors.red,
// //                                         height: 20,
// //                                         width: 400,
// //                                       ),
// //                                       // onTap: () async => Navigator.pushNamed(
// //                                       //     context, "/project"),
// //                                       // child: const Card(
// //                                       //   clipBehavior:
// //                                       //       Clip.antiAliasWithSaveLayer,
// //                                       //   shape: RoundedRectangleBorder(
// //                                       //     borderRadius: BorderRadius.all(
// //                                       //       Radius.circular(20),
// //                                       //     ),
// //                                       //   ),
// //                                       //   elevation: 8,
// //                                       //   // child: Column(
// //                                       //   //   children: [
// //                                       //   //     SizedBox(
// //                                       //   //       height: 160,
// //                                       //   //       // String? imgProject
// //                                       //   //       child: Image.asset(
// //                                       //   //         "assets/img/logo.png",
// //                                       //   //         fit: BoxFit.cover,
// //                                       //   //       ),
// //                                       //   //     ),
// //                                       //   //     Expanded(
// //                                       //   //         child: Center(
// //                                       //   //       child: Container(
// //                                       //   //         color: Colors.white,
// //                                       //   //         width: 250,
// //                                       //   //         child: Padding(
// //                                       //   //           padding:
// //                                       //   //               const EdgeInsets.all(10),
// //                                       //   //           child: Column(
// //                                       //   //             // String? nameProject
// //                                       //   //             children: [
// //                                       //   //               const Text("Name"),
// //                                       //   //               Text(
// //                                       //   //                 "สวัสดีครับ",
// //                                       //   //                 style: Theme.of(context)
// //                                       //   //                     .textTheme
// //                                       //   //                     .bodySmall,
// //                                       //   //               )
// //                                       //   //             ],
// //                                       //   //           ),
// //                                       //   //         ),
// //                                       //   //       ),
// //                                       //   //     ))
// //                                       //   //   ],
// //                                       //   // ),
// //                                       // ),
// //                                     ),
// //                                   );
// //                                 }),
// //                               ),
// //                             ),
// //                           );
// //                         }
//                       },
//                     )
//                     // FutureBuilder(
//                     //     future: serverResponse,
//                     //     builder: ((context, snapshot) {
//                     //       if (snapshot.data == null) {
//                     //         return const Center(
//                     //           child: Text("No Data"),
//                     //         );
//                     //       } else {
//                     //         return Padding(
//                     //           padding:
//                     //               const EdgeInsets.only(left: 20, right: 20),
//                     //           child: ListView.separated(
//                     //             itemCount: 2,
//                     //             scrollDirection: Axis.horizontal,
//                     //             itemBuilder: (context, index) {
//                     //               return SizedBox(
//                     //                 width: 250,
//                     //                 child: GestureDetector(
//                     //                   onTap: () => Navigator.pushNamed(
//                     //                       context, '/project'),
//                     //                   child: Card(
//                     //                     clipBehavior:
//                     //                         Clip.antiAliasWithSaveLayer,
//                     //                     shape: const RoundedRectangleBorder(
//                     //                       borderRadius: BorderRadius.all(
//                     //                         Radius.circular(20),
//                     //                       ),
//                     //                     ),
//                     //                     elevation: 8,
//                     //                     child: Column(
//                     //                       children: [
//                     //                         SizedBox(
//                     //                           height: 160,
//                     //                           child: Image.asset(
//                     //                             'assets/img/logo.png',
//                     //                             fit: BoxFit.cover,
//                     //                           ),
//                     //                         ),
//                     //                         Expanded(
//                     //                           child: Center(
//                     //                             child: Container(
//                     //                               color: Colors.white,
//                     //                               width: 250,
//                     //                               child: Padding(
//                     //                                 padding:
//                     //                                     const EdgeInsets.all(
//                     //                                         10),
//                     //                                 child: Column(
//                     //                                   children: [
//                     //                                     const Text("Name"),
//                     //                                     Text(
//                     //                                       "สวัสดีครับพี่น้อง",
//                     //                                       style:
//                     //                                           Theme.of(context)
//                     //                                               .textTheme
//                     //                                               .bodySmall,
//                     //                                     )
//                     //                                   ],
//                     //                                 ),
//                     //                               ),
//                     //                             ),
//                     //                           ),
//                     //                         )
//                     //                       ],
//                     //                     ),
//                     //                   ),
//                     //                 ),
//                     //               );
//                     //             },
//                     //             separatorBuilder: (context, index) {
//                     //               return const SizedBox(
//                     //                 height: 30,
//                     //               );
//                     //             },
//                     //           ),
//                     //         );
//                     //       }
//                     //     }))
//                   ],
//                 ),
//               ),
//               const Divider(
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
