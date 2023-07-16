import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/food_comparison_screen/UrunRepository.dart';
import 'package:mobilyst/oktay/OktayKarsilastirma/karsilastirma_ekrani/magazaRepository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Anasayfa/KampanyaRepository.dart';
import '../../../food_comparison_screen/food_bilgileri.dart';

class FoodComparisonScreen extends ConsumerStatefulWidget {
  final products yemek;
  FoodComparisonScreen({Key? key, required this.yemek}) : super(key: key);

  @override
  _FoodComparisonScreenState createState() => _FoodComparisonScreenState();
}

class _FoodComparisonScreenState extends ConsumerState<FoodComparisonScreen> {
  bool isFavorite = false;
  late var cheapestStoreName1 = ref
      .read(magazaRepositoryProvider)
      .getCheapestStoreName(widget.yemek.name);
  late var cheapestStorePrice1 =
      ref.read(magazaRepositoryProvider).getCheapestPrice(widget.yemek.name);
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final urunRepository = ref.watch(urunProvider);
    final List<List<products>> meals = urunRepository.urunler;
    final bool isFetching = urunRepository.isFetching;

    final List<products> filteredMeals = meals
        .expand((mealList) => mealList)
        .where((urun) =>
            urun.category.toLowerCase() == widget.yemek.category.toLowerCase())
        .toList();
    
    void uruneGit() async {
      if (FirebaseAuth.instance.currentUser != null) {
        // Kullanıcı girişi yapıldıysa direkt olarak web sitesine yönlendir.
        await launch(widget.yemek.product_url);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Uyarı",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              content: Text(
                  textAlign: TextAlign.start,
                  "Fırsata gitmek için giriş yapmanız gerekiyor. Lütfen giriş yapınız."),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.uc,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    context.go('/hesabim');
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    "İptal",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.uc,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: SizedBox(
                          height: 200,
                          child: Image.network(
                            widget.yemek.image_url,
                            height: 200,
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.1),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications_outlined),
                            ),
                            IconButton(
                              onPressed: () {
                                toggleFavorite();
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Paylaş düğmesine tıklandığında yapılacak işlemler
                              },
                              icon: const Icon(Icons.share),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.yemek.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 200,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Fiyat: ${widget.yemek.price} TL',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: uruneGit,
                    /*() {
                      print(filteredMeals);
                      final cheapestStorePrice = ref
                          .read(magazaRepositoryProvider)
                          .getCheapestPrice(widget.yemek.name);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Ürüne git!')));
                    
                    },*/
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.dort,
                      textStyle: const TextStyle(
                        color: AppColors.bir,
                      ), // Arka plan rengi
                    ),
                    icon: const Icon(Icons.shopping_bag),
                    label: const Text('Ürüne git!'),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredMeals.length,
              itemBuilder: (context, index) {
                final urun = filteredMeals[index];
                return ListTile(
                  leading: Icon(CupertinoIcons.arrow_right_circle),
                  title: Text(
                    urun.name + " " + " Fiyat: " + "${urun.price}" + "TL",
                    textAlign: TextAlign.right,
                    maxLines: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodComparisonScreen(yemek: urun),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
