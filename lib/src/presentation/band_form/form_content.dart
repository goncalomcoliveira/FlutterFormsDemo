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
        child: FutureBuilder(
            future: appState.fetchBand(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return FormFields(appState);
              }
            }),
      ),
    );
  }
}

class FormFields extends StatelessWidget {
  final MyFormState appState;

  const FormFields(this.appState, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> originItems = [
      '',
      'United Kingdom',
      'United States',
      'Germany',
      'Sweden',
      'Finland',
      'Canada',
      'Norway',
      'Australia',
      'Italy',
      'Denmark'
    ];

    String selectedOrigin = '';
    if (originItems.contains(appState.band.origin)) {
      selectedOrigin = appState.band.origin;
    } else {
      selectedOrigin = originItems[0];
    }

    List<String> genreItems = [
      '',
      'Pop',
      'Rock',
      'Hip Hop',
      'R&B',
      'Country',
      'Electronic',
      'Jazz',
      'Classical',
      'Reggae',
      'Blues',
      'Metal',
      'Folk',
      'Punk',
      'Indie',
      'Funk',
    ];

    String selectedGenre = '';
    if (genreItems.contains(appState.band.genre)) {
      selectedGenre = appState.band.genre;
    } else {
      selectedGenre = genreItems[0];
    }

    return ListView(
      //padding: EdgeInsets.zero,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: TextFormField(
                initialValue: appState.band.name,
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
                  appState.band.name = value!;
                },
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 3,
              child: DropdownButtonFormField<String>(
                value: selectedOrigin,
                onChanged: (String? value) {},
                items: originItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Origin',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  appState.band.origin = value!;
                },
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: appState.band.memberAmount.toString(),
                decoration: const InputDecoration(
                  hintText: "Number of Members",
                  labelText: 'Number of Members*',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of members';
                  }
                  int? intValue = int.tryParse(value);
                  if (intValue == null) {
                    return 'Please enter a whole number';
                  } else if (intValue <= 0) {
                    return 'Please enter a value greater than 0';
                  }
                  return null;
                },
                onSaved: (value) {
                  appState.band.memberAmount = int.parse(value!);
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
              child: DropdownButtonFormField<String>(
                value: selectedGenre,
                onChanged: (String? value) {},
                items: genreItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Genre',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  appState.band.genre = value!;
                },
              ),
            ),
            const SizedBox(width: 24),
            RadioExample(appState),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CheckboxExample(appState),
          ],
        ),
      ],
    );
  }
}
