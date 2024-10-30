import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsarthi/authentication/screens/password_confi/reset_password.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Heading
            Text(
              STexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: SSizes.spaceBtwItems,
            ),
            Text(
              STexts.forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: SSizes.spaceBtwSections * 2,
            ),

            ///TextField
            TextFormField(
              decoration: const InputDecoration(
                labelText: STexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(
              height: SSizes.spaceBtwSections ,
            ),
            ///Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>const ResetPassword())),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
