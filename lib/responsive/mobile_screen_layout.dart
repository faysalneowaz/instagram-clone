import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/provider/user_provider.dart';
import 'package:instagramclone/utils/allexports.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChnaged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChnaged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              label: '',
              icon: Icon(
                Icons.home,
                color: _page == 0 ? primaryColor : secondaryColor,
              )),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              label: '',
              icon: Icon(
                Icons.search,
                color: _page == 1 ? primaryColor : secondaryColor,
              )),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              label: '',
              icon: Icon(
                Icons.add_circle,
                color: _page == 2 ? primaryColor : secondaryColor,
              )),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              label: '',
              icon: Icon(
                Icons.favorite,
                color: _page == 3 ? primaryColor : secondaryColor,
              )),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              label: '',
              icon: Icon(
                Icons.person,
                color: _page == 4 ? primaryColor : secondaryColor,
              )),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}