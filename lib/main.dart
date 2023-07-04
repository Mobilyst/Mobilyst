import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobilyst/Anasayfa/AnaSayfa.dart';
import 'package:mobilyst/GirisOlaylari/girisPage.dart';
import 'package:mobilyst/NavBar/goRouter.dart';
import 'package:mobilyst/NavBar/navigationBar.dart';
import 'package:mobilyst/screens.onboarding/screen_one.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Hesabim/hesabimPage.dart';
import 'firebase_options.dart';
import 'haritaPage.dart';
import 'oktay/kategoriler_ekrani/kategorilerSayfasi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
  usePathUrlStrategy();
  runApp(ProviderScope(child: const MyApp()));
}

void usePathUrlStrategy() {
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
       routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     // home: OnboardingScreenOne(),
    );
  }
}
