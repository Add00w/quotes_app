import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../notifiers/notifiers.dart';

class CreateQuoteView extends StatefulWidget {
  const CreateQuoteView({super.key});

  @override
  State<CreateQuoteView> createState() => _CreateQuoteViewState();
}

class _CreateQuoteViewState extends State<CreateQuoteView> {
  late final quoteController = TextEditingController();
  late final autherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final quotesNotifier = context.read<QuotesNotifier>();

    return Scaffold(
      appBar: AppBar(title: const Text('Create quote')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CustomTextField(
              controller: quoteController,
              label: 'Quote',
              minLines: 1,
              maxLines: 4,
              maxLength: 200,
            ),
            const SizedBox(height: 8),
            CustomTextField(controller: autherController, label: 'Auther'),
            const SizedBox(height: 24),
            ValueListenableBuilder(
              valueListenable: loadingProvider,
              builder: (context, loading, child) {
                return loading ? const LoadingWidget() : child!;
              },
              child: CustomFilledButton(
                title: 'Save Quote',
                onTap: () {
                  quotesNotifier.create(
                    body: quoteController.text,
                    auther: 'Addow',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    quoteController.dispose();
    autherController.dispose();
    super.dispose();
  }
}
