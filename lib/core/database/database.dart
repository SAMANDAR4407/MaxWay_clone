
import 'package:demo_max_way/core/database/entity/address_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'dao/address_dao.dart';
import 'dao/product_dao.dart';
import 'entity/product_entity.dart';

part 'database.g.dart';

@Database(version: 2, entities: [ProductData, AddressEntity])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
  AddressDao get addressDao;
}