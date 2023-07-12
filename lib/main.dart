import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/NavBar/goRouter.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = new MyHttpOverrides();
  usePathUrlStrategy();
  runApp(ProviderScope(child: const MyApp()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void usePathUrlStrategy() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: MaterialColor(
          AppColors.iki.value, // AppColors.iki renginin değerini kullanın
          <int, Color>{
            50: AppColors.iki.withOpacity(0.1),
            100: AppColors.iki.withOpacity(0.2),
            200: AppColors.iki.withOpacity(0.3),
            300: AppColors.iki.withOpacity(0.4),
            400: AppColors.iki.withOpacity(0.5),
            500: AppColors.iki.withOpacity(0.6),
            600: AppColors.iki.withOpacity(0.7),
            700: AppColors.iki.withOpacity(0.8),
            800: AppColors.iki.withOpacity(0.9),
            900: AppColors.iki.withOpacity(1),
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: OnboardingScreenOne(),
    );
  }
}
