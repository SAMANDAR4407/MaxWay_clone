import 'package:get_it/get_it.dart';

import '../core/database/database.dart';

final getIt = GetIt.instance;

void setupDatabase() async{
  final database = await $FloorAppDatabase.databaseBuilder('database.db').build();

  getIt.registerSingleton<AppDatabase>(database);
}