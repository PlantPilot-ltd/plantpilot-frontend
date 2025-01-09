import 'package:go_router/go_router.dart';

extension RouterExtension on GoRouterState {
  T? getObjectById<T>(
    GoRouterState state,
    T? Function(String id) fetcher,
  ) {
    final id = state.pathParameters['id'];
    if (id == null) return null;
    return fetcher(id);
  }
}
