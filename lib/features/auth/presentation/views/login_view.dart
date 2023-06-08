import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../auth.dart';
import '../../notifiers/auth_notifier.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authNotifier = context.read<AuthNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text('Welcome Back', style: context.theme.textTheme.headlineLarge),
            const SizedBox(height: 8),
            CustomTextField(label: 'Email', controller: controller),
            const SizedBox(height: 8),
            CustomTextField(label: 'Password', controller: controller),
            const SizedBox(height: 24),
            CustomFilledButton(
              title: 'Login',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text('OR continue with'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata, size: 45),
                ),
              ],
            ),
            CustomRichText(
              questionText: 'New user? ',
              clickableText: 'Create an account',
              onTap: () {
                context.pushReplacement(
                  Provider(
                    create: () => context.read<AuthNotifier>(),
                    child: const SignupView(),
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
