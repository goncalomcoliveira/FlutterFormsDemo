import 'package:floor/floor.dart';

@entity
class Band {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'name')
  final String name;

  Band(this.id, this.name);
}