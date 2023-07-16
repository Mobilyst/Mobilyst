import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilyst/Anasayfa/DetayliBilgiSayfasi.dart';
import 'package:mobilyst/Anasayfa/KampanyalarSayfasi.dart';
import 'package:mobilyst/Anasayfa/Urun.dart';
import 'package:mobilyst/anasayfaogeleri/cigkofte.dart';
import 'package:mobilyst/anasayfaogeleri/doner.dart';
import 'package:mobilyst/anasayfaogeleri/etliyemekler.dart';
import 'package:mobilyst/anasayfaogeleri/hamburger.dart';
import 'package:mobilyst/anasayfaogeleri/icecek.dart';
import 'package:mobilyst/anasayfaogeleri/lahmacun.dart';
import 'package:mobilyst/anasayfaogeleri/patateskizartmasi.dart';
import 'package:mobilyst/anasayfaogeleri/pizza.dart';
import 'package:mobilyst/anasayfaogeleri/salata.dart';
import 'package:mobilyst/anasayfaogeleri/sandiwic.dart';
import 'package:mobilyst/anasayfaogeleri/tatli.dart';
import 'package:mobilyst/anasayfaogeleri/tavuk.dart';
import 'package:mobilyst/food_comparison_screen/food_comparison_screen.dart';
import '../ColorAndType/color.dart';
import 'KampanyaRepository.dart';

class AnaSayfa extends ConsumerWidget {
  final String detailsPath;
  const AnaSayfa({Key? key, required this.detailsPath}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    var screenHeight = MediaQuery.of(context).size.height;
    final kampanyaRepository = ref.watch(kampanyaProvider);
    final List<List<kampanyalar>> kampanyaliUrunler =
        kampanyaRepository.urunler;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yemek Kılavuzu",
          style: TextStyle(
            color: AppColors.bir,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: AppColors.uc,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 5),
                  const Icon(Icons.fastfood),
                  const SizedBox(width: 5),
                  const Text(
                    "Öğünleri kıyasla",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 190),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const YemekKiyasTumuPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text("Tümü"),
                  ),
                ],
              ),
              SizedBox(
                height: 1,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PizzaTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://images.deliveryhero.io/image/fd-tr/LH/m6n3-listing.jpg'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Pizza',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SandiwichTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://images.deliveryhero.io/image/fd-tr/LH/sx5y-hero.jpg'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Sandwich',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LahmacunTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://i4.hurimg.com/i/hurriyet/75/750x422/5f71d3117af50732b4b9d1ed.jpg',
                                ),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Lahmacun',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HamburgerTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://assets.epicurious.com/photos/57c5c6d9cf9e9ad43de2d96e/master/w_1000,h_684,c_limit/the-ultimate-hamburger.jpg',
                                ),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Hamburger',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DonerTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://images.deliveryhero.io/image/fd-tr/LH/ig4d-hero.jpg',
                                ),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Döner',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PatatesKizartmasiTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://sanpagida.com.tr/wp-content/uploads/2021/09/patates-nasil-kizartilir-930x620.png',
                                ),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Kızartma',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TatliTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://images.deliveryhero.io/image/fd-tr/LH/xicd-hero.jpg',
                                ),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Tatlı',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EtliYemekTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://iasbh.tmgrup.com.tr/51e3b7/752/395/0/92/1177/711?u=https://isbh.tmgrup.com.tr/sbh/2020/03/12/kusbasi-etli-turlu-tarifi-turlu-nasil-yapilir-1584004774381.jpg',
                                ),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Kebap ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TavukTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://www.yemektarifi.com/wp-content/uploads/2017/06/baharatli-tavuk-kanat.jpg'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Tavuk',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CigKofteTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://images.deliveryhero.io/image/fd-tr/LH/p5eb-hero.jpg'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Çiğ Köfte',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SalataTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://i4.hurimg.com/i/hurriyet/75/750x422/5cb07cc1c03c0e53e4ce9cf5.jpg'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Salata',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(6),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: AppColors.yedi,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const IcecekTumuPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://www.hattena.com.tr/uploads/m_Yemekler/detay/hattena-gazli-icecekler-698.png'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'İçecek',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const SizedBox(width: 5),
                  const Icon(Icons.card_giftcard),
                  const SizedBox(width: 5),
                  const Text(
                    "Öne çıkan kampanyalar",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 130),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const KampanyalarSayfasi(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      "Tümü",
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: kampanyaliUrunler.isNotEmpty
                      ? kampanyaliUrunler
                          .expand((urunler) => urunler)
                          .take(6)
                          .toList()
                          .asMap()
                          .entries
                          .map((entry) {
                          final index = entry.key;
                          final urun = entry.value;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 180,
                              child: Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(5),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.black26,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetayliBilgiSayfasi(
                                          id: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 290,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 3),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Ink.image(
                                            image: NetworkImage(urun.ResimUrl),
                                            height: 200,
                                            width: 170,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(height: 0.5),
                                        Text(
                                          urun.Baslik,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetayliBilgiSayfasi(
                                                  id: index,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Detaylı bilgi için tıklayınız",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.yedi,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 0.5),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList()
                      : [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
