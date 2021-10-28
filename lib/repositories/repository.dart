import 'package:flutter_riverpod/all.dart';
import 'package:world_history_learn/model/model.dart';
import 'package:world_history_learn/service/db.dart';

final firstListStreamProvider = StreamProvider.autoDispose<List<FirstList>>(
    (ref) => MyDatabaseRepository().getFirstLists());

final secondListProvider = Provider.family<Future<List<SecondList>>, int>(
    (ref, parentId) => MyDatabaseRepository().getSecondLists(parentId));

class MyDatabaseRepository {
  late MyDatabase _database;

  MyDatabaseRepository() {
    _database = MyDatabase.getInstance();
  }

  /// FirstListの読み出し
  Stream<List<FirstList>> getFirstLists() {
    final _firstList = _database.findAllOrderByCreated;
    return _firstList.map<List<FirstList>>((firstLists) {
      List<FirstList> result = [];

      for (FirstListEntitie fl in firstLists) {
        result.add(FirstList(
          fl.id,
          fl.title,
          fl.icon,
        ));
      }
      return result;
    });
  }

  /// SecondListの読み出し
  Future<List<SecondList>> getSecondLists(int parentId) async {
    final _secondList = await _database.findById_secondList(parentId);
    List<SecondList> result = [];

    for (SecondListEntitie fl in _secondList) {
      result.add(SecondList(
        fl.id,
        fl.parentId,
        fl.title,
      ));
    }
    return result;
  }
  // /// 全てのFirstListを取得する
  // Future<List<FirstList>> getFirstList() {
  //   List<FirstList> result = [];
  //
  //   for (FirstListEntitie fl in _firstLists) {
  //     result.add(FirstList(
  //       fl.id,
  //       fl.title,
  //       fl.icon,
  //     ));
  //   }
  //   return result;
  // }
}
