import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/login_signup/form_divider.dart';
import '../../../common/widgets/login_signup/signup_form.dart';
import '../../../common/widgets/login_signup/social_button.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              const SSignupForm(),
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

