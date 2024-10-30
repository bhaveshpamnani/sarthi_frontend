import 'package:flutter/material.dart';

class OnBoardingController extends ChangeNotifier {
  late PageController pageController;
  int currentPageIndex = 0;

  OnBoardingController() {
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void updatePageIndicator(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  void dotNavigationClick(int index) {
    currentPageIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  void nextPage(BuildContext context) {
    if (currentPageIndex < 2) {
      int nextPageIndex = currentPageIndex + 1;
      pageController.animateToPage(
        nextPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      updatePageIndicator(nextPageIndex);
    } else {
      // Replace with actual navigation logic
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }

  void skipPage(BuildContext context) {
    if (pageController.hasClients) {
      pageController.jumpToPage(2);
      updatePageIndicator(2);
    }
    // Replace with actual navigation logic
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
  }
}
