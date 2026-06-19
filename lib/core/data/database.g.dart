// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GenreTableTable extends GenreTable
    with TableInfo<$GenreTableTable, GenreTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenreTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'genre_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<GenreTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GenreTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GenreTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $GenreTableTable createAlias(String alias) {
    return $GenreTableTable(attachedDatabase, alias);
  }
}

class GenreTableData extends DataClass implements Insertable<GenreTableData> {
  final int id;
  final String name;
  const GenreTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenreTableCompanion toCompanion(bool nullToAbsent) {
    return GenreTableCompanion(id: Value(id), name: Value(name));
  }

  factory GenreTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenreTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  GenreTableData copyWith({int? id, String? name}) =>
      GenreTableData(id: id ?? this.id, name: name ?? this.name);
  GenreTableData copyWithCompanion(GenreTableCompanion data) {
    return GenreTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GenreTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenreTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class GenreTableCompanion extends UpdateCompanion<GenreTableData> {
  final Value<int> id;
  final Value<String> name;
  const GenreTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenreTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<GenreTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenreTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GenreTableCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenreTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MusicTableTable extends MusicTable
    with TableInfo<$MusicTableTable, MusicTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MusicTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
    'artist',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genreIdMeta = const VerificationMeta(
    'genreId',
  );
  @override
  late final GeneratedColumn<int> genreId = GeneratedColumn<int>(
    'genre_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverPathMeta = const VerificationMeta(
    'coverPath',
  );
  @override
  late final GeneratedColumn<String> coverPath = GeneratedColumn<String>(
    'cover_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _musicPathMeta = const VerificationMeta(
    'musicPath',
  );
  @override
  late final GeneratedColumn<String> musicPath = GeneratedColumn<String>(
    'music_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    artist,
    genreId,
    coverPath,
    musicPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'music_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MusicTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(
        _artistMeta,
        artist.isAcceptableOrUnknown(data['artist']!, _artistMeta),
      );
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(
        _genreIdMeta,
        genreId.isAcceptableOrUnknown(data['genre_id']!, _genreIdMeta),
      );
    }
    if (data.containsKey('cover_path')) {
      context.handle(
        _coverPathMeta,
        coverPath.isAcceptableOrUnknown(data['cover_path']!, _coverPathMeta),
      );
    }
    if (data.containsKey('music_path')) {
      context.handle(
        _musicPathMeta,
        musicPath.isAcceptableOrUnknown(data['music_path']!, _musicPathMeta),
      );
    } else if (isInserting) {
      context.missing(_musicPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MusicTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MusicTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      artist: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist'],
      )!,
      genreId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}genre_id'],
      ),
      coverPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_path'],
      ),
      musicPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}music_path'],
      )!,
    );
  }

  @override
  $MusicTableTable createAlias(String alias) {
    return $MusicTableTable(attachedDatabase, alias);
  }
}

class MusicTableData extends DataClass implements Insertable<MusicTableData> {
  final int id;
  final String name;
  final String artist;
  final int? genreId;
  final String? coverPath;
  final String musicPath;
  const MusicTableData({
    required this.id,
    required this.name,
    required this.artist,
    this.genreId,
    this.coverPath,
    required this.musicPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['artist'] = Variable<String>(artist);
    if (!nullToAbsent || genreId != null) {
      map['genre_id'] = Variable<int>(genreId);
    }
    if (!nullToAbsent || coverPath != null) {
      map['cover_path'] = Variable<String>(coverPath);
    }
    map['music_path'] = Variable<String>(musicPath);
    return map;
  }

  MusicTableCompanion toCompanion(bool nullToAbsent) {
    return MusicTableCompanion(
      id: Value(id),
      name: Value(name),
      artist: Value(artist),
      genreId: genreId == null && nullToAbsent
          ? const Value.absent()
          : Value(genreId),
      coverPath: coverPath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPath),
      musicPath: Value(musicPath),
    );
  }

  factory MusicTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MusicTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      artist: serializer.fromJson<String>(json['artist']),
      genreId: serializer.fromJson<int?>(json['genreId']),
      coverPath: serializer.fromJson<String?>(json['coverPath']),
      musicPath: serializer.fromJson<String>(json['musicPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'artist': serializer.toJson<String>(artist),
      'genreId': serializer.toJson<int?>(genreId),
      'coverPath': serializer.toJson<String?>(coverPath),
      'musicPath': serializer.toJson<String>(musicPath),
    };
  }

