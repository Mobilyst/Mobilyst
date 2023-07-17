import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/oktay/OktayKarsilastirma/karsilastirma_ekrani/yemekkarsilastirmaekrani.dart';
import 'UrunRepository.dart';
import 'food_bilgileri.dart';

class YemekKiyasTumuPage extends ConsumerStatefulWidget {
  const YemekKiyasTumuPage({Key? key}) : super(key: key);

  @override
  _YemekKiyasTumuPageState createState() => _YemekKiyasTumuPageState();
}

class _YemekKiyasTumuPageState extends ConsumerState<YemekKiyasTumuPage> {
  @override
  initState() {
    final urunRepository = ref.read(urunProvider);
    final List<List<products>> meals = urunRepository.urunler;
    for (var mealList in meals) {
      mealList.sort((a, b) => b.price.compareTo(a.price));
    }
  }

  @override
  Widget build(BuildContext context) {
    final urunRepository = ref.watch(urunProvider);
    final List<List<products>> meals = urunRepository.urunler;
    final bool isFetching = urunRepository.isFetching;

    if (isFetching) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

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
                          height: 295,
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
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
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
