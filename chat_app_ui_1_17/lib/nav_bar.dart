import 'package:chat_app_ui_1_17/chat_view.dart';
import 'package:chat_app_ui_1_17/colors.dart';
import 'package:chat_app_ui_1_17/profile_view.dart';
import 'package:chat_app_ui_1_17/search_view.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  List<Widget> views = [
    ChatView(),
    const SearchView(),
    const SearchView(),
    const SearchView(),
    const ProfileView(),
  ];

  int curruntPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[curruntPage],
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: AppColors.greyColor.withOpacity(.2),
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.blackColor,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          currentIndex: curruntPage,
          onTap: (value) {
            setState(() {
              curruntPage = value;
            });
          },
          items: [
            SalomonBottomBarItem(
                icon: const Icon(Icons.home), title: const Text('Home')),
            SalomonBottomBarItem(
                icon: const Icon(Icons.search), title: const Text('Search')),
            SalomonBottomBarItem(
                icon: const Icon(Icons.notification_add),
                title: const Text('Notification')),
            SalomonBottomBarItem(
                icon: const Icon(Icons.person), title: const Text('Profile')),
          ]),
    );
  }
}