  MusicTableData copyWith({
    int? id,
    String? name,
    String? artist,
    Value<int?> genreId = const Value.absent(),
    Value<String?> coverPath = const Value.absent(),
    String? musicPath,
  }) => MusicTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    artist: artist ?? this.artist,
    genreId: genreId.present ? genreId.value : this.genreId,
    coverPath: coverPath.present ? coverPath.value : this.coverPath,
    musicPath: musicPath ?? this.musicPath,
  );
  MusicTableData copyWithCompanion(MusicTableCompanion data) {
    return MusicTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      artist: data.artist.present ? data.artist.value : this.artist,
      genreId: data.genreId.present ? data.genreId.value : this.genreId,
      coverPath: data.coverPath.present ? data.coverPath.value : this.coverPath,
      musicPath: data.musicPath.present ? data.musicPath.value : this.musicPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MusicTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('artist: $artist, ')
          ..write('genreId: $genreId, ')
          ..write('coverPath: $coverPath, ')
          ..write('musicPath: $musicPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, artist, genreId, coverPath, musicPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MusicTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.artist == this.artist &&
          other.genreId == this.genreId &&
          other.coverPath == this.coverPath &&
          other.musicPath == this.musicPath);
}

class MusicTableCompanion extends UpdateCompanion<MusicTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> artist;
  final Value<int?> genreId;
  final Value<String?> coverPath;
  final Value<String> musicPath;
  const MusicTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.artist = const Value.absent(),
    this.genreId = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.musicPath = const Value.absent(),
  });
  MusicTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String artist,
    this.genreId = const Value.absent(),
    this.coverPath = const Value.absent(),
    required String musicPath,
  }) : name = Value(name),
       artist = Value(artist),
       musicPath = Value(musicPath);
  static Insertable<MusicTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? artist,
    Expression<int>? genreId,
    Expression<String>? coverPath,
    Expression<String>? musicPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (artist != null) 'artist': artist,
      if (genreId != null) 'genre_id': genreId,
      if (coverPath != null) 'cover_path': coverPath,
      if (musicPath != null) 'music_path': musicPath,
    });
  }

  MusicTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? artist,
    Value<int?>? genreId,
    Value<String?>? coverPath,
    Value<String>? musicPath,
  }) {
    return MusicTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      artist: artist ?? this.artist,
      genreId: genreId ?? this.genreId,
      coverPath: coverPath ?? this.coverPath,
      musicPath: musicPath ?? this.musicPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (genreId.present) {
      map['genre_id'] = Variable<int>(genreId.value);
    }
    if (coverPath.present) {
      map['cover_path'] = Variable<String>(coverPath.value);
    }
    if (musicPath.present) {
      map['music_path'] = Variable<String>(musicPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MusicTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('artist: $artist, ')
          ..write('genreId: $genreId, ')
          ..write('coverPath: $coverPath, ')
          ..write('musicPath: $musicPath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GenreTableTable genreTable = $GenreTableTable(this);
  late final $MusicTableTable musicTable = $MusicTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [genreTable, musicTable];
}

typedef $$GenreTableTableCreateCompanionBuilder =
    GenreTableCompanion Function({Value<int> id, required String name});
typedef $$GenreTableTableUpdateCompanionBuilder =
    GenreTableCompanion Function({Value<int> id, Value<String> name});

class $$GenreTableTableFilterComposer
    extends Composer<_$AppDatabase, $GenreTableTable> {
  $$GenreTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GenreTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GenreTableTable> {
  $$GenreTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GenreTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GenreTableTable> {
  $$GenreTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$GenreTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GenreTableTable,
          GenreTableData,
          $$GenreTableTableFilterComposer,
          $$GenreTableTableOrderingComposer,
          $$GenreTableTableAnnotationComposer,
          $$GenreTableTableCreateCompanionBuilder,
          $$GenreTableTableUpdateCompanionBuilder,
          (
            GenreTableData,
            BaseReferences<_$AppDatabase, $GenreTableTable, GenreTableData>,
          ),
          GenreTableData,
          PrefetchHooks Function()
        > {
  $$GenreTableTableTableManager(_$AppDatabase db, $GenreTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GenreTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GenreTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GenreTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => GenreTableCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  GenreTableCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GenreTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GenreTableTable,
      GenreTableData,
      $$GenreTableTableFilterComposer,
      $$GenreTableTableOrderingComposer,
      $$GenreTableTableAnnotationComposer,
      $$GenreTableTableCreateCompanionBuilder,
      $$GenreTableTableUpdateCompanionBuilder,
      (
        GenreTableData,
        BaseReferences<_$AppDatabase, $GenreTableTable, GenreTableData>,
      ),
      GenreTableData,
      PrefetchHooks Function()
    >;
typedef $$MusicTableTableCreateCompanionBuilder =
    MusicTableCompanion Function({
      Value<int> id,
      required String name,
      required String artist,
      Value<int?> genreId,
      Value<String?> coverPath,
      required String musicPath,
    });
typedef $$MusicTableTableUpdateCompanionBuilder =
    MusicTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> artist,
      Value<int?> genreId,
      Value<String?> coverPath,
      Value<String> musicPath,
    });

class $$MusicTableTableFilterComposer
    extends Composer<_$AppDatabase, $MusicTableTable> {
  $$MusicTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get genreId => $composableBuilder(
    column: $table.genreId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverPath => $composableBuilder(
    column: $table.coverPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get musicPath => $composableBuilder(
    column: $table.musicPath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MusicTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MusicTableTable> {
  $$MusicTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get genreId => $composableBuilder(
    column: $table.genreId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverPath => $composableBuilder(
    column: $table.coverPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get musicPath => $composableBuilder(
    column: $table.musicPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MusicTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MusicTableTable> {
  $$MusicTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get artist =>
      $composableBuilder(column: $table.artist, builder: (column) => column);

  GeneratedColumn<int> get genreId =>
      $composableBuilder(column: $table.genreId, builder: (column) => column);

  GeneratedColumn<String> get coverPath =>
      $composableBuilder(column: $table.coverPath, builder: (column) => column);

  GeneratedColumn<String> get musicPath =>
      $composableBuilder(column: $table.musicPath, builder: (column) => column);
}

class $$MusicTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MusicTableTable,
          MusicTableData,
          $$MusicTableTableFilterComposer,
          $$MusicTableTableOrderingComposer,
          $$MusicTableTableAnnotationComposer,
          $$MusicTableTableCreateCompanionBuilder,
          $$MusicTableTableUpdateCompanionBuilder,
          (
            MusicTableData,
            BaseReferences<_$AppDatabase, $MusicTableTable, MusicTableData>,
          ),
          MusicTableData,
          PrefetchHooks Function()
        > {
  $$MusicTableTableTableManager(_$AppDatabase db, $MusicTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MusicTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MusicTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MusicTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> artist = const Value.absent(),
                Value<int?> genreId = const Value.absent(),
                Value<String?> coverPath = const Value.absent(),
                Value<String> musicPath = const Value.absent(),
              }) => MusicTableCompanion(
                id: id,
                name: name,
                artist: artist,
                genreId: genreId,
                coverPath: coverPath,
                musicPath: musicPath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String artist,
                Value<int?> genreId = const Value.absent(),
                Value<String?> coverPath = const Value.absent(),
                required String musicPath,
              }) => MusicTableCompanion.insert(
                id: id,
                name: name,
                artist: artist,
                genreId: genreId,
                coverPath: coverPath,
                musicPath: musicPath,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MusicTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MusicTableTable,
      MusicTableData,
      $$MusicTableTableFilterComposer,
      $$MusicTableTableOrderingComposer,
      $$MusicTableTableAnnotationComposer,
      $$MusicTableTableCreateCompanionBuilder,
      $$MusicTableTableUpdateCompanionBuilder,
      (
        MusicTableData,
        BaseReferences<_$AppDatabase, $MusicTableTable, MusicTableData>,
      ),
      MusicTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GenreTableTableTableManager get genreTable =>
      $$GenreTableTableTableManager(_db, _db.genreTable);
  $$MusicTableTableTableManager get musicTable =>
      $$MusicTableTableTableManager(_db, _db.musicTable);
}
