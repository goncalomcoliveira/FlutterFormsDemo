import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_forms_demo/src/presentation/radio_example.dart';

import '../../../main.dart';
import '../checkbox_example.dart';

class FormContent extends StatelessWidget {
  const FormContent({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyFormState>();

    return Expanded(
      child: Form(
        key: appState.bandFormKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: appState.name,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Band Name',
                      labelText: 'Name *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      appState.name = value!;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RadioExample(),
              ],
            ),

            const SizedBox(height: 24),

            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CheckboxExample(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}