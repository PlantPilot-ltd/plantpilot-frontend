import 'package:app/presentation/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GlobalObjectKey<NavigatorState> get rootNavigatorKey =>
      GlobalObjectKey<NavigatorState>('rootNavigatorKey');

  final GoRouter router;

  const AppRouter(this.router);

  factory AppRouter.create() {
    final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: TentControllersListRouter.routePath,
      navigatorKey: rootNavigatorKey,
      // onException: (_, __, router) => router.go(AppRouteNames.exception.name),
      // redirect: (context, state) {
      //   for (final routeGuard in sortedRouteGuards) {
      //     final location = routeGuard.onNavigate(context, state);
      //     if (location != null) {
      //       return location;
      //     }
      //   }

      //   return null;
      // },
      // refreshListenable: Listenable.merge(
      //   sortedRouteGuards
      //       .map((routeGuard) => routeGuard.listenable)
      //       .whereType<Listenable>(),
      // ),
      // observers: navigatorObservers.toList(),
      routes: [RootRouter.route],
    );
    return AppRouter(router);
  }
}
