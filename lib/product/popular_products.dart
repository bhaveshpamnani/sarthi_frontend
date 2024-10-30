import 'package:flutter/material.dart';

import '../../../../common/widgets/product/sortable/sortable_product.dart';
import '../common/widgets/appbar/appbar.dart';
import '../utils/constants/sizes.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SAppBar(
        title: Text(
          'Popular Products',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            SSizes.defaultSpace,
          ),
          child: SSortableProduct(),
        ),
      ),
    );
  }
}


