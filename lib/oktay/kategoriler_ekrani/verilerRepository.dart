import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/yemekKategori.dart';

class VerilerRepository extends ChangeNotifier {
  List<YemekKategorisi> kategoriler = [
    YemekKategorisi(
        kategoriAdi: 'Pizza',
        kategoriResimUrl:
            'https://cdn-icons-png.flaticon.com/128/1404/1404945.png'),
    YemekKategorisi(
        kategoriAdi: 'Hamburger',
        kategoriResimUrl:
            'https://cdn-icons-png.flaticon.com/128/3075/3075929.png')
  ];

  List<YemekCesiti> cesitler = [
    YemekCesiti(kategoriAdi: 'Pizza', cesitAdi: 'Salamlı Pizza'),
    YemekCesiti(kategoriAdi: 'Pizza', cesitAdi: 'Peynirli Pizza'),
    YemekCesiti(kategoriAdi: 'Hamburger', cesitAdi: 'Tavuk Burger'),
  ];

  List<YemekCesiti> cesitleriGetir(String kategoriAdi) {
    List<YemekCesiti> result = [];

    for (var cesit in cesitler) {
      if(cesit.kategoriAdi==kategoriAdi){
        result.add(cesit);
      }
    }

    return result;
  }

  List<YemekKategorisi> kategorileriGetir() {
    List<YemekKategorisi> result = [];

    for (var kategori in kategoriler) {
      result.add(kategori);
    }

    return result;
  }
}

final verilerRepositoryProvider =
    ChangeNotifierProvider((ref) => VerilerRepository());
