import 'package:app/providers/app_injection_provider.dart';
import 'package:go_router/go_router.dart';
import 'index.dart';
import 'tent_controllers_list_dependencies.dart';

final class TentControllersListRouter {
  static const String routePath = '/controllers';
  static const String routeName = 'tent_controllers_list';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: TentControllersListScreen(
            dependencies: TentControllersListDependencies(
              tentContollersRepository:
                  AppInjectionProvider.tentContollersRepository,
            ),
          ),
        ),
      );
}

extension TentControllersListRouterX on GoRouter {
  void goTentControllersList() => goNamed(TentControllersListRouter.routeName);
}
