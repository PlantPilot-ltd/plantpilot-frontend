import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

import 'tent_controllers_list_dependencies.dart';

class TentControllersListPresenter
    extends VPDPresenter<TentContollersRepository> {
  TentControllersListPresenter(TentControllersListDependencies dependencies)
      : super(dataStore: dependencies.tentContollersRepository);
}
