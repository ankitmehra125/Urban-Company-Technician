import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usc_technician/DashBoard/Home/Tasks/tasks.dart';
import 'package:usc_technician/Profile/myprofile.dart';



import 'Home/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    TaskPage(),
    ChatPage(),
    MyProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/botnavImages/botHomeIcon.svg",
              // color: _selectedIndex == 0 ? Colors.black : null,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/botnavImages/botCalendorIcon.svg",
              color: _selectedIndex == 1 ? Colors.black : null,
            ),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/botnavImages/botChatIcon.svg",
              color: _selectedIndex == 2 ? Colors.black : null,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/botnavImages/botPersonIcon.svg",
              color: _selectedIndex == 3 ? Colors.black : null,
            ),
            label: "Me",
          ),
        ],
      ),
    );
  }
}



class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text("Chat Page"),
      ),
    );
  }
}



