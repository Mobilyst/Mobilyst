import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/oktay/OktayKarsilastirma/karsilastirma_ekrani/yemekkarsilastirmaekrani.dart';
import 'UrunRepository.dart';
import 'food_bilgileri.dart';

class YemekKiyasTumuPage extends ConsumerWidget{
  const YemekKiyasTumuPage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urunRepository = ref.watch(urunProvider);
    final List<List<products>> meals =
        urunRepository.urunler;


    SiralamaSecenekleri selectedSortOption = SiralamaSecenekleri.Sirala;

  /*  void sortMeals() {
      switch (selectedSortOption) {
        case SiralamaSecenekleri.PriceDescending:
          meals.sort((a, b) => b.price.compareTo(a.price));
          break;
        case SiralamaSecenekleri.PriceAscending:
          meals.sort((a, b) => a.price.compareTo(b.price));
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
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: DropdownButton<SiralamaSecenekleri>(
                  value: selectedSortOption,
                  onChanged: (SiralamaSecenekleri? newValue) {
                    if (newValue != null) {
                        selectedSortOption = newValue;

                    }
                   // sortMeals();
                  },
                  items: const [
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
                  // icon: const Icon(Icons.sort_rounded),
                ),
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 0.7, // Oranı ayarlayabilirsiniz
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView(
                  children: meals[index]
                    .map((urun) =>
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodComparisonScreen(yemek: urun),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Center(
                            // Yeni eklenen Center widget'ı
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 100,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.network(urun.image_url),
                                  ),
                                ),
                                Text(
                                  urun.name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Fiyat: ${urun.price}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 8.0,
                            right: 8.0,
                            child: GestureDetector(
                              onTap: () {
                                //  urun.isSelected =
                                  //    !meals[index].isSelected;

                              },
    /* child: Icon(
                                Icons.notifications,
                                color: meals[index].isSelected
                                    ? AppColors.bes
                                    : AppColors.uc,
                              ), */
                            ),
                          ),
                        ],
                      ),
                    )
                          ).toList()
                  ,
                )
              );

            },
            itemCount: meals.length,
          ),
        ],
      ),
    );
  }
}
