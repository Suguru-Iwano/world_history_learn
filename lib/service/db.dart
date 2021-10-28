import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

class FirstListEntities extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get icon => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class SecondListEntities extends Table {
  IntColumn get id => integer()();
  IntColumn get parentId => integer()();
  TextColumn get title => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class QuestionEntities extends Table {
  IntColumn get id => integer()();
  IntColumn get parentId => integer()();
  IntColumn get level => integer()(); // 1:easy, 2:normal, 3:difficult
  IntColumn get booksPublishedNum => integer()();
  TextColumn get question => text()();
  TextColumn get answer => text()();
  TextColumn get dummy_1 => text()();
  TextColumn get dummy_2 => text()();
  TextColumn get explanation => text()();
  IntColumn get isChecked => integer()(); // 0:false, 1:true
  IntColumn get isPassed => integer()(); // 0:false, 1:true

  @override
  Set<Column> get primaryKey => {id};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/my_database.db');
      await file.writeAsBytes(
          blob.buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }

    return VmDatabase(file);
  });
}

@UseMoor(tables: [FirstListEntities, SecondListEntities, QuestionEntities])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  static MyDatabase? _instance;

  @override
  int get schemaVersion => 1;

  static MyDatabase getInstance() {
    if (_instance == null) {
      return _instance = MyDatabase();
    }
    return _instance!;
  }

  /// 全てのFirstListを取得する（IDの降順）
  Stream<List<FirstListEntitie>> get findAllOrderByCreated =>
      (select(firstListEntities)
            ..orderBy([
              (d) => OrderingTerm(expression: d.id, mode: OrderingMode.asc)
            ]))
          .watch();

  /// 全てのFirstListを取得する
  Future<List<FirstListEntitie>> findAll_firstList() {
    return select(firstListEntities).get();
  }

  /// FirstListのidに紐づくSecondListを取得する
  Future<List<SecondListEntitie>> findById_secondList(int parentId) {
    return (select(secondListEntities)
          ..where((it) => it.parentId.equals(parentId)))
        .get();
  }

  /// SecondListのidに紐づくQuestionを取得する
  Future<List<QuestionEntitie>> findById_question(int parentId) {
    return (select(questionEntities)
          ..where((it) => it.parentId.equals(parentId)))
        .get();
  }
}
