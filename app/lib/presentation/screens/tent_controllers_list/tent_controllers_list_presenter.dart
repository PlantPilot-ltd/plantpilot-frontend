import 'package:app/providers/index.dart';
import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

class TentControllersListPresenter
    extends VPDPresenter<TentContollersRepository> {
  TentControllersListPresenter()
      : super(dataStore: AppInjectionProvider.tentContollersRepository);
}
