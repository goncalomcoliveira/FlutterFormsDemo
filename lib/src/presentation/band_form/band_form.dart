import 'package:flutter/material.dart';
import 'form_card.dart';

class BandForm extends StatelessWidget {
  const BandForm({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: Colors.white,
    );

    return FormCard(style: style);
  }
}