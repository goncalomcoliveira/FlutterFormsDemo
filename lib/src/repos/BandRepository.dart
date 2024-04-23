import '../data/band_dao.dart';
import '../domain/band.dart';

class BandRepository {
  final BandDao bandDao;

  BandRepository({required this.bandDao});

  Future<Band> getFirstBandOrEmpty() async {
    final bands = await bandDao.findAllBands();
    if (bands.isNotEmpty) {
      return bands.first;
    } else {
      // Instantiate an empty Band object
      return Band.empty();
    }
  }

  Future<void> addBand(Band band) async {
    await bandDao.insertBand(band);
  }

  Future<void> updateBand(Band band) async {
    await bandDao.updateBand(band);
  }
}