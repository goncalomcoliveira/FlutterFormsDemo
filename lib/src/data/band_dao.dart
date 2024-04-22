import 'package:floor/floor.dart';
import '../domain/band.dart';

@dao
abstract class BandDao {
  @Query('SELECT * FROM Band')
  Future<List<Band>> findAllBands();

  @Query('SELECT * FROM Band WHERE id = :id')
  Stream<Band?> findBandById(int id);

  @insert
  Future<void> insertBand(Band band);

  @update
  Future<void> updateBand(Band band);
}