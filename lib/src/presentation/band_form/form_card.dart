import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import 'form_content.dart';

class FormCard extends StatelessWidget {
  const FormCard({
    super.key,
    required this.style,
  });

  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyFormState>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            const FormContent(),
            ElevatedButton(
              style: style,
              onPressed: () {
                if (appState.bandFormKey.currentState!.validate()) {
                  appState.bandFormKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}