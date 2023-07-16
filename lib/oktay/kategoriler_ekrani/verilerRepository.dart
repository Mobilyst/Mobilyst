import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/anasayfaogeleri/hamburger.dart';
import 'package:mobilyst/anasayfaogeleri/lahmacun.dart';
import 'package:mobilyst/anasayfaogeleri/patateskizartmasi.dart';
import 'package:mobilyst/anasayfaogeleri/pizza.dart';
import 'package:mobilyst/anasayfaogeleri/salata.dart';
import 'package:mobilyst/anasayfaogeleri/sandiwic.dart';
import 'package:mobilyst/anasayfaogeleri/sos.dart';
import 'package:mobilyst/anasayfaogeleri/tatli.dart';
import 'package:mobilyst/anasayfaogeleri/tavuk.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/yemekKategori.dart';

import '../../anasayfaogeleri/cigkofte.dart';
import '../../anasayfaogeleri/doner.dart';
import '../../anasayfaogeleri/etliyemekler.dart';
import '../../anasayfaogeleri/icecek.dart';

class VerilerRepository extends ChangeNotifier {
  List<YemekKategorisi> yemekKategorileri = [
    YemekKategorisi(
        kategoriAdi: 'Çiğköfte',
        kategoriResimUrl:
            'https://images.deliveryhero.io/image/fd-tr/LH/p5eb-hero.jpg',
        kategoriPath: const CigKofteTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Döner',
        kategoriResimUrl:
            'https://images.deliveryhero.io/image/fd-tr/LH/ig4d-hero.jpg',
        kategoriPath: const DonerTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Etli Yemekler',
        kategoriResimUrl:
        'https://iasbh.tmgrup.com.tr/51e3b7/752/395/0/92/1177/711?u=https://isbh.tmgrup.com.tr/sbh/2020/03/12/kusbasi-etli-turlu-tarifi-turlu-nasil-yapilir-1584004774381.jpg',
        kategoriPath: const EtliYemekTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Hamburger',
        kategoriResimUrl:
        'https://assets.epicurious.com/photos/57c5c6d9cf9e9ad43de2d96e/master/w_1000,h_684,c_limit/the-ultimate-hamburger.jpg',
        kategoriPath: const HamburgerTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'İçecekler',
        kategoriResimUrl:
        'https://www.hattena.com.tr/uploads/m_Yemekler/detay/hattena-gazli-icecekler-698.png',
        kategoriPath: const IcecekTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Lahmacun',
        kategoriResimUrl:
        'https://i4.hurimg.com/i/hurriyet/75/750x422/5f71d3117af50732b4b9d1ed.jpg',
        kategoriPath: const LahmacunTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Patates kızartması',
        kategoriResimUrl:
        'https://sanpagida.com.tr/wp-content/uploads/2021/09/patates-nasil-kizartilir-930x620.png',
    kategoriPath: const PatatesKizartmasiTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Pizza',
        kategoriResimUrl:
        'https://images.deliveryhero.io/image/fd-tr/LH/m6n3-listing.jpg',
        kategoriPath: const PizzaTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Salata',
        kategoriResimUrl:
        'https://i4.hurimg.com/i/hurriyet/75/750x422/5cb07cc1c03c0e53e4ce9cf5.jpg',
        kategoriPath: const SalataTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Sandwich',
        kategoriResimUrl:
        'https://images.deliveryhero.io/image/fd-tr/LH/sx5y-hero.jpg',
        kategoriPath: const SandiwichTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Soslar',
        kategoriResimUrl:
        'https://www.birbes.com/wp-content/uploads/2018/11/T%C3%BCrk-ve-D%C3%BCnya-Mutfa%C4%9F%C4%B1n%C4%B1n-Damak-Tad%C4%B1-Soslar-Nas%C4%B1l-Haz%C4%B1rlan%C4%B1r.jpg',
        kategoriPath: const SosTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Tatlılar',
        kategoriResimUrl:
        'https://images.deliveryhero.io/image/fd-tr/LH/xicd-hero.jpg',
        kategoriPath: const TatliTumuPage()),
    YemekKategorisi(
        kategoriAdi: 'Tavuk Yemekleri',
        kategoriResimUrl:
        'https://www.yemektarifi.com/wp-content/uploads/2017/06/baharatli-tavuk-kanat.jpg',
        kategoriPath: const TavukTumuPage()),
  ];

  List<YemekKategorisi> kategorileriGetir() {

    List<YemekKategorisi> result =[];
    for(var kategori in yemekKategorileri){
      result.add(kategori);
    }


    return result;
  }

  }



final verilerRepositoryProvider =
    ChangeNotifierProvider((ref) => VerilerRepository());
