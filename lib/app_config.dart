enum AppEnv { dev, staging, pro }

enum BuildType { dev, release }

class AppConfig {
  static final AppConfig _singleton = AppConfig._internal();

  factory AppConfig() {
    return _singleton;
  }

  AppConfig._internal();

  AppEnv env = AppEnv.dev;

  BuildType buildType = BuildType.dev;

  String getApiUrl() {
    switch (env) {
      case AppEnv.dev:
        return '';
      case AppEnv.staging:
        return '';
      case AppEnv.pro:
        return '';
      default:
        return '';
    }
  }
}
