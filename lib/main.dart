import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Color(
          0xFF007ADD))),
      // supportedLocales: AppLocalizations.supportedLocales,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // theme: AppTheme(isDarkMode).getTheme(),
    );
  }
}