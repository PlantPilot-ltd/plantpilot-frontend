import 'package:app/repositories/index.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

import 'tent_controllers_list_presenter.dart';

class TentControllersListScreen extends StatefulWidget {
  const TentControllersListScreen({super.key});
  @override
  _TentControllersListScreenState createState() =>
      _TentControllersListScreenState();
}

class _TentControllersListScreenState extends VPDScreenState<
    TentControllersListScreen, TentControllersListPresenter> {
  TentContollersRepository get dataStore => presenter.dataStore;

  @override
  void initState() {
    presenter = TentControllersListPresenter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tent Controllers'),
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: dataStore.controllers.length,
            itemBuilder: (context, index) {
              final controller = dataStore.controllers[index];
              return ListTile(
                title: Text(controller.name),
                subtitle: Text(controller.id),
              );
            },
          );
        },
      ),
    );
  }
}
