import 'package:flutter/material.dart';
import 'package:places/environment/build_config.dart';
import 'package:places/environment/environment.dart';
import 'package:places/setup_app.dart';

void defineEnvironment(BuildConfig buildConfig) {
  Environment.init(BuildType.dev, buildConfig);
}

BuildConfig _setUpConfig() {
  return const BuildConfig(envString: '(Debug mode)');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  defineEnvironment(_setUpConfig());

  await setupApp();
}
