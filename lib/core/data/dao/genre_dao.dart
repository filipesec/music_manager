import 'package:drift/drift.dart';
import '../database.dart';

class GenreDao {
  final AppDatabase db;

  GenreDao(this.db);

  //busca todos os gêneros
  Future<List<GenreTableData>> getAll() {
    return db.select(db.genreTable).get();
  }

  //insere gêneros na tabela
  Future<int> insert(String name) {
    return db
        .into(db.genreTable)
        .insert(GenreTableCompanion.insert(name: name));
  }

  //atualiza gêneros já existentes
  Future<int> update(int id, String name) {
    return (db.update(db.genreTable)..where((t) => t.id.equals(id))).write(
      GenreTableCompanion(name: Value(name)),
    );
  }

  //deleta gêneros da tabela
  Future<int> delete(int id) {
    return (db.delete(db.genreTable)..where((t) => t.id.equals(id))).go();
  }
}
