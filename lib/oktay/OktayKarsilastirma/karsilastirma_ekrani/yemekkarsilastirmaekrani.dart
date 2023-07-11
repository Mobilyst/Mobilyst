import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/oktay/OktayKarsilastirma/karsilastirma_ekrani/magazaRepository.dart';


import '../../../food_comparison_screen/food_bilgileri.dart';

class FoodComparisonScreen extends ConsumerStatefulWidget {
  final Yemek yemek;
  FoodComparisonScreen({Key? key,required this.yemek}) : super(key: key);

  @override
  _FoodComparisonScreenState createState() => _FoodComparisonScreenState();
}

class _FoodComparisonScreenState extends ConsumerState<FoodComparisonScreen> {
  bool isFavorite = false;
  late var cheapestStoreName1 = ref.read(magazaRepositoryProvider).getCheapestStoreName(widget.yemek.name);
  late var cheapestStorePrice1 = ref.read(magazaRepositoryProvider).getCheapestPrice(widget.yemek.name);
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final magazaRepository = ref.watch(magazaRepositoryProvider);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,foregroundColor: Colors.black),
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
                            widget.yemek.resimUrl,
                            width: 1000,
                            height: 1000,
                          ),
                        ),
                      ),
                    ),
                    Align(
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
                              isFavorite ? Icons.favorite : Icons.favorite_border,
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
                  ],
                ),
                Text(widget.yemek.name)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 65,
                    width: 200,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Column(
                      children:  [
                        Text(
                          cheapestStoreName1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Fiyat: ${cheapestStorePrice1.isInfinite?"-":cheapestStorePrice1} TL',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      final cheapestStoreName = ref.read(magazaRepositoryProvider).getCheapestStoreName(widget.yemek.name);
                      final cheapestStorePrice = ref.read(magazaRepositoryProvider).getCheapestPrice(widget.yemek.name);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${cheapestStoreName1}: ${cheapestStorePrice1} yönlendiriliyor...')));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.dort,
                      textStyle: const TextStyle(
                        color: AppColors.bir,
                      ), // Arka plan rengi
                    ),
                    icon: const Icon(Icons.shopping_bag),
                    label: const Text('En ucuzuna git'),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: ref.read(magazaRepositoryProvider).getStore(widget.yemek.name).map((store) {
                double storePrice =double.parse(store["price"] ?? "0");
                String storeName = store["storeName"] ?? "-";
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Kenar çizgisi rengi
                        width: 00.5, // Kenar çizgisi kalınlığı
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      title: Text(
                        storeName,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        'Fiyat: $storePrice TL ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.dort,
                          textStyle: const TextStyle(
                            color: AppColors.bir,
                          ),
                          // Arka plan rengi
                        ),
                        child: const Text(
                          'Mağaza\'ya git',
                          style: TextStyle(
                            color: AppColors.bir,
                          ),
                        ),
                        onPressed: () {

                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
