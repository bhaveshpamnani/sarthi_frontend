import 'package:flutter/material.dart';
import 'package:newsarthi/order/orders_list.dart';

import '../common/widgets/appbar/appbar.dart';
import '../utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text('My Order',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(SSizes.defaultSpace),

        ///Orders
        child: SOrderListItem(),
      ),
    );
  }
}
