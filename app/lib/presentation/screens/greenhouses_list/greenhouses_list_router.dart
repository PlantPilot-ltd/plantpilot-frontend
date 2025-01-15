import 'package:app/presentation/index.dart';
import 'package:app/providers/index.dart';
import 'package:go_router/go_router.dart';

final class GreenhousesListRouter {
  static const String routePath = '/greenhouses';
  static const String routeName = 'greenhouses_list';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: GreenhousesListScreen(
            dependencies: GreenhousesListDependencies(
              repository: AppInjectionProvider.greenhousesListRepository,
            ),
          ),
        ),
      );
}

extension GreenhousesListRouterX on GoRouter {
  void goGreenhousesList() => goNamed(GreenhousesListRouter.routeName);
}
