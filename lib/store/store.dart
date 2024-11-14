import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsarthi/store/category_tab.dart';
import '../common/widgets/appbar/tabbar.dart';
import '../common/widgets/custom_shapes/container/search_container.dart';
import '../common/widgets/product/cart/cart_menu_icon.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../utils/helpers/helper_functions.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);

    return Container(
      color: Colors.black38,
      child: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: dark ? SColors.black : SColors.white,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Category",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SCartCounter(iconColor: SColors.black),
                ),
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    floating: true,
                    backgroundColor: dark ? SColors.black : SColors.white,
                    expandedHeight: 150,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(SSizes.defaultSpace),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          const SSearchContainer(
                            text: 'Search in Category',
                            showBorder: true,
                            shoeBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(
                            height: SSizes.spaceBtwSections,
                          ),
                        ],
                      ),
                    ),
                    bottom: const STabBar(
                      tabs: [
                        Tab(child: Text('Sports')),
                        Tab(child: Text('Furniture')),
                        Tab(child: Text('Electronic')),
                        Tab(child: Text('Cloths')),
                        Tab(child: Text('Cosmetics')),
                      ],
                    ),
                  ),
                ];
              },
              body: const TabBarView(
                children: [
                  SCategoryTab(),
                  SCategoryTab(),
                  SCategoryTab(),
                  SCategoryTab(),
                  SCategoryTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
