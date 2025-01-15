import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

import 'package:app/presentation/screens/greenhouses_list/greenhouses_list_presenter.dart';

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
      appBar: CoreUiAppBar(title: context.localization.ghListTitle),
      body: Observer(
        builder: (context) {
          if (dataStore.isLoading) {
            return const _LoadingView();
          }
          if (dataStore.greenhouses.isEmpty) {
            return const _EmptyView();
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
    return const Center(child: CircularProgressIndicator());
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No controllers found'),
    );
  }
}
