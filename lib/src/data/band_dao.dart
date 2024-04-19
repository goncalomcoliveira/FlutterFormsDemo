import 'package:floor/floor.dart';
import '../domain/band.dart';

@dao
abstract class BandDao {
  @Query('SELECT * FROM Person')
  Future<List<Band>> findAllPeople();

  @Query('SELECT name FROM Person')
  Stream<List<String>> findAllPeopleName();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Band?> findPersonById(int id);

  @insert
  Future<void> insertPerson(Band person);
}