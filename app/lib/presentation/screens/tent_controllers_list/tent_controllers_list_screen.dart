import 'package:app/repositories/index.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

import 'tent_controllers_list_dependencies.dart';
import 'tent_controllers_list_presenter.dart';

class TentControllersListScreen extends StatefulWidget {
  final TentControllersListDependencies dependencies;

  const TentControllersListScreen({super.key, required this.dependencies});

  @override
  _TentControllersListScreenState createState() =>
      _TentControllersListScreenState();
}

class _TentControllersListScreenState extends VPDScreenState<
    TentControllersListScreen, TentControllersListPresenter> {
  TentContollersRepository get dataStore => presenter.dataStore;

  @override
  void initState() {
    presenter = TentControllersListPresenter(widget.dependencies);
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
          if (dataStore.isLoading) {
            return _LoadingView();
          }
          if (dataStore.controllers.isEmpty) {
            return _EmptyView();
          }
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

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No controllers found'),
    );
  }
}
