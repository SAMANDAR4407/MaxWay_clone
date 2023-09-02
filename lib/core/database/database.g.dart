// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProductDao? _productDaoInstance;

  AddressDao? _addressDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
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
            'CREATE TABLE IF NOT EXISTS `ProductData` (`productId` TEXT NOT NULL, `price` INTEGER NOT NULL, `currency` TEXT NOT NULL, `image` TEXT NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `amount` INTEGER NOT NULL, PRIMARY KEY (`productId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AddressEntity` (`locationName` TEXT NOT NULL, `title` TEXT NOT NULL, `apartment` TEXT NOT NULL, `floor` TEXT NOT NULL, `entrance` TEXT NOT NULL, `lat` REAL NOT NULL, `long` REAL NOT NULL, PRIMARY KEY (`locationName`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }

  @override
  AddressDao get addressDao {
    return _addressDaoInstance ??= _$AddressDao(database, changeListener);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _productDataInsertionAdapter = InsertionAdapter(
            database,
            'ProductData',
            (ProductData item) => <String, Object?>{
                  'productId': item.productId,
                  'price': item.price,
                  'currency': item.currency,
                  'image': item.image,
                  'title': item.title,
                  'description': item.description,
                  'amount': item.amount
                },
            changeListener),
        _productDataUpdateAdapter = UpdateAdapter(
            database,
            'ProductData',
            ['productId'],
            (ProductData item) => <String, Object?>{
                  'productId': item.productId,
                  'price': item.price,
                  'currency': item.currency,
                  'image': item.image,
                  'title': item.title,
                  'description': item.description,
                  'amount': item.amount
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductData> _productDataInsertionAdapter;

  final UpdateAdapter<ProductData> _productDataUpdateAdapter;

  @override
  Future<List<ProductData>> getAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM ProductData',
        mapper: (Map<String, Object?> row) => ProductData(
            productId: row['productId'] as String,
            price: row['price'] as int,
            currency: row['currency'] as String,
            image: row['image'] as String,
            title: row['title'] as String,
            description: row['description'] as String,
            amount: row['amount'] as int));
  }

  @override
  Stream<List<ProductData>> streamedData() {
    return _queryAdapter.queryListStream('SELECT * FROM ProductData',
        mapper: (Map<String, Object?> row) => ProductData(
            productId: row['productId'] as String,
            price: row['price'] as int,
            currency: row['currency'] as String,
            image: row['image'] as String,
            title: row['title'] as String,
            description: row['description'] as String,
            amount: row['amount'] as int),
        queryableName: 'ProductData',
        isView: false);
  }

  @override
  Future<void> deleteProduct(String id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM ProductData where productId = ?1',
        arguments: [id]);
  }

  @override
  Future<void> deleteProducts() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ProductData');
  }

  @override
  Future<void> insertProduct(ProductData product) async {
    await _productDataInsertionAdapter.insert(
        product, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateProduct(ProductData productData) async {
    await _productDataUpdateAdapter.update(
        productData, OnConflictStrategy.abort);
  }
}

class _$AddressDao extends AddressDao {
  _$AddressDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _addressEntityInsertionAdapter = InsertionAdapter(
            database,
            'AddressEntity',
            (AddressEntity item) => <String, Object?>{
                  'locationName': item.locationName,
                  'title': item.title,
                  'apartment': item.apartment,
                  'floor': item.floor,
                  'entrance': item.entrance,
                  'lat': item.lat,
                  'long': item.long
                },
            changeListener),
        _addressEntityUpdateAdapter = UpdateAdapter(
            database,
            'AddressEntity',
            ['locationName'],
            (AddressEntity item) => <String, Object?>{
                  'locationName': item.locationName,
                  'title': item.title,
                  'apartment': item.apartment,
                  'floor': item.floor,
                  'entrance': item.entrance,
                  'lat': item.lat,
                  'long': item.long
                },
            changeListener),
        _addressEntityDeletionAdapter = DeletionAdapter(
            database,
            'AddressEntity',
            ['locationName'],
            (AddressEntity item) => <String, Object?>{
                  'locationName': item.locationName,
                  'title': item.title,
                  'apartment': item.apartment,
                  'floor': item.floor,
                  'entrance': item.entrance,
                  'lat': item.lat,
                  'long': item.long
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AddressEntity> _addressEntityInsertionAdapter;

  final UpdateAdapter<AddressEntity> _addressEntityUpdateAdapter;

  final DeletionAdapter<AddressEntity> _addressEntityDeletionAdapter;

  @override
  Future<List<AddressEntity>> getAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM AddressEntity',
        mapper: (Map<String, Object?> row) => AddressEntity(
            locationName: row['locationName'] as String,
            title: row['title'] as String,
            apartment: row['apartment'] as String,
            floor: row['floor'] as String,
            entrance: row['entrance'] as String,
            lat: row['lat'] as double,
            long: row['long'] as double));
  }

  @override
  Stream<List<AddressEntity>> streamedData() {
    return _queryAdapter.queryListStream('SELECT * FROM AddressEntity',
        mapper: (Map<String, Object?> row) => AddressEntity(
            locationName: row['locationName'] as String,
            title: row['title'] as String,
            apartment: row['apartment'] as String,
            floor: row['floor'] as String,
            entrance: row['entrance'] as String,
            lat: row['lat'] as double,
            long: row['long'] as double),
        queryableName: 'AddressEntity',
        isView: false);
  }

  @override
  Future<void> deleteAddresses() async {
    await _queryAdapter.queryNoReturn('DELETE FROM AddressEntity');
  }

  @override
  Future<void> insertAddress(AddressEntity address) async {
    await _addressEntityInsertionAdapter.insert(
        address, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateAddress(AddressEntity address) async {
    await _addressEntityUpdateAdapter.update(address, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteAddress(AddressEntity address) async {
    await _addressEntityDeletionAdapter.delete(address);
  }
}
