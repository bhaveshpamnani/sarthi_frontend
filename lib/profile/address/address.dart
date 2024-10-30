
import 'package:flutter/material.dart';
import 'package:newsarthi/profile/address/add_new_address.dart';
import 'package:newsarthi/profile/address/single_address.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>const AddNewAddressScreen(),),),
        backgroundColor: SColors.primaryColor,
        child: const Icon(
          Icons.add,
          color: SColors.white,
        ),
      ),
      appBar: SAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            SSizes.defaultSpace,
          ),
          child: Column(
            children: [
              SSingleAddress(selectedAddress: true),
              SSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
