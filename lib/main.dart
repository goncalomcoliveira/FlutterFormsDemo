import 'package:flutter/material.dart';
import 'package:flutter_forms_demo/src/presentation/band_form/band_form.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyFormApp());
}

class MyFormApp extends StatelessWidget {
  const MyFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyFormState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
        ),
        home: const Scaffold(
          backgroundColor: Colors.greenAccent,
          body: Padding(
            padding: EdgeInsets.all(60.0),
            child: BandForm(title: 'Flutter Demo Home Page'),
          ),
        ),
      ),
    );
  }
}

class MyFormState extends ChangeNotifier {
  final bandFormKey = GlobalKey<FormState>();

  String name = '';
}