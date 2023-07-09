import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilyst/Anasayfa/DetayliBilgiSayfasi.dart';
import 'package:mobilyst/Anasayfa/KampanyalarSayfasi.dart';
import 'package:mobilyst/food_comparison_screen/food_comparison_screen.dart';
import 'package:mobilyst/screens.onboarding/constant.dart';
import '../ColorAndType/color.dart';
import 'KampanyaRepository.dart';

class AnaSayfa extends ConsumerWidget {
  const AnaSayfa({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    var ScreenHeight = MediaQuery.of(context).size.height;
    var kampanyaRepository = ref.watch(kampanyaProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Yemek Kılavuzu",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: AppColors.uc,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                // Add padding around the search bar
                // Use a Material design search bar
                children: <Widget>[
                  const SizedBox(height: 6),
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Ara...',
                      // Add a clear button to the search bar
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: AppColors.yedi,
                        ),
                        onPressed: () => searchController.clear(),
                      ),
                      // Add a search icon or button to the search bar
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: AppColors.yedi,
                        ),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color:
                              Colors.grey, // Normal durumda kenar çizgi rengi
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors
                              .grey, // Tiklandiktan sonra kenar çizgi rengi
                          width: 2.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal:
                              15), // Boyutunu küçültmek için padding ayarı
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.fastfood),
                      const SizedBox(width: 5),
                      const Text("Öğünleri kıyasla",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start),
                      const SizedBox(width: 190),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const YemekKiyasTumuPage()),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.grey,
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text("Tümü")),
                    ],
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        const SizedBox(width: 15),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey, // Kenar çizgisi rengi
                              width: 00.5, // Kenar çizgisi kalınlığı
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(6),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              splashColor: AppColors.yedi,
                              // splashColor: Colors.amber[900],
                              onTap: () {},
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  Ink.image(
                                    image: const NetworkImage(
                                        'https://cdn.yeniakit.com.tr/images/news/940/hangi-sehirde-hangi-yemek-yenir-2h1580033203-e7124c.jpg'),
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'All',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
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
                              color: Colors.grey, // Kenar çizgisi rengi
                              width: 00.5, // Kenar çizgisi kalınlığı
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(6),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              splashColor: AppColors.yedi,
                              onTap: () {},
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  Ink.image(
                                    image: const NetworkImage(
                                        'https://potatorolls.com/wp-content/uploads/Lumberjack-Breakfast3-686x640.jpg'),
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Breakfast',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
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
                              color: Colors.grey, // Kenar çizgisi rengi
                              width: 00.5, // Kenar çizgisi kalınlığı
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(6),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              splashColor: AppColors.yedi,
                              onTap: () {},
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  Ink.image(
                                    image: const NetworkImage(
                                        'https://images.deliveryhero.io/image/fd-tr/LH/kowe-hero.jpg'),
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Fast Food',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
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
                              color: Colors.grey, // Kenar çizgisi rengi
                              width: 00.5, // Kenar çizgisi kalınlığı
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(6),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              splashColor: AppColors.yedi,
                              onTap: () {},
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  Ink.image(
                                    image: const NetworkImage(
                                        'https://images.deliveryhero.io/image/fd-tr/LH/cx3m-hero.jpg'),
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Traditional',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
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
                              color: Colors.grey, // Kenar çizgisi rengi
                              width: 00.5, // Kenar çizgisi kalınlığı
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(6),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              splashColor: AppColors.yedi,
                              onTap: () {},
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  Ink.image(
                                    image: const NetworkImage(
                                        'https://images.immediate.co.uk/production/volatile/sites/2/2021/11/Croquembouche-profiterole-tower-ceb1da8.jpg?quality=90&resize=556,505'),
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Desserts',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ])),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.card_giftcard),
                      const SizedBox(width: 5),
                      const Text("Öne çıkan kampanyalar",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start),
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
                  SizedBox(
                    height: 1,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      const SizedBox(width: 15),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Kenar çizgisi rengi
                            width: 1, // Kenar çizgisi kalınlığı
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(5),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            splashColor: Colors.black26,
                            onTap: () {},
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Ink.image(
                                  image: NetworkImage(kampanyaRepository
                                      .urunler[0].urunFotoAddress),
                                  height: 200,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  kampanyaRepository.urunler[0].urunAdi,
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
                                              const DetayliBilgiSayfasi(id: 0),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Detaylı bilgi için tıklayınız",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.yedi),
                                    )),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 15),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, // Kenar çizgisi rengi
                                width: 1, // Kenar çizgisi kalınlığı
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(5),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: () {},
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Ink.image(
                                      image: NetworkImage(
                                          "${kampanyaRepository.urunler[1].urunFotoAddress}"),
                                      height: 200,
                                      width: 160,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      kampanyaRepository.urunler[1].urunAdi,
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
                                                  const DetayliBilgiSayfasi(
                                                      id: 1),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Detaylı bilgi için tıklayınız",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.yedi),
                                        )),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ]),
          ),
        ));
  }
}
