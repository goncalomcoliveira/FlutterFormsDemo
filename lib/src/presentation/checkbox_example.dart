import 'package:flutter/material.dart';

import '../../main.dart';

class CheckboxExample extends StatelessWidget {
  const CheckboxExample(this.appState, {super.key});

  final MyFormState appState;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);

    return Row(
      children: [
        CheckboxFormField(
          initialValue: appState.band.isActive,
          onSaved: (value) {
            appState.band.isActive = value!;
          },
        ),
        const Text('Is Active', style: textStyle),
      ],
    );
  }
}

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
      {super.key,
      super.onSaved,
      super.validator,
      bool super.initialValue = false,
      bool autovalidate = false})
      : super(builder: (FormFieldState<bool> state) {
          return Checkbox(
            value: state.value,
            onChanged: state.didChange,
          );
        });
}
