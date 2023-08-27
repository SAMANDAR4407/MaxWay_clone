
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'dao/dao.dart';
import 'entity/entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [ProductData])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
}