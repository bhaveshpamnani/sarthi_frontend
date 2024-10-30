import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsarthi/order/order.dart';
import 'package:newsarthi/profile/address/address.dart';
import 'package:newsarthi/profile/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../authentication/screens/SignIn/login.dart';
import '../common/widgets/appbar/appbar.dart';
import '../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../common/widgets/list_tile/setting_menu_tile.dart';
import '../common/widgets/list_tile/user_profile_tile.dart';
import '../common/widgets/text/section_heading.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate back to the root of the app and then push the login screen
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///---Header
            SPrimaryHeaderContainer(
              child: Column(
                children: [
                  SAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: SColors.white),
                    ),
                  ),

                  ///User Profile Card
                  SUserProfileTile(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            ///--Body
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  ///--Account Setting
                  const SSectionHeading(
                    title: 'Account Setting',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwItems,
                  ),
                  SSettingMenuTile(
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    icon: Iconsax.safe_home,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserAddressScreen(),
                      ),
                    ),
                  ),
                  SSettingMenuTile(
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    icon: Iconsax.shopping_cart,
                    onTap: () {},
                  ),
                  SSettingMenuTile(
                    title: 'My Orders',
                    subTitle: 'In-progress and complete orders',
                    icon: Iconsax.bag_tick,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderScreen(),
                      ),
                    ),
                  ),
                  SSettingMenuTile(
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                    icon: Iconsax.discount_shape,
                    onTap: () {},
                  ),
                  SSettingMenuTile(
                    title: 'Notification',
                    subTitle: 'Set any kind of notification message',
                    icon: Iconsax.notification,
                    onTap: () {},
                  ),
                  ///--LogOut Button
                  const SizedBox(
                    height: SSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _logout(context),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
