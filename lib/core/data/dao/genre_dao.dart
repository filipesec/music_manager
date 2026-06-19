import 'package:drift/drift.dart';
import '../database.dart';

class GenreDao {
  final AppDatabase db;

  GenreDao(this.db);

  Future<List<GenreTableData>> getAll() {
    return db.select(db.genreTable).get();
  }

  Future<int> insert(String name) {
    return db
        .into(db.genreTable)
        .insert(GenreTableCompanion.insert(name: name));
  }

  Future<int> update(int id, String name) {
    return (db.update(db.genreTable)..where((t) => t.id.equals(id))).write(
      GenreTableCompanion(name: Value(name)),
    );
  }

  Future<int> delete(int id) {
    return (db.delete(db.genreTable)..where((t) => t.id.equals(id))).go();
  }
}
