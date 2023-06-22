import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  final String storeName;

  const StorePage(this.storeName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storeName),
      ),
      body: Center(
        child: Text('Bu sayfa $storeName mağazasını temsil ediyor.'),
      ),
    );
  }
}

final List<String> storeNames = ['Firma A', 'Firma B', 'Firma C', 'Firma D','Firma E'];

final Map<String, double> storePrices = {
  'Firma A': 10.0,
  'Firma B': 12.0,
  'Firma C': 8.0,
  'Firma D': 9.0,
  'Firma E':11.0,
};

String getCheapestStoreName() {
  double cheapestPrice = double.infinity;
  String cheapestStoreName = '';

  storePrices.forEach((storeName, price) {
    if (price < cheapestPrice) {
      cheapestPrice = price;
      cheapestStoreName = storeName;
    }
  });

  return cheapestStoreName;
}

double getCheapestPrice() {
  double cheapestPrice = double.infinity;

  storePrices.forEach((_, price) {
    if (price < cheapestPrice) {
      cheapestPrice = price;
    }
  });

  return cheapestPrice;
}
