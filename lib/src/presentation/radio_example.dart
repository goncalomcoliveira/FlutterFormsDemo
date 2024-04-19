import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {

  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(fontSize: 16);

    return Row(
      children: <Widget>[
        Radio<SingingCharacter>(
          value: SingingCharacter.lafayette,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        const Text('Lafayette', style: textStyle),
        Radio<SingingCharacter>(
          value: SingingCharacter.jefferson,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        const Text('Thomas Jefferson', style: textStyle),
      ],
    );
  }
}