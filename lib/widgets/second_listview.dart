import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final secondListViewPositionLeftProvider = StateProvider<int>((ref) => 600);
final parentIdProvider = StateProvider<int>((ref) => 0);

class SecondListView extends ConsumerWidget {
  var _listItem;
  SecondListView(this._listItem);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final parentId = watch(parentIdProvider);

    return Scaffold(
        backgroundColor: Colors.black26,
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  _tapTile(_listItem[index].id);
                },
                title: Text(
                  '${_listItem[index].title}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
          itemCount: _listItem.length,
        ));
  }

  void _tapTile(int id) {
    print(id);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => SecondListView(),
    //     ));
  }
}
