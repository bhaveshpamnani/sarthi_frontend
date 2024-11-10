import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsarthi/utils/constants/image_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../SignIn/login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _updatePageIndicator(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _dotNavigationClick(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.jumpToPage(index);
  }


// Navigate to LoginScreen after onboarding and set a flag in SharedPreferences
  void _nextPage(BuildContext context) async {
    if (_currentPageIndex < 2) {
      int nextPageIndex = _currentPageIndex + 1;
      _pageController.animateToPage(
        nextPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _updatePageIndicator(nextPageIndex);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboardingComplete', true); // Set onboarding as complete
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }

  void _skipPage(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true); // Set onboarding as complete
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: SImages.onBoardingImage1,
                title: STexts.onBoardingTitle1,
                subtitle: STexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: SImages.onBoardingImage2,
                title: STexts.onBoardingTitle2,
                subtitle: STexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: SImages.onBoardingImage3,
                title: STexts.onBoardingTitle3,
                subtitle: STexts.onBoardingSubTitle3,
              ),
            ],
          ),
          _buildSkipButton(context),
          _buildDotNavigation(context),
          _buildNextButton(context),
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Positioned(
      right: SSizes.defaultSpace,
      bottom: SDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => _nextPage(context),
        style: ElevatedButton.styleFrom(

          shape: const CircleBorder(),
          backgroundColor: dark ? SColors.primaryColor : Colors.black,
        ),
        child: const Icon(CupertinoIcons.right_chevron),
      ),
    );
  }

  Widget _buildDotNavigation(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Positioned(
      bottom: SDeviceUtils.getBottomNavigationBarHeight() + 15,
      left: SSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? SColors.light : SColors.dark,
          dotHeight: 6,
        ),
        controller: _pageController,
        onDotClicked: _dotNavigationClick,
        count: 3,
      ),
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return Positioned(
      top: SDeviceUtils.getAppBarHeight(),
      right: SSizes.defaultSpace,
      child: TextButton(
        onPressed: () => _skipPage(context),
        child: const Text('Skip'),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: screenWidth * 0.8,
            height: screenHeight * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
