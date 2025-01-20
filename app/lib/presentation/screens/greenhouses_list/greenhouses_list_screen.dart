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
          return ListView(
            children: [
              /// Controllers list
              SizedBox(
                height: GreenhouseControllerTile.sizeFor(context).height,
                child: ListView.builder(
                  itemCount: dataStore.greenhouses.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, index) {
                    final controller = dataStore.greenhouses[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GreenhouseControllerTile(
                        controller: controller,
                        onTap: () => presenter.onControllerTap(controller),
                      ),
                    );
                  },
                ),
              ),
            ],
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
    final size = MediaQuery.sizeOf(context).shortestSide * 0.6;
    return Center(child: LeavesLoading(size: size));
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.localization.ghListEmptyTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: CoreUIColors.text,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            context.localization.ghListEmptyDesc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: CoreUIColors.secondaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
