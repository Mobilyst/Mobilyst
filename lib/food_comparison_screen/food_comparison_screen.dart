import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/oktay/OktayKarsilastirma/karsilastirma_ekrani/yemekkarsilastirmaekrani.dart';
import 'UrunRepository.dart';
import 'food_bilgileri.dart';

class YemekKiyasTumuPage extends ConsumerWidget {
  const YemekKiyasTumuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urunRepository = ref.watch(urunProvider);
    final List<List<products>> meals = urunRepository.urunler;
    final bool isFetching = urunRepository.isFetching;
    if (isFetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    /*
    SiralamaSecenekleri selectedSortOption = SiralamaSecenekleri.Sirala;
    
    void sortMeals() {
      switch (selectedSortOption) {
        case SiralamaSecenekleri.PriceDescending:
          meals.sort((a, b) => b.price.compareTo(a.price));
          break;
        case SiralamaSecenekleri.PriceAscending:
          meals.sort((a, b) => a.price.compareTo(b.price));
          break;
        case SiralamaSecenekleri.MostPopular:
          // Sıralama işlemleri
          break;
        case SiralamaSecenekleri.Popular:
          // Sıralama işlemleri
          break;
        case SiralamaSecenekleri.NewArrivals:
          // Sıralama işlemleri
          break;
        case SiralamaSecenekleri.Discounted:
          // Sıralama işlemleri
          break;
        case SiralamaSecenekleri.Sirala:
          // Sıralama işlemleri
          break;
      }
    }
  */

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yemekler",
          style: TextStyle(
            color: AppColors.bir,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: AppColors.uc,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: DropdownButton<SiralamaSecenekleri>(
              onChanged: (SiralamaSecenekleri? newValue) {
                if (newValue != null) {
                  meals.forEach((urunList) {
                    urunList
                        .sort((a, b) => a.productsId.compareTo(b.productsId));
                  });
                }
              },
              items: [
                DropdownMenuItem(
                  value: SiralamaSecenekleri.Sirala,
                  child: Text("Önerilen Sıralama"),
                ),
                DropdownMenuItem(
                  value: SiralamaSecenekleri.PriceDescending,
                  child: Text("Fiyata Göre Azalan"),
                ),
                DropdownMenuItem(
                  value: SiralamaSecenekleri.PriceAscending,
                  child: Text("Fiyata Göre Artan"),
                ),
                DropdownMenuItem(
                  value: SiralamaSecenekleri.MostPopular,
                  child: Text("En Çok Değerlendirilen"),
                ),
                DropdownMenuItem(
                  value: SiralamaSecenekleri.Popular,
                  child: Text("Popüler Olan"),
                ),
                DropdownMenuItem(
                  value: SiralamaSecenekleri.NewArrivals,
                  child: Text("Yeni Ürünler"),
                ),
                DropdownMenuItem(
                  value: SiralamaSecenekleri.Discounted,
                  child: Text("İndirimli Ürünler"),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 15,
                childAspectRatio: 0.62,
              ),
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                final mealList = meals[index];
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mealList.length,
                  itemBuilder: (BuildContext context, int mealIndex) {
                    final urun = mealList[mealIndex];
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FoodComparisonScreen(yemek: urun),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 280,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: SizedBox(
                                  child: Image.network(
                                    urun.image_url,
                                    fit: BoxFit.cover,
                                    height: 200,
                                    width: 170,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                urun.name,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Fiyat: ${urun.price} TL",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.bes,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
