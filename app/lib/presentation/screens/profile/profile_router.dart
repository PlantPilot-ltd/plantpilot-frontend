import 'package:go_router/go_router.dart';
import 'index.dart';

final class ProfileRouter {
  static const String routePath = '/profile';
  static const String routeName = 'profile';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ProfileScreen(),
        ),
      );
}

extension ProfileRouterX on GoRouter {
  void goProfile() => goNamed(ProfileRouter.routeName);
}
