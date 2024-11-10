import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsarthi/authentication/screens/password_confi/forgot_password.dart';
import 'package:newsarthi/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Auth/auth_services.dart';
import '../../../common/styles/spaacing_styles.dart';
import '../../../common/widgets/login_signup/form_divider.dart';
import '../../../common/widgets/login_signup/social_button.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../signup_screen/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isTermsAccepted = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const NavigationMenu()));
  }

  void signInUser() {
    if (_signInFormKey.currentState!.validate()) {
      authService.signInUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
      _loginUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(dark ? SImages.lightAppLogo : SImages.darkAppLogo),
                  ),
                  Text(
                    STexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: SSizes.sm),
                  Text(
                    STexts.loginSubTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              Form(
                key: _signInFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: SSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: STexts.email,
                        ),
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: SSizes.spaceBtwInputField),
                      TextFormField(
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? CupertinoIcons.eye_solid : Iconsax.eye_slash,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          labelText: STexts.password,
                        ),
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: SSizes.spaceBtwInputField / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _isTermsAccepted,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isTermsAccepted = value ?? false;
                                  });
                                },
                              ),
                              const Text(STexts.rememberMe),
                            ],
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ForgotPassword()),
                            ),
                            child: const Text(STexts.forgotPassword),
                          ),
                        ],
                      ),
                      const SizedBox(height: SSizes.spaceBtwSections),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: signInUser,
                          child: const Text(STexts.signIn),
                        ),
                      ),
                      const SizedBox(height: SSizes.spaceBtwItems),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignupScreen()),
                          ),
                          child: const Text(STexts.createAccount),
                        ),
                      ),
                      const SizedBox(height: SSizes.spaceBtwSections - 20),
                    ],
                  ),
                ),
              ),
              SFormDivider(dividerText: STexts.orSingInWith.capitalize!),
              const SizedBox(height: SSizes.spaceBtwSections - 10),
              const SSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
