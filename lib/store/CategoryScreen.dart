import 'package:flutter/material.dart';

import '../common/widgets/custom_shapes/container/search_container.dart';
import '../common/widgets/product/cart/cart_menu_icon.dart';
import '../implemention/category_service.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../utils/helpers/helper_functions.dart';
import 'category_tab.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryService _categoryService = CategoryService();
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories = await _categoryService.fetchCategories();
      setState(() {
        categories = fetchedCategories;
      });
      print(categories);
    } catch (error) {
      print("Error fetching categories: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);

    return Container(
      color: Colors.black38,
      child: SafeArea(
        child: DefaultTabController(
          length: categories.length,
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
                      child: const SSearchContainer(
                        text: 'Search in Category',
                        showBorder: true,
                        shoeBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    bottom: TabBar(
                      tabs: categories
                          .map((category) => Tab(child: Text(category['name'])))
                          .toList(),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: categories.map((category) {
                  return SCategoryTab(categoryId: category['_id']);
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
