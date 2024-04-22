import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../domain/band.dart';
import 'band_dao.dart';

part 'band_db.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Band])
abstract class BandDatabase extends FloorDatabase {
  BandDao get bandDao;
}