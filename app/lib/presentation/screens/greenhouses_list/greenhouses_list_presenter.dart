import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

class GreenhousesListPresenter extends VPDPresenter<GreenhousesListRepository> {
  GreenhousesListPresenter(GreenhousesListDependencies dependencies)
      : super(dataStore: dependencies.repository);
}
