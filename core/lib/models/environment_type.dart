part of '../core.dart';

enum EnvironmentType { development, production, mock }

extension EnvironmentTypeParser on EnvironmentType {
  static EnvironmentType fromString(String type) {
    switch (type) {
      case "prod":
        return EnvironmentType.production;
      case "dev":
        return EnvironmentType.development;
      case "mock":
        return EnvironmentType.mock;
      default:
        return EnvironmentType.mock;
    }
  }

  String get name {
    switch (this) {
      case EnvironmentType.development:
        return "dev";
      case EnvironmentType.production:
        return "prod";
      case EnvironmentType.mock:
        return "mock";
    }
  }
}
