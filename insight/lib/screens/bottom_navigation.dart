import 'package:flutter/material.dart';
import 'package:insight/screens/outer_screens.dart/add_pitch.dart';
import 'package:insight/screens/outer_screens.dart/chats_screen.dart';
import 'package:insight/screens/inner_screens.dart/message_screen.dart';
import 'package:insight/screens/outer_screens.dart/pitches_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'outer_screens.dart/home_screen.dart';
import 'outer_screens.dart/profile_screen.dart';

class NavigationScreen extends StatefulWidget {
  static const routeName = '/bottom-nav';
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> pages = [
    const HomeScreen(),
    const PitchesScreen(),
    const AddPitchScreen(),
    const ChatsScreen(),
    const ProfileScreen()
  ];
  int currentPageIndex = 0;
  void togglePage(int page) {
    if (page == 2) {
      showCupertinoModalBottomSheet(
        context: context,
        builder: (context) => const AddPitchScreen(),
      );
    } else {
      setState(() {
        currentPageIndex = page;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      //backgroundColor: theme.scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPageIndex,
          onTap: (val) => togglePage(val),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/home.png',
                color: currentPageIndex == 0
                    ? Colors.blue
                    : const Color(0xffD6DBDE),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/pitches.png',
                color: currentPageIndex == 1
                    ? Colors.blue
                    : const Color(0xffD6DBDE),
              ),
              label: 'Pitches',
            ),
            const BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 27,
                child: Icon(
                  Icons.add,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/chat.png',
                color: currentPageIndex == 3
                    ? Colors.blue
                    : const Color(0xffD6DBDE),
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile.png',
                color: currentPageIndex == 4
                    ? Colors.blue
                    : const Color(0xffD6DBDE),
              ),
              label: 'Profile',
            ),
          ]),
      //backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: IndexedStack(
          index: currentPageIndex,
          children: pages,
        ),
      ),
    );
  }
}
