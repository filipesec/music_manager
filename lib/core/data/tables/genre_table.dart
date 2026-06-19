import 'package:drift/drift.dart';

class GenreTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
