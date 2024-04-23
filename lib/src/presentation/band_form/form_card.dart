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
    var titleStyle = TextStyle(
        fontSize: 32,
        color: Colors.teal.shade900,
        fontWeight: FontWeight.bold,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Band Form', style: titleStyle)
            ),
            const FormContent(),
            const SizedBox(height: 24),
            ElevatedButton(
              style: style,
              onPressed: () {
                if (appState.bandFormKey.currentState!.validate()) {
                  appState.bandFormKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  appState.saveData().whenComplete(() {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Saved'))
                      );
                    }
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