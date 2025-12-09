import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:story_teller_nomad_landing_page/config/models/repo_config/repo_config.dart';
import 'package:story_teller_nomad_landing_page/config/router/router.dart';
import 'package:story_teller_nomad_landing_page/firebase_options.dart';
import 'package:story_teller_nomad_landing_page/theme/theme.dart';

void main() async {
  final getIt = GetIt.instance;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getIt.registerSingleton<RepoConfig>(
    RepoConfig(
      cloudName: 'dp1e3otpc',
      apiKey: '329245894549578',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: buildTheme(Brightness.dark),
    );
  }
}
