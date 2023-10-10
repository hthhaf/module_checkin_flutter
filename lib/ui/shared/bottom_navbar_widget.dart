// import 'package:flutter_check_in_app/ui/screens/check-in/info/info_screen.dart';
import 'package:flutter_check_in_app/ui/shared/home_appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../ulitites/colors.dart';
import '../screens/checkin/search/search_screen.dart.dart';
import '../screens/home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    Container(),
    const SearchScreen(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            backgroundColor: priBlue,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: yellow,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(
              color: yellow,
            ),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Trang chủ",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_airport),
                label: "Vé của tôi",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_number),
                label: "Làm thủ tục",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.widgets),
                label: "Khác",
              )
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          )),
    );
  }
}
