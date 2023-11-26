import 'package:app2nd/src/screen/accountPage/accountpage.dart';
import 'package:app2nd/src/screen/history.dart';
import 'package:app2nd/src/screen/inprogress.dart';
import 'package:app2nd/src/screen/mainhome.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    MainHomePage(),
    InProgressScreen(),
    HistoryScreen(),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // ดึงค่า argument ที่ส่งมาจาก Navigator
    final int? selectedTabIndex =
        ModalRoute.of(context)?.settings.arguments as int?;
    if (selectedTabIndex != null) {
      setState(() {
        _selectIndex = selectedTabIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 27, 194, 141),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "หน้าหลัก",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "กำลังดำเนินกา",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "ประวัติ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "บัญชี",
          )
        ],
        currentIndex: _selectIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
