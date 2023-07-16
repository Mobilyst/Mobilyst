import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilyst/Anasayfa/AnaSayfa.dart';
import 'package:mobilyst/Anasayfa/DetayliBilgiSayfasi.dart';
import 'package:mobilyst/Anasayfa/KampanyalarSayfasi.dart';
import 'package:mobilyst/GirisOlaylari/girisPage.dart';
import 'package:mobilyst/GirisOlaylari/tabs/sifreUnuttumPage.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/hesapBilgilerimPage.dart';
import 'package:mobilyst/NavBar/navigationBar.dart';
import 'package:mobilyst/food_comparison_screen/food_comparison_screen.dart';
import 'package:mobilyst/Hesabim/hesabimPage.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/cesitlerEkrani.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/kategorilerSayfasi.dart';
import 'package:mobilyst/oktay/yemek_ekrani/yemekEkrani.dart';
import 'package:mobilyst/screens.onboarding/screen_one.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAnaSayfaKey =
    GlobalKey<NavigatorState>(debugLabel: 'AnaSayfashell');
final _shellNavigatorKategoriSayfaKey =
    GlobalKey<NavigatorState>(debugLabel: 'KategoriSayfashell');
final _shellNavigatorHesabimSayfaKey =
    GlobalKey<NavigatorState>(debugLabel: 'HesabimSayfashell');

final goRouter = GoRouter(
  initialLocation: '/onboard',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/onboard',
      builder: (context, state) => OnboardingScreenOne(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAnaSayfaKey,
          routes: [
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AnaSayfa(
                  detailsPath: '/a/yemek',
                ),
              ),
              routes: [
                GoRoute(
                  path: 'yemek',
                  builder: (context, state) => const YemekKiyasTumuPage(),
                ),
                GoRoute(
                  path: 'kampanya',
                  builder: (context, state) => const KampanyalarSayfasi(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKategoriSayfaKey,
          routes: [
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: YemekKategorileriSayfasi(detailsPath: '/b/cesit'),
              ),
              routes: [
                GoRoute(
                  path: 'cesit',
                  builder: (context, state) => MyYemekKategoriPage(
                    kategoriAdi: '',
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHesabimSayfaKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/hesabim',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: GirisPage(detailsPath: '/hesabim'),
              ),
              routes: [
                GoRoute(
                  path: 'sifre',
                  builder: (context, state) => MyForgetPasswordPage(),
                ),
                GoRoute(
                  path: 'signin',
                  builder: (context, state) => const HesabimPage(),
                ),
                GoRoute(
                  path: 'hesapbilgi',
                  builder: (context, state) => const HesapBilgileriPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
