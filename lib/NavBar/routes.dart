import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilyst/Anasayfa/AnaSayfa.dart';
import 'package:mobilyst/Anasayfa/KampanyalarSayfasi.dart';
import 'package:mobilyst/GirisOlaylari/girisPage.dart';
import 'package:mobilyst/haritaPage.dart';
import 'package:mobilyst/NavBar/navigationBar.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/kategorilerSayfasi.dart';

class Routes {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavigationBarPage()),
    GetPage(name: home, page: () => const AnaSayfa()),
    GetPage(name: kategori, page: () => const YemekKategorileriSayfasi()),
    GetPage(name: harita, page: () => const HaritaPage()),
    GetPage(name: hesabim, page: () => const GirisPage()),
    GetPage(
      name: kampanyalar,
      page: () => const KampanyalarSayfasi(),
    )
  ];

  static getnavbar() => navbar;
  static gethome() => home;
  static getkategori() => kategori;
  static getharita() => harita;
  static gethesabim() => hesabim;
  static getkampanyalar() => kampanyalar;

  static String navbar = '/';
  static String home = '/home';
  static String kategori = '/kategori';
  static String harita = '/harita';
  static String hesabim = '/hesabim';
  static String kampanyalar = '/home/kampanyalar';
}
