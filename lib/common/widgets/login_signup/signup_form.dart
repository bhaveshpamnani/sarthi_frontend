import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsarthi/navigation.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SSignupForm extends StatefulWidget {
  const SSignupForm({super.key});

  @override
  State<SSignupForm> createState() => _SSignupFormState();
}

class _SSignupFormState extends State<SSignupForm> {
  final _signupFormState = GlobalKey<FormState>();
  bool _isPasswordVisible = false; // Initially hide password
  bool _isTermsAccepted = false; // Initially terms are not accepted

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signupFormState,
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
            controller: _phoneNumberController,
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
                  ? () {
                      if (_signupFormState.currentState!.validate()) {
                        // signUpUser()
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigationMenu(),
                          ),
                        );
                      }
                    }
                  : null, // Disabled when terms are not accepted
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
    );
  }
}
