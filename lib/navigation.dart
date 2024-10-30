import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsarthi/home/home.dart';
import 'package:newsarthi/profile/setting.dart';
import 'package:newsarthi/store/store.dart';
import 'package:newsarthi/utils/constants/colors.dart';
import 'package:newsarthi/utils/helpers/helper_functions.dart';
import 'package:newsarthi/wishlist/wishlist.dart';

// Main screen with navigation menu
class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Store(),
    const WishList(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: dark ? SColors.black : Colors.white,
        indicatorColor: dark ? SColors.white.withOpacity(0.2) : SColors.black.withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}

