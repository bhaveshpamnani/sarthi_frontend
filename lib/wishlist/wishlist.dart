import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsarthi/common/widgets/appbar/appbar.dart';
import 'package:newsarthi/navigation.dart';

import '../common/widgets/layouts/grid_layout.dart';
import '../common/widgets/product/product_card/product_card_vertical.dart';
import '../utils/constants/sizes.dart';
import '../utils/helpers/helper_functions.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Container(
      color: Colors.black38,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SAppBar(
                  showBackArrow: false,
                  title: Text(
                    "WishList",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Navigation(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.plus,
                          color: dark?Colors.white:Colors.black,
                          size: SSizes.xl - 5,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(SSizes.defaultSpace),
                  child: Column(
                    children: [
                      SGridLayout(
                        itemCount: 6,
                        itemBuilder: (_, index) => const SProductCardVertical(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
