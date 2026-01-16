import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  const TileCard({super.key, required this.child, this.width});

  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(padding: const EdgeInsets.all(4.0), child: child),
      ),
    );
  }
}
