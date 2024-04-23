import 'package:flutter/material.dart';
import 'package:flutter_forms_demo/src/data/band_db.dart';
import 'package:flutter_forms_demo/src/domain/band.dart';
import 'package:flutter_forms_demo/src/presentation/band_form/band_form.dart';
import 'package:flutter_forms_demo/src/repos/BandRepository.dart';
import 'package:provider/provider.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorBandDatabase
      .databaseBuilder('band_db.db')
      .build();
  final bandRepository = BandRepository(bandDao: database.bandDao);

  runApp(MyFormApp(bandRepository));
}

class MyFormApp extends StatelessWidget {
  final BandRepository bandRepository;

  const MyFormApp(this.bandRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyFormState(repository: bandRepository),
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
  final BandRepository repository;
  Band band = Band.empty();
  bool isNewBand = false;

  MyFormState({required this.repository});

  Future<void> fetchBand() async {
    band = await repository.getFirstBandOrEmpty();
    isNewBand = band.name == '';
  }

  Future<void> saveData() async {
    if (isNewBand) {
      await repository.addBand(band);
    } else {
      await repository.updateBand(band);
    }
  }

  final bandFormKey = GlobalKey<FormState>();
}