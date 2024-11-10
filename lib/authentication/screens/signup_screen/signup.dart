import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsarthi/Auth/auth_services.dart';

import '../../../common/widgets/login_signup/form_divider.dart';
import '../../../common/widgets/login_signup/social_button.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthService _authService = new AuthService();
  final _signupFormKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false; // Initially hide password
  bool _isTermsAccepted = false;// Initially terms are not accepted
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    if (_signupFormKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Call the signup function
      String result = await _authService.signup(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _phoneController.text.trim(),
        _passwordController.text.trim(),
        context
      );

      setState(() {
        _isLoading = false;
      });

      // Show response message in a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );

      // Navigate to login screen on success
      if (result == 'User signup successfully') {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///title
              Text(
                STexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: SSizes.spaceBtwSections,
              ),

              ///form
              Form(
                key: _signupFormKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: STexts.name,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwInputField,
                    ),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: STexts.email,
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwInputField,
                    ),

                    // Phone Number
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: STexts.phoneNo,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwInputField,
                    ),

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible, // Toggle password visibility
                      decoration: InputDecoration(
                        labelText: STexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? CupertinoIcons.eye_solid
                                : Iconsax.eye_slash,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible =
                              !_isPasswordVisible; // Toggle visibility
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwSections,
                    ),

                    // Term & Conditions Checkbox
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
                        const Text('I agree to the Terms and Conditions'),
                      ],
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwSections,
                    ),

                    // SignUp Button (with conditional color and functionality)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isTermsAccepted
                            ? _signup: null, // Disabled when terms are not accepted
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                          _isTermsAccepted ? Colors.white : Colors.grey.shade600,
                          backgroundColor: _isTermsAccepted
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300, // Text color
                        ),
                        child: const Text(
                          STexts.createAccount,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwSections - 20,
                    ),
                  ],
                ),
              ),
              ///Divider
              SFormDivider(dividerText: STexts.orSingUpWith.capitalize!,),
              const SizedBox(height: SSizes.spaceBtwSections  - 10,),
              ///Social Button
              const SSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}

