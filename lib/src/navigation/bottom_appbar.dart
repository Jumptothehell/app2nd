import 'package:app2nd/src/screen/accountPage/accountpage.dart';
import 'package:app2nd/src/screen/mainhome.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOption = <Widget>[
    MainHomePage(),
    Text(
      'Index 1: กำลังดำเนินการ',
      style: optionStyle,
    ),
    Text(
      'Index 2: ประวัติ',
      style: optionStyle,
    ),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
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
