import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../auth.dart';
import '../../notifiers/auth_notifier.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(label: 'Username', controller: controller),
            const SizedBox(height: 8),
            CustomTextField(label: 'Email', controller: controller),
            const SizedBox(height: 8),
            CustomTextField(label: 'Password', controller: controller),
            const SizedBox(height: 8),
            CustomTextField(label: 'Repeat Password', controller: controller),
            const SizedBox(height: 24),
            CustomFilledButton(
              title: 'Signup',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            CustomRichText(
              questionText: 'Already have an account? ',
              clickableText: 'Login',
              onTap: () {
                context.pushReplacement(
                  Provider(
                    create: () => context.read<AuthNotifier>(),
                    child: const LoginView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
