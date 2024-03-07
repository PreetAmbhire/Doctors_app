import 'package:doctors/Utils/app_colors.dart';
import 'package:doctors/Views/Chat/chat_screen.dart';
import 'package:doctors/Views/Labs/labs.dart';
import 'package:doctors/Views/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigateBar extends StatefulWidget {
  const NavigateBar({super.key});

  @override
  State<NavigateBar> createState() => _NavigateBarState();
}

class _NavigateBarState extends State<NavigateBar> {
  int currentPage = 0;

  List<Widget> widgetList = const [
    LandingPage(),
    Labs(),
    Text("data3"),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          showUnselectedLabels: true,
          selectedItemColor: AppColors.selectedIcon,
          unselectedItemColor: AppColors.unselectedIcon,
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.microscope), label: 'Labs'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.cartShopping), label: 'Store'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.comments), label: 'Chats'),
          ]),
    );
  }
}
