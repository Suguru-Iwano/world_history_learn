// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FirstListEntitie extends DataClass
    implements Insertable<FirstListEntitie> {
  final int id;
  final String title;
  final String icon;
  FirstListEntitie({required this.id, required this.title, required this.icon});
  factory FirstListEntitie.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FirstListEntitie(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      icon: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}icon'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['icon'] = Variable<String>(icon);
    return map;
  }

  FirstListEntitiesCompanion toCompanion(bool nullToAbsent) {
    return FirstListEntitiesCompanion(
      id: Value(id),
      title: Value(title),
      icon: Value(icon),
    );
  }

  factory FirstListEntitie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FirstListEntitie(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      icon: serializer.fromJson<String>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'icon': serializer.toJson<String>(icon),
    };
  }

  FirstListEntitie copyWith({int? id, String? title, String? icon}) =>
      FirstListEntitie(
        id: id ?? this.id,
        title: title ?? this.title,
        icon: icon ?? this.icon,
      );
  @override
  String toString() {
    return (StringBuffer('FirstListEntitie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(title.hashCode, icon.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FirstListEntitie &&
          other.id == this.id &&
          other.title == this.title &&
          other.icon == this.icon);
}

class FirstListEntitiesCompanion extends UpdateCompanion<FirstListEntitie> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> icon;
  const FirstListEntitiesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.icon = const Value.absent(),
  });
  FirstListEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String icon,
  })  : title = Value(title),
        icon = Value(icon);
  static Insertable<FirstListEntitie> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (icon != null) 'icon': icon,
    });
  }

  FirstListEntitiesCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? icon}) {
    return FirstListEntitiesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FirstListEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $FirstListEntitiesTable extends FirstListEntities
    with TableInfo<$FirstListEntitiesTable, FirstListEntitie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FirstListEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  late final GeneratedColumn<String?> icon = GeneratedColumn<String?>(
      'icon', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, icon];
  @override
  String get aliasedName => _alias ?? 'first_list_entities';
  @override
  String get actualTableName => 'first_list_entities';
  @override
  VerificationContext validateIntegrity(Insertable<FirstListEntitie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FirstListEntitie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FirstListEntitie.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FirstListEntitiesTable createAlias(String alias) {
    return $FirstListEntitiesTable(_db, alias);
  }
}

class SecondListEntitie extends DataClass
    implements Insertable<SecondListEntitie> {
  final int id;
  final int parentId;
  final String title;
  SecondListEntitie(
      {required this.id, required this.parentId, required this.title});
  factory SecondListEntitie.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SecondListEntitie(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      parentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<int>(parentId);
    map['title'] = Variable<String>(title);
    return map;
  }

  SecondListEntitiesCompanion toCompanion(bool nullToAbsent) {
    return SecondListEntitiesCompanion(
      id: Value(id),
      parentId: Value(parentId),
      title: Value(title),
    );
  }

  factory SecondListEntitie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SecondListEntitie(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int>(json['parentId']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int>(parentId),
      'title': serializer.toJson<String>(title),
    };
  }

  SecondListEntitie copyWith({int? id, int? parentId, String? title}) =>
      SecondListEntitie(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('SecondListEntitie(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(parentId.hashCode, title.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SecondListEntitie &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.title == this.title);
}

class SecondListEntitiesCompanion extends UpdateCompanion<SecondListEntitie> {
  final Value<int> id;
  final Value<int> parentId;
  final Value<String> title;
  const SecondListEntitiesCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.title = const Value.absent(),
  });
  SecondListEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required int parentId,
    required String title,
  })  : parentId = Value(parentId),
        title = Value(title);
  static Insertable<SecondListEntitie> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (title != null) 'title': title,
    });
  }

  SecondListEntitiesCompanion copyWith(
      {Value<int>? id, Value<int>? parentId, Value<String>? title}) {
    return SecondListEntitiesCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SecondListEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $SecondListEntitiesTable extends SecondListEntities
    with TableInfo<$SecondListEntitiesTable, SecondListEntitie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SecondListEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  late final GeneratedColumn<int?> parentId = GeneratedColumn<int?>(
      'parent_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, parentId, title];
  @override
  String get aliasedName => _alias ?? 'second_list_entities';
  @override
  String get actualTableName => 'second_list_entities';
  @override
  VerificationContext validateIntegrity(Insertable<SecondListEntitie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SecondListEntitie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SecondListEntitie.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SecondListEntitiesTable createAlias(String alias) {
    return $SecondListEntitiesTable(_db, alias);
  }
}

class QuestionEntitie extends DataClass implements Insertable<QuestionEntitie> {
  final int id;
  final int parentId;
  final int level;
  final int booksPublishedNum;
  final String question;
  final String answer;
  final String dummy_1;
  final String dummy_2;
  final String explanation;
  final int isChecked;
  final int isPassed;
  QuestionEntitie(
      {required this.id,
      required this.parentId,
      required this.level,
      required this.booksPublishedNum,
      required this.question,
      required this.answer,
      required this.dummy_1,
      required this.dummy_2,
      required this.explanation,
      required this.isChecked,
      required this.isPassed});
  factory QuestionEntitie.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return QuestionEntitie(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      parentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_id'])!,
      level: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}level'])!,
      booksPublishedNum: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}books_published_num'])!,
      question: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}question'])!,
      answer: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}answer'])!,
      dummy_1: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dummy_1'])!,
      dummy_2: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dummy_2'])!,
      explanation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}explanation'])!,
      isChecked: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_checked'])!,
      isPassed: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_passed'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<int>(parentId);
    map['level'] = Variable<int>(level);
    map['books_published_num'] = Variable<int>(booksPublishedNum);
    map['question'] = Variable<String>(question);
    map['answer'] = Variable<String>(answer);
    map['dummy_1'] = Variable<String>(dummy_1);
    map['dummy_2'] = Variable<String>(dummy_2);
    map['explanation'] = Variable<String>(explanation);
    map['is_checked'] = Variable<int>(isChecked);
    map['is_passed'] = Variable<int>(isPassed);
    return map;
  }

  QuestionEntitiesCompanion toCompanion(bool nullToAbsent) {
    return QuestionEntitiesCompanion(
      id: Value(id),
      parentId: Value(parentId),
      level: Value(level),
      booksPublishedNum: Value(booksPublishedNum),
      question: Value(question),
      answer: Value(answer),
      dummy_1: Value(dummy_1),
      dummy_2: Value(dummy_2),
      explanation: Value(explanation),
      isChecked: Value(isChecked),
      isPassed: Value(isPassed),
    );
  }

  factory QuestionEntitie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return QuestionEntitie(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int>(json['parentId']),
      level: serializer.fromJson<int>(json['level']),
      booksPublishedNum: serializer.fromJson<int>(json['booksPublishedNum']),
      question: serializer.fromJson<String>(json['question']),
      answer: serializer.fromJson<String>(json['answer']),
      dummy_1: serializer.fromJson<String>(json['dummy_1']),
      dummy_2: serializer.fromJson<String>(json['dummy_2']),
      explanation: serializer.fromJson<String>(json['explanation']),
      isChecked: serializer.fromJson<int>(json['isChecked']),
      isPassed: serializer.fromJson<int>(json['isPassed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int>(parentId),
      'level': serializer.toJson<int>(level),
      'booksPublishedNum': serializer.toJson<int>(booksPublishedNum),
      'question': serializer.toJson<String>(question),
      'answer': serializer.toJson<String>(answer),
      'dummy_1': serializer.toJson<String>(dummy_1),
      'dummy_2': serializer.toJson<String>(dummy_2),
      'explanation': serializer.toJson<String>(explanation),
      'isChecked': serializer.toJson<int>(isChecked),
      'isPassed': serializer.toJson<int>(isPassed),
    };
  }

  QuestionEntitie copyWith(
          {int? id,
          int? parentId,
          int? level,
          int? booksPublishedNum,
          String? question,
          String? answer,
          String? dummy_1,
          String? dummy_2,
          String? explanation,
          int? isChecked,
          int? isPassed}) =>
      QuestionEntitie(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        level: level ?? this.level,
        booksPublishedNum: booksPublishedNum ?? this.booksPublishedNum,
        question: question ?? this.question,
        answer: answer ?? this.answer,
        dummy_1: dummy_1 ?? this.dummy_1,
        dummy_2: dummy_2 ?? this.dummy_2,
        explanation: explanation ?? this.explanation,
        isChecked: isChecked ?? this.isChecked,
        isPassed: isPassed ?? this.isPassed,
      );
  @override
  String toString() {
    return (StringBuffer('QuestionEntitie(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('level: $level, ')
          ..write('booksPublishedNum: $booksPublishedNum, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('dummy_1: $dummy_1, ')
          ..write('dummy_2: $dummy_2, ')
          ..write('explanation: $explanation, ')
          ..write('isChecked: $isChecked, ')
          ..write('isPassed: $isPassed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          parentId.hashCode,
          $mrjc(
              level.hashCode,
              $mrjc(
                  booksPublishedNum.hashCode,
                  $mrjc(
                      question.hashCode,
                      $mrjc(
                          answer.hashCode,
                          $mrjc(
                              dummy_1.hashCode,
                              $mrjc(
                                  dummy_2.hashCode,
                                  $mrjc(
                                      explanation.hashCode,
                                      $mrjc(isChecked.hashCode,
                                          isPassed.hashCode)))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionEntitie &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.level == this.level &&
          other.booksPublishedNum == this.booksPublishedNum &&
          other.question == this.question &&
          other.answer == this.answer &&
          other.dummy_1 == this.dummy_1 &&
          other.dummy_2 == this.dummy_2 &&
          other.explanation == this.explanation &&
          other.isChecked == this.isChecked &&
          other.isPassed == this.isPassed);
}

class QuestionEntitiesCompanion extends UpdateCompanion<QuestionEntitie> {
  final Value<int> id;
  final Value<int> parentId;
  final Value<int> level;
  final Value<int> booksPublishedNum;
  final Value<String> question;
  final Value<String> answer;
  final Value<String> dummy_1;
  final Value<String> dummy_2;
  final Value<String> explanation;
  final Value<int> isChecked;
  final Value<int> isPassed;
  const QuestionEntitiesCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.level = const Value.absent(),
    this.booksPublishedNum = const Value.absent(),
    this.question = const Value.absent(),
    this.answer = const Value.absent(),
    this.dummy_1 = const Value.absent(),
    this.dummy_2 = const Value.absent(),
    this.explanation = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.isPassed = const Value.absent(),
  });
  QuestionEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required int parentId,
    required int level,
    required int booksPublishedNum,
    required String question,
    required String answer,
    required String dummy_1,
    required String dummy_2,
    required String explanation,
    required int isChecked,
    required int isPassed,
  })  : parentId = Value(parentId),
        level = Value(level),
        booksPublishedNum = Value(booksPublishedNum),
        question = Value(question),
        answer = Value(answer),
        dummy_1 = Value(dummy_1),
        dummy_2 = Value(dummy_2),
        explanation = Value(explanation),
        isChecked = Value(isChecked),
        isPassed = Value(isPassed);
  static Insertable<QuestionEntitie> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<int>? level,
    Expression<int>? booksPublishedNum,
    Expression<String>? question,
    Expression<String>? answer,
    Expression<String>? dummy_1,
    Expression<String>? dummy_2,
    Expression<String>? explanation,
    Expression<int>? isChecked,
    Expression<int>? isPassed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (level != null) 'level': level,
      if (booksPublishedNum != null) 'books_published_num': booksPublishedNum,
      if (question != null) 'question': question,
      if (answer != null) 'answer': answer,
      if (dummy_1 != null) 'dummy_1': dummy_1,
      if (dummy_2 != null) 'dummy_2': dummy_2,
      if (explanation != null) 'explanation': explanation,
      if (isChecked != null) 'is_checked': isChecked,
      if (isPassed != null) 'is_passed': isPassed,
    });
  }

  QuestionEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? parentId,
      Value<int>? level,
      Value<int>? booksPublishedNum,
      Value<String>? question,
      Value<String>? answer,
      Value<String>? dummy_1,
      Value<String>? dummy_2,
      Value<String>? explanation,
      Value<int>? isChecked,
      Value<int>? isPassed}) {
    return QuestionEntitiesCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      level: level ?? this.level,
      booksPublishedNum: booksPublishedNum ?? this.booksPublishedNum,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      dummy_1: dummy_1 ?? this.dummy_1,
      dummy_2: dummy_2 ?? this.dummy_2,
      explanation: explanation ?? this.explanation,
      isChecked: isChecked ?? this.isChecked,
      isPassed: isPassed ?? this.isPassed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (booksPublishedNum.present) {
      map['books_published_num'] = Variable<int>(booksPublishedNum.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (dummy_1.present) {
      map['dummy_1'] = Variable<String>(dummy_1.value);
    }
    if (dummy_2.present) {
      map['dummy_2'] = Variable<String>(dummy_2.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<int>(isChecked.value);
    }
    if (isPassed.present) {
      map['is_passed'] = Variable<int>(isPassed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('level: $level, ')
          ..write('booksPublishedNum: $booksPublishedNum, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('dummy_1: $dummy_1, ')
          ..write('dummy_2: $dummy_2, ')
          ..write('explanation: $explanation, ')
          ..write('isChecked: $isChecked, ')
          ..write('isPassed: $isPassed')
          ..write(')'))
        .toString();
  }
}

class $QuestionEntitiesTable extends QuestionEntities
    with TableInfo<$QuestionEntitiesTable, QuestionEntitie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $QuestionEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  late final GeneratedColumn<int?> parentId = GeneratedColumn<int?>(
      'parent_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _levelMeta = const VerificationMeta('level');
  late final GeneratedColumn<int?> level = GeneratedColumn<int?>(
      'level', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _booksPublishedNumMeta =
      const VerificationMeta('booksPublishedNum');
  late final GeneratedColumn<int?> booksPublishedNum = GeneratedColumn<int?>(
      'books_published_num', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _questionMeta = const VerificationMeta('question');
  late final GeneratedColumn<String?> question = GeneratedColumn<String?>(
      'question', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _answerMeta = const VerificationMeta('answer');
  late final GeneratedColumn<String?> answer = GeneratedColumn<String?>(
      'answer', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dummy_1Meta = const VerificationMeta('dummy_1');
  late final GeneratedColumn<String?> dummy_1 = GeneratedColumn<String?>(
      'dummy_1', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dummy_2Meta = const VerificationMeta('dummy_2');
  late final GeneratedColumn<String?> dummy_2 = GeneratedColumn<String?>(
      'dummy_2', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  late final GeneratedColumn<String?> explanation = GeneratedColumn<String?>(
      'explanation', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _isCheckedMeta = const VerificationMeta('isChecked');
  late final GeneratedColumn<int?> isChecked = GeneratedColumn<int?>(
      'is_checked', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _isPassedMeta = const VerificationMeta('isPassed');
  late final GeneratedColumn<int?> isPassed = GeneratedColumn<int?>(
      'is_passed', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        parentId,
        level,
        booksPublishedNum,
        question,
        answer,
        dummy_1,
        dummy_2,
        explanation,
        isChecked,
        isPassed
      ];
  @override
  String get aliasedName => _alias ?? 'question_entities';
  @override
  String get actualTableName => 'question_entities';
  @override
  VerificationContext validateIntegrity(Insertable<QuestionEntitie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('books_published_num')) {
      context.handle(
          _booksPublishedNumMeta,
          booksPublishedNum.isAcceptableOrUnknown(
              data['books_published_num']!, _booksPublishedNumMeta));
    } else if (isInserting) {
      context.missing(_booksPublishedNumMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('dummy_1')) {
      context.handle(_dummy_1Meta,
          dummy_1.isAcceptableOrUnknown(data['dummy_1']!, _dummy_1Meta));
    } else if (isInserting) {
      context.missing(_dummy_1Meta);
    }
    if (data.containsKey('dummy_2')) {
      context.handle(_dummy_2Meta,
          dummy_2.isAcceptableOrUnknown(data['dummy_2']!, _dummy_2Meta));
    } else if (isInserting) {
      context.missing(_dummy_2Meta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation']!, _explanationMeta));
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    } else if (isInserting) {
      context.missing(_isCheckedMeta);
    }
    if (data.containsKey('is_passed')) {
      context.handle(_isPassedMeta,
          isPassed.isAcceptableOrUnknown(data['is_passed']!, _isPassedMeta));
    } else if (isInserting) {
      context.missing(_isPassedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionEntitie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return QuestionEntitie.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $QuestionEntitiesTable createAlias(String alias) {
    return $QuestionEntitiesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FirstListEntitiesTable firstListEntities =
      $FirstListEntitiesTable(this);
  late final $SecondListEntitiesTable secondListEntities =
      $SecondListEntitiesTable(this);
  late final $QuestionEntitiesTable questionEntities =
      $QuestionEntitiesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [firstListEntities, secondListEntities, questionEntities];
}
