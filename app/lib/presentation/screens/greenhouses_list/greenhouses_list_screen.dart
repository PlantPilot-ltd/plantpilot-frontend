import 'package:app/repositories/index.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

import 'greenhouses_list_dependencies.dart';
import 'greenhouses_list_presenter.dart';

class GreenhousesListScreen extends StatefulWidget {
  final GreenhousesListDependencies dependencies;
  const GreenhousesListScreen({super.key, required this.dependencies});
  @override
  _GreenhousesListScreenState createState() => _GreenhousesListScreenState();
}

class _GreenhousesListScreenState
    extends VPDScreenState<GreenhousesListScreen, GreenhousesListPresenter> {
  GreenhousesListRepository get dataStore => presenter.dataStore;

  @override
  void initState() {
    presenter = GreenhousesListPresenter(widget.dependencies);
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
          if (dataStore.greenhouses.isEmpty) {
            return _EmptyView();
          }
          return ListView.builder(
            itemCount: dataStore.greenhouses.length,
            itemBuilder: (context, index) {
              final controller = dataStore.greenhouses[index];
              return ListTile(
                title: Text(controller.name),
                subtitle: Text(controller.remoteId),
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
