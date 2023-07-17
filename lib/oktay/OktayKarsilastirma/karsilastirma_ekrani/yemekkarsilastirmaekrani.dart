import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/food_comparison_screen/UrunRepository.dart';
import 'package:mobilyst/oktay/OktayKarsilastirma/karsilastirma_ekrani/magazaRepository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Anasayfa/KampanyaRepository.dart';
import '../../../food_comparison_screen/food_bilgileri.dart';
import '../favoriRepository.dart';
import 'favoriModel.dart';

class FoodComparisonScreen extends ConsumerStatefulWidget {
  final products yemek;
  FoodComparisonScreen({Key? key, required this.yemek}) : super(key: key);

  @override
  _FoodComparisonScreenState createState() => _FoodComparisonScreenState();
}

class _FoodComparisonScreenState extends ConsumerState<FoodComparisonScreen> {
  bool isProductInFavorites = false;
  bool isFavorite = false;
  late FavoriteRepository _favoriteRepository;
  late var cheapestStoreName1 = ref
      .read(magazaRepositoryProvider)
      .getCheapestStoreName(widget.yemek.name);
  late var cheapestStorePrice1 =
      ref.read(magazaRepositoryProvider).getCheapestPrice(widget.yemek.name);

  @override
  void initState() {
    super.initState();
    _favoriteRepository = FavoriteRepository();
    checkIsProductInFavorites();
  }

  void checkIsProductInFavorites() async {
    final isUserLoggedIn = FirebaseAuth.instance.currentUser != null;
    if (isUserLoggedIn) {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final productInFavorites =
            await _favoriteRepository.isProductInFavorites(widget.yemek.name);
        setState(() {
          isProductInFavorites = productInFavorites;
        });
      }
    }
  }

  void toggleFavorite() async {
    final isUserLoggedIn = FirebaseAuth.instance.currentUser != null;
    if (isUserLoggedIn) {
      setState(() {
        isProductInFavorites = !isProductInFavorites;
      });

      if (isProductInFavorites) {
        final favoriteProduct = FavoriteProduct(
          productName: widget.yemek.name,
          productImageUrl: widget.yemek.image_url,
          productPrice: widget.yemek.price,
          productPageUrl: widget.yemek.product_url,
          productCategory: widget.yemek.category,
          userId: FirebaseAuth.instance.currentUser!.uid,
          productId: '',
        );
        await _favoriteRepository.addProductToFavorites(favoriteProduct);
      } else {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          final querySnapshot = await _favoriteRepository.favoritesCollection
              .where('productName', isEqualTo: widget.yemek.name)
              .where('userId', isEqualTo: currentUser.uid)
              .get();

          if (querySnapshot.docs.isNotEmpty) {
            final docId = querySnapshot.docs.first.id;
            await _favoriteRepository.removeProductFromFavorites(docId);
          }
        }
      }
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
                "Favorilere eklemek için giriş yapmanız gerekiyor. Lütfen giriş yapınız."),
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

    filteredMeals.sort((a, b) => a.price.compareTo(b.price));

    void uruneGit() async {
      await launch(widget.yemek.product_url);

      void uruneGit() async {
        await launch(widget.yemek.product_url);
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
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          toggleFavorite();
                        },
                        icon: Icon(
                          isProductInFavorites
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isProductInFavorites ? AppColors.bes : null,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
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
                          style: const TextStyle(
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
