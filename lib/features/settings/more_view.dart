import 'package:flutter/material.dart';

import '../auth/auth.dart';
import '../../core/core.dart';
import '../auth/notifiers/auth_notifier.dart';
import '../quotes/quotes.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More menu')),
      body: Column(
        children: [
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.person_3_outlined),
            title: const Text('Profile'),
            onTap: () {
              context.push(const LoginView());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: const Text('Favorites'),
            onTap: () {
              context.push(
                Provider(
                  create: () => QuotesNotifier()..getQuotes('/favs'),
                  child: const FavoriteQuotesView(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              context.push(
                Provider(
                  create: () => AuthNotifier(),
                  child: const LoginView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
