import 'package:flutter/material.dart';

class SignUpFormDecorator extends StatelessWidget {
  const SignUpFormDecorator({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          color: Theme.of(context).colorScheme.surface,
          child: Padding(padding: const EdgeInsets.all(16.0), child: child),
        ),
      ),
    );
    return content;
  }
}
