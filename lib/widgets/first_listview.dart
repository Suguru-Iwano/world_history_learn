import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:world_history_learn/model/model.dart';
import 'package:world_history_learn/repositories/repository.dart';
import 'package:world_history_learn/utils/my_flutter_app_icons.dart';
import 'package:world_history_learn/widgets/second_listview.dart';

// final db = new MyDatabaseRepository();

final activeListItemIdProvider = StateProvider((ref) => 0);
final titleTextProvider = StateProvider((ref) => '');
final secondListViewPositionLeftProvider = StateProvider((ref) => 600.0);

class MenuPage extends ConsumerWidget {
  final double _seekSecondListView = 60;
  final double _hideSecondListView = 600;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return _buildContents;
  }

  Widget get _buildContents {
    return Consumer(builder: (context, watch, _) {
      final _listItem = watch(firstListStreamProvider);
      final _secondListViewPositionLeft =
          watch(secondListViewPositionLeftProvider).state;
      final _activeListItemId = watch(activeListItemIdProvider).state;
      final titleText = watch(titleTextProvider).state;

      return Scaffold(
          appBar: AppBar(
              // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              title: Text(titleText,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              )),
          body: Stack(
            children: <Widget>[
              _listItem.when(
                data: (data) => _buildFirstList(data, _activeListItemId),
                loading: () => LoadingView(),
                error: (error, _) => ErrorView(error),
              ),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 150),
                  left: _secondListViewPositionLeft,
                  top: 0,
                  width: 999,
                  height: 999,
                  child: SecondListView(0))
            ],
          ));
    });
  }

  Widget _buildFirstList(List<FirstList> listItem, int activateListItemId) {
    print('build');
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: SizedBox(
                height: 50,
                child: ListTile(
                  title: Text(
                    '${listItem[index].title}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  leading: _generateIcon(listItem[index].icon),
                  selected: activateListItemId == listItem[index].id,
                  onTap: () {
                    _tapTile(listItem[index]);
                    //同じカードをタップした時
                    if (activateListItemId == listItem[index].id) {
                      context.read(activeListItemIdProvider).state = 0;
                      context.read(titleTextProvider).state = '';
                      context.read(secondListViewPositionLeftProvider).state =
                          _hideSecondListView;
                    } else {
                      context.read(activeListItemIdProvider).state =
                          listItem[index].id;
                      context.read(titleTextProvider).state =
                          listItem[index].title;
                      context.read(secondListViewPositionLeftProvider).state =
                          _seekSecondListView;
                    }
                  },
                )));
      },
      itemCount: listItem.length,
    );
  }

  void _tapTile(_listItem) {
    print(_listItem.id);
    SecondListView(_listItem.id);
  }
}

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('load');
    return ListView();
  }
}

class ErrorView extends StatelessWidget {
  final error;
  ErrorView(this.error);

  @override
  Widget build(BuildContext context) {
    print('error');
    return ListView();
  }
}

Icon _generateIcon(String _iconType) {
  switch (_iconType) {
    case 'fighter_jet':
      return const Icon(MyFlutterApp.fighter_jet);
    case 'anchor':
      return const Icon(Icons.anchor);
    case 'meat':
      return const Icon(MyFlutterApp.meat);
    case 'help':
      return const Icon(MyFlutterApp.help);
    case 'bomb':
      return const Icon(MyFlutterApp.bomb);
  }
  return const Icon(Icons.accessibility);
}
