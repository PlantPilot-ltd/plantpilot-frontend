import 'package:app/presentation/index.dart';
import 'package:go_router/go_router.dart';

class RootDependencies {
  const RootDependencies({
    required this.router,
    required this.navigationShell,
  });

  final AppRouter router;
  final StatefulNavigationShell navigationShell;
}
