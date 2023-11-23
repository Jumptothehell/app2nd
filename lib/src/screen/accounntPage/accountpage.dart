import 'package:app2nd/src/function.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar("", false),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: buildList(),
      ),
    );
  }

  List<Map<String, String>> nameList = [
    {'Title': 'แก้ไขข้อมูลส่วนตัว', 'Path': '/edit'},
    {'Title': 'ติดต่อเรา', 'Path': '/contact_us'},
    {'Title': 'คำถามที่พบบ่อย', 'Path': '/faq'},
    {'Title': 'ลบบัญชีผู้ใช้', 'Path': '/deleate_account'},
    {'Title': 'ออกจากระบบ', 'Path': '/logout'},
  ];

  ListView buildList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: nameList.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemBuilder: (context, index) {
        String title = nameList[index]['Title'] ?? '';
        String path = nameList[index]['Path'] ?? '';
        return PushScreen(path: path, title: title);
      },
    );
  }
}

class PushScreen extends StatelessWidget {
  const PushScreen({
    super.key,
    required this.path,
    required this.title,
  });

  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    void tapToAnother() {
      if (title == 'ลบบัญชีผู้ใช้') {
        callDialog(context, "คุณต้องการลบบัญชีหรือไม่");
      } else if (title == 'ออกจากระบบ') {
        callDialog(context, "คุณต้องการจากระบบหรือไม่");
      } else {
        Navigator.of(context).pushNamed(path);
      }
    }

    return InkWell(
      onTap: () => tapToAnother(),
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(50.0)),
        child: Padding(
          padding: const EdgeInsets.all(0.1),
          child: ListTile(
            title: Text(title),
            trailing: const Icon(Icons.navigate_next),
          ),
        ),
      ),
    );
  }

  Future<dynamic> callDialog(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          Center(
            child: Column(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/', (Route<dynamic> route) => false);
                      },
                      child: const Text("ใช่"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ไม่"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
