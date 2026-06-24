import 'package:drift/drift.dart';
import '../database.dart';

class MusicDao {
  final AppDatabase db;

  MusicDao(this.db);

  //busca todas as músicas
  Future<List<MusicTableData>> getAll() {
    return db.select(db.musicTable).get();
  }

  //insere uma nova música
  Future<int> insert({
    required String name,
    required String artist,
    required String musicPath,
    int? genreId,
    String? coverPath,
  }) {
    return db
        .into(db.musicTable)
        .insert(
          MusicTableCompanion.insert(
            name: name,
            artist: artist,
            musicPath: musicPath,
            genreId: genreId != null ? Value(genreId) : const Value.absent(),
            coverPath: coverPath != null
                ? Value(coverPath)
                : const Value.absent(),
          ),
        );
  }

  //atualiza uma música já existente
  Future<int> update({
    required int id,
    required String name,
    required String artist,
    required String musicPath,
    int? genreId,
    String? coverPath,
  }) {
    return (db.update(db.musicTable)..where((t) => t.id.equals(id))).write(
      MusicTableCompanion(
        name: Value(name),
        artist: Value(artist),
        musicPath: Value(musicPath),
        genreId: genreId != null ? Value(genreId) : const Value.absent(),
        coverPath: coverPath != null ? Value(coverPath) : const Value.absent(),
      ),
    );
  }

  //deleta música
  Future<int> delete(int id) {
    return (db.delete(db.musicTable)..where((t) => t.id.equals(id))).go();
  }
}
