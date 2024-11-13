import 'package:flutter/material.dart';
import 'package:newsarthi/profile/address/address.dart';
import 'package:newsarthi/profile/profile/profile_menu.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/image/circular_image.dart';
import '../../common/widgets/text/section_heading.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../address/single_address.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              ///--Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SCircularImage(
                      image: SImages.user,
                      width: 80,
                      backgroundColor: SColors.grey,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              const Divider(),
              ///--Personal Information
              const SSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
              SProfileMenu( onPressed: () {}, title: 'Name', value: 'Mukesh Pamnani',),
              SProfileMenu( onPressed: () {}, title: 'E-Mail', value: 'mukesh@gamil.com',),
              SProfileMenu( onPressed: () {}, title: 'Phone Number', value: '6353522205',),
              const Divider(),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),

            ],
          ),
        ),
      ),
    );
  }
}


