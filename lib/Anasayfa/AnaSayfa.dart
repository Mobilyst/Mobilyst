import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilyst/Anasayfa/DetayliBilgiSayfasi.dart';
import 'package:mobilyst/Anasayfa/KampanyalarSayfasi.dart';
import 'package:mobilyst/food_comparison_screen/food_comparison_screen.dart';
import '../ColorAndType/color.dart';
import 'KampanyaRepository.dart';

class AnaSayfa extends ConsumerWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    var screenHeight = MediaQuery.of(context).size.height;
    var kampanyaRepository = ref.watch(kampanyaProvider);

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
              const SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Container(
                  height: 50,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Ara...',
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: AppColors.yedi,
                        ),
                        onPressed: () => searchController.clear(),
                      ),
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
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://cdn.yeniakit.com.tr/images/news/940/hangi-sehirde-hangi-yemek-yenir-2h1580033203-e7124c.jpg',
                                ),
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
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://potatorolls.com/wp-content/uploads/Lumberjack-Breakfast3-686x640.jpg',
                                ),
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
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://images.deliveryhero.io/image/fd-tr/LH/kowe-hero.jpg',
                                ),
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
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://images.deliveryhero.io/image/fd-tr/LH/cx3m-hero.jpg',
                                ),
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
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Ink.image(
                                image: const NetworkImage(
                                  'https://images.immediate.co.uk/production/volatile/sites/2/2021/11/Croquembouche-profiterole-tower-ceb1da8.jpg?quality=90&resize=556,505',
                                ),
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
                height: 20,
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
              SizedBox(
                height: 1,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: kampanyaRepository.urunler.isNotEmpty
                      ? kampanyaRepository.urunler[0].map((urun) {
                          final index =
                              kampanyaRepository.urunler[0].indexOf(urun);
                          return SizedBox(
                            width: 160, //
                            child: Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(5),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: () {},
                                child: Container(
                                  width: double.infinity, //
                                  height: 250, //
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Ink.image(
                                          image: NetworkImage(urun.ResimUrl),
                                          height: 200,
                                          width: 160,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
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
                                      const SizedBox(height: 5),
                                    ],
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
