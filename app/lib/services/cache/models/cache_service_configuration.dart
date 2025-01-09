import 'package:core/core.dart';

class CacheServiceConfiguration {
  final EnvironmentType environmentType;

  final String directory;

  const CacheServiceConfiguration({
    required this.environmentType,
    required this.directory,
  });
}
