import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilyst/Anasayfa/AnaSayfa.dart';
import 'package:mobilyst/Anasayfa/KampanyalarSayfasi.dart';
import 'package:mobilyst/GirisOlaylari/girisPage.dart';
import 'package:mobilyst/GirisOlaylari/tabs/sifreUnuttumPage.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/hesapBilgilerimPage.dart';
import 'package:mobilyst/NavBar/navigationBar.dart';
import 'package:mobilyst/food_comparison_screen/food_comparison_screen.dart';
import 'package:mobilyst/hesabim/hesabimPage.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/kategorilerSayfasi.dart';
import 'package:mobilyst/screens.onboarding/screen_one.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAnaSayfaKey =
    GlobalKey<NavigatorState>(debugLabel: 'AnaSayfashell');
final _shellNavigatorKategoriSayfaKey =
    GlobalKey<NavigatorState>(debugLabel: 'KategoriSayfashell');
final _shellNavigatorHesabimSayfaKey =
    GlobalKey<NavigatorState>(debugLabel: 'HesabimSayfashell');

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
     GoRoute(
              path: '/',
              pageBuilder: (context, state) => NoTransitionPage(
                child: OnboardingScreenOne(),
              ),
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
                child: AnaSayfa (),
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
            // Shopping Cart
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: YemekKategorileriSayfasi(detailsPath: '/b/cesit'),
              ),
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
                child: GirisPage(detailsPath: '/hesabim/sifre'),
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
