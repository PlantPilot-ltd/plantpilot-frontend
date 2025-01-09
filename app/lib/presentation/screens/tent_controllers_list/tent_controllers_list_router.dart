import 'package:go_router/go_router.dart';
import 'index.dart';

final class TentControllersListRouter {
  static const String routePath = '/controllers';
  static const String routeName = 'tent_controllers_list';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TentControllersListScreen(),
        ),
      );
}

extension TentControllersListRouterX on GoRouter {
  void goTentControllersList() => goNamed(TentControllersListRouter.routeName);
}
