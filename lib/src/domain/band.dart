import 'package:floor/floor.dart';

@entity
class Band {
  @PrimaryKey(autoGenerate: true)
  int? id;

  @ColumnInfo(name: 'name')
  String name;

  @ColumnInfo(name: 'origin')
  String origin;

  @ColumnInfo(name: 'genre')
  String genre;

  @ColumnInfo(name: 'memberAmount')
  int memberAmount;

  @ColumnInfo(name: 'isActive')
  bool isActive;

  @ColumnInfo(name: 'grammyState')
  GrammyState grammyState;

  @ColumnInfo(name: 'imagePath')
  String imagePath;

  Band(this.id, this.name, this.origin, this.genre, this.memberAmount,
      this.isActive, this.grammyState, this.imagePath);

  Band.empty()
      : name = '',
        origin = '',
        genre = '',
        memberAmount = 0,
        isActive = false,
        grammyState = GrammyState.notNominated,
        imagePath = '';

  @override
  String toString() {
    return 'Band{id: $id, name: $name, origin: $origin, genre: $genre, memberAmount: $memberAmount, isActive: $isActive, grammyState: $grammyState, imagePath: $imagePath}';
  }
}

enum GrammyState { notNominated, nominated, winner }

extension GrammyExtension on GrammyState {
  String get name {
    switch (this) {
      case GrammyState.winner:
        return 'Winner';
      case GrammyState.nominated:
        return 'Nominated';
      case GrammyState.notNominated:
        return 'Not Nominated';
    }
  }
}