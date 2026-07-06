import 'package:drift/drift.dart';
import 'package:music_manager/core/data/tables/genre_table.dart';

class MusicTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get artist => text()();
  IntColumn get genreId => integer().nullable().references(GenreTable, #id)();
  TextColumn get coverPath => text().nullable()();
  TextColumn get musicPath => text()();
}
