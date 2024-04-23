import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forms_demo/src/domain/band.dart';
import 'package:flutter_forms_demo/src/utils/Utils.dart';

import '../../main.dart';

class RadioExample extends StatelessWidget {
  const RadioExample(this.appState, {super.key});

  final MyFormState appState;

  @override
  Widget build(BuildContext context) {

    const titleStyle = TextStyle(fontSize: 12);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Grammy Recognition', style: titleStyle),
        DynamicRadioGroupFormField(
          initialValue: appState.band.grammyState,
          onSave: (value) {
            appState.band.grammyState = value!;
          },
        ),
      ],
    );
  }
}

class DynamicRadioGroupFormField extends FormField<GrammyState> {
  DynamicRadioGroupFormField({
    super.key,
    FormFieldSetter<GrammyState>? onSave,
    GrammyState? initialValue,
    super.validator,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
    initialValue: initialValue ?? GrammyState.notNominated,
    onSaved: onSave,
    builder: (FormFieldState<GrammyState> field) {
      final List<Widget> radioButtons = [];

      const List<GrammyState> options = GrammyState.values;

      const titleStyle = TextStyle(fontSize: 16);

      for (final option in options) {
        radioButtons.add(
          Row(
            children: [
              Radio<GrammyState>(
                value: option,
                groupValue: field.value,
                onChanged: (GrammyState? value) {
                  field.didChange(value);
                },
              ),
              Text(option.name, style: titleStyle),
            ],
          ),
        );
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: radioButtons,
      );
    },
  );
}