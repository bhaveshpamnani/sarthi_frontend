import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsarthi/home/home.dart';
import 'package:newsarthi/profile/setting.dart';
import 'package:newsarthi/store/store.dart';
import 'package:newsarthi/wishlist/wishlist.dart';
import 'package:flutter/cupertino.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _Navigation();
}

class _Navigation extends State<Navigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Store(),
    const WishList(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        animationDuration: Duration(milliseconds: 500),
        selectedIndex: _selectedIndex,
        iconSize: 23,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Image.asset(
              "assets/icons/navigation/home.png",
              color: Color(0xff9496c1),
              width: 30,
            ),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Iconsax.category),
            title: Text('Category'),
          ),
          FlashyTabBarItem(
            icon: Icon(Iconsax.like_1),
            title: Text('WishList'),
          ),
          FlashyTabBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}


