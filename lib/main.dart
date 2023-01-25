import 'package:flutter/material.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/settings/settings_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsModel()),
      ],
      child: const App(),
    ),
  );
}
