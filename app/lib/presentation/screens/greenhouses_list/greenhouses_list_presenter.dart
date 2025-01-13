import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

import 'greenhouses_list_dependencies.dart';

class GreenhousesListPresenter extends VPDPresenter<GreenhousesListRepository> {
  GreenhousesListPresenter(GreenhousesListDependencies dependencies)
      : super(dataStore: dependencies.repository);
}
