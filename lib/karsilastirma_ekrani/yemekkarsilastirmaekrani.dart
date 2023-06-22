import 'package:flutter/material.dart';
import 'package:mobilyst/karsilastirma_ekrani/magazasayfasi.dart';

class FoodComparisonScreen extends StatefulWidget {
  FoodComparisonScreen({Key? key}) : super(key: key);

  @override
  _FoodComparisonScreenState createState() => _FoodComparisonScreenState();
}

class _FoodComparisonScreenState extends State<FoodComparisonScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                        'https://cdn-icons-png.flaticon.com/128/3075/3075977.png',
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
                        icon: const Icon(Icons.add_alarm),
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
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width: 2.0),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Firma A',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Fiyat: 10.0 TL',
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
                      final cheapestStoreName = getCheapestStoreName();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StorePage(cheapestStoreName),
                        ),
                      );
                    },
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
              children: storeNames.map((storeName) {
                final storePrice = storePrices[storeName];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(storeName),
                      subtitle: Text('Fiyat: $storePrice TL '),
                      trailing: ElevatedButton(
                        child: const Text('Mağaza\'ya git'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StorePage(storeName),
                            ),
                          );
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