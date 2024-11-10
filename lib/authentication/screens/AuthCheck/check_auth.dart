import 'package:flutter/material.dart';
import 'package:newsarthi/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/home.dart';
import '../SignIn/login.dart';
import '../onborading/onboarding_screen.dart';

class CheckAuthScreen extends StatefulWidget {
  @override
  _CheckAuthScreenState createState() => _CheckAuthScreenState();
}

class _CheckAuthScreenState extends State<CheckAuthScreen> {
  bool _isLoggedIn = false;
  bool _onboardingComplete = false;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      _onboardingComplete = prefs.getBool('onboardingComplete') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_onboardingComplete) {
      return const OnBoardingScreen();
    } else if (_isLoggedIn) {
      return const NavigationMenu();
    } else {
      return const LoginScreen();
    }
  }
}