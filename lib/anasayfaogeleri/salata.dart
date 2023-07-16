import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/food_comparison_screen/UrunRepository.dart';
import 'package:mobilyst/food_comparison_screen/food_bilgileri.dart';

import '../oktay/OktayKarsilastirma/karsilastirma_ekrani/yemekkarsilastirmaekrani.dart';

class SalataTumuPage extends ConsumerWidget {
  const SalataTumuPage({Key? key}) : super(key: key);

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

    final List<products> filteredMeals = meals
        .expand((mealList) => mealList)
        .where((urun) => urun.category.toLowerCase() == "salata")
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Salatalar",
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
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 15,
                childAspectRatio: 0.62,
              ),
              itemCount: filteredMeals.length,
              itemBuilder: (BuildContext context, int index) {
                final urun = filteredMeals[index];
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
          ),
        ],
      ),
    );
  }
}
