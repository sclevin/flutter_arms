import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arms/main/app.dart';
import 'package:flutter_arms/main/app_env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main/observers.dart';

void main() => appInitialization(AppEnvironment.DEV);

Future<void> appInitialization(AppEnvironment environment)async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: App(),
  ));
}

