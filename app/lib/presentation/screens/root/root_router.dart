import 'package:app/presentation/index.dart';
import 'package:app/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class RootRouter {
  static const String routePath = '/';
  static const String routeName = 'root';

  static GlobalObjectKey<NavigatorState> get _controllersListKey =>
      GlobalObjectKey<NavigatorState>('controllersListKey');
  static GlobalObjectKey<NavigatorState> get _profileKey =>
      GlobalObjectKey<NavigatorState>('profileKey');

  static StatefulShellRoute get route => StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => RootScreen(
          dependencies: RootDependencies(
            router: AppInjectionProvider.router,
            navigationShell: navigationShell,
          ),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _controllersListKey,
            routes: [GreenhousesListRouter.route],
          ),
          StatefulShellBranch(
            navigatorKey: _profileKey,
            routes: [ProfileRouter.route],
          ),
        ],
      );
}

extension RootRouterX on GoRouter {
  void goRoot() => goNamed(GreenhousesListRouter.routeName);
}
