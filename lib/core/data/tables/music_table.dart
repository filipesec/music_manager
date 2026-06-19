import 'package:drift/drift.dart';

class MusicTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get artist => text()();
  IntColumn get genreId => integer().nullable()();
  TextColumn get coverPath => text().nullable()();
  TextColumn get musicPath => text()();
}
