
import 'package:mobilyst/kategoriler_ekrani/yemekKategori.dart';

class VerilerRepository {
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

  List<YemekCesiti>cesitler=[
    YemekCesiti(kategoriAdi: 'Pizza', cesitAdi: 'Salamlı Pizza'),
    YemekCesiti(kategoriAdi: 'Pizza', cesitAdi: 'Peynirli Pizza')


  ];

}
