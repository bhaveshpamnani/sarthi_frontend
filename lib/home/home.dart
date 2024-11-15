import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsarthi/product/popular_products.dart';
import 'package:newsarthi/home/promo_slider.dart';
import 'package:newsarthi/product/product_details/product_detail.dart';

import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../common/widgets/product/product_card/product_card_vertical.dart';
import '../common/widgets/text/section_heading.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';
import 'home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.blue, // Set the exact color you want here
        statusBarIconBrightness: Brightness.light, // Adjust icon brightness as needed
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SPrimaryHeaderContainer(
                child: Column(
                  children: [
                    ///AppBar
                    SHomeAppBar(),
                    SizedBox(
                      height: SSizes.spaceBtwItems,
                    ),
        
                    ///Searchbar
                    SSearchContainer(
                      text: 'Search in Store',
                    ),
                    SizedBox(
                      height: SSizes.spaceBtwSections*2,
                    ),
                  ],
                ),
              ),
        
              ///Body
              Padding(
                padding: const EdgeInsets.all(SSizes.md),
                child: Column(
                  children: [
                    const SPromoSlider(
                      banners: [
                        SImages.banner1,
                        SImages.banner2,
                        SImages.banner3,
                      ],
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwSections,
                    ),
                    SSectionHeading(
                      title: 'Popular Products',
                      showActionButton: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PopularProducts(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwItems,
                    ),
                    SGridLayout(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          print("Navigating to ProductDetail");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ProductDetail(userId: "672f3987c7e2477ab91440b6",productId: "67361a5c08725fd38db61ecb",)),
                          );
                        },
                        child: SProductCardVertical(brand: 'nike',title: "demo",discount: "25",images: [{"url":"assets/images/products/product-image-2.jpg"}],price: "599",),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: NavigationMenu(),
      ),
    );
  }
}
