import 'package:core/core.dart';

final class AppConstantsProvider {
  static const _buildEnvironmentType = String.fromEnvironment(
    'ENVIRONMENT_TYPE',
    defaultValue: 'dev',
  );

  static EnvironmentType get environmentType =>
      EnvironmentTypeParser.fromString(_buildEnvironmentType);
}
