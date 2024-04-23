// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorBandDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BandDatabaseBuilder databaseBuilder(String name) =>
      _$BandDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BandDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$BandDatabaseBuilder(null);
}

class _$BandDatabaseBuilder {
  _$BandDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$BandDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$BandDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<BandDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BandDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BandDatabase extends BandDatabase {
  _$BandDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BandDao? _bandDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Band` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `origin` TEXT NOT NULL, `genre` TEXT NOT NULL, `memberAmount` INTEGER NOT NULL, `isActive` INTEGER NOT NULL, `grammyState` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BandDao get bandDao {
    return _bandDaoInstance ??= _$BandDao(database, changeListener);
  }
}

class _$BandDao extends BandDao {
  _$BandDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _bandInsertionAdapter = InsertionAdapter(
            database,
            'Band',
            (Band item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'origin': item.origin,
                  'genre': item.genre,
                  'memberAmount': item.memberAmount,
                  'isActive': item.isActive ? 1 : 0,
                  'grammyState': item.grammyState.index
                },
            changeListener),
        _bandUpdateAdapter = UpdateAdapter(
            database,
            'Band',
            ['id'],
            (Band item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'origin': item.origin,
                  'genre': item.genre,
                  'memberAmount': item.memberAmount,
                  'isActive': item.isActive ? 1 : 0,
                  'grammyState': item.grammyState.index
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Band> _bandInsertionAdapter;

  final UpdateAdapter<Band> _bandUpdateAdapter;

  @override
  Future<List<Band>> findAllBands() async {
    return _queryAdapter.queryList('SELECT * FROM Band',
        mapper: (Map<String, Object?> row) => Band(
            row['id'] as int?,
            row['name'] as String,
            row['origin'] as String,
            row['genre'] as String,
            row['memberAmount'] as int,
            (row['isActive'] as int) != 0,
            GrammyState.values[row['grammyState'] as int]));
  }

  @override
  Stream<Band?> findBandById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Band WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Band(
            row['id'] as int?,
            row['name'] as String,
            row['origin'] as String,
            row['genre'] as String,
            row['memberAmount'] as int,
            (row['isActive'] as int) != 0,
            GrammyState.values[row['grammyState'] as int]),
        arguments: [id],
        queryableName: 'Band',
        isView: false);
  }

  @override
  Future<void> insertBand(Band band) async {
    await _bandInsertionAdapter.insert(band, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateBand(Band band) async {
    await _bandUpdateAdapter.update(band, OnConflictStrategy.abort);
  }
}
