import 'package:flutter/material.dart';
import 'package:form_with_validation/modules/contact_us/view/contact_us.dart';
import 'package:form_with_validation/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          titleWidget: Text(
            'Enter',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ContactUsScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
