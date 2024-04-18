import 'package:flutter/material.dart';

void main() {
  runApp(const MyFormApp());
}

class MyFormApp extends StatelessWidget {
  const MyFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Padding(
          padding: EdgeInsets.all(60.0),
          child: CustomForm(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.title});
  final String title;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: Colors.white,
    );

    return FormCard(formKey: _formKey, style: style);
  }
}

class FormCard extends StatelessWidget {
  const FormCard({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.style,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            FormList(formKey: _formKey),
            ElevatedButton(
              style: style,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
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

class FormList extends StatelessWidget {
  const FormList({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Label',
                      labelText: 'Label *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(width: 24),

                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Label',
                      labelText: 'Label *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Label',
                      labelText: 'Label *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(width: 24),

                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Label',
                      labelText: 'Label *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(width: 24),

                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Label',
                      labelText: 'Label *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const RadioExample(),

                const SizedBox(width: 24),

                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Label',
                      labelText: 'Label *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Label',
                      labelText: 'Label *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(width: 24),

                const CheckboxExample(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



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



class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(fontSize: 16);

    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const Text('Thomas Jefferson', style: textStyle),
      ],
    );
  }
}