import 'package:places/environment/build_config.dart';

enum BuildType {
  dev,
  prod,
}

class Environment {
  static late Environment _environment;

  final BuildType buildType;
  final BuildConfig buildConfig;

  static Environment get instance => _environment;

  const Environment._({
    required this.buildType,
    required this.buildConfig,
  });

  static void init(
    BuildType buildType,
    BuildConfig buildConfig,
  ) {
    _environment = Environment._(
      buildType: buildType,
      buildConfig: buildConfig,
    );
  }
}
