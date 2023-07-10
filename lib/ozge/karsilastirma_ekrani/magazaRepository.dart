import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';

class MagazaRepository extends ChangeNotifier{
  List<String> storeNames = ['Firma A', 'Firma B', 'Firma C', 'Firma D','Firma E'];

  Map<String, double> storePrices = {
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

  List<String> getStoreNAmes(){
    List<String> result = [];
    for(var store in storeNames){
      result.add(store);
    }
    return result;
  }

  Map<String, double> getStorePricdes(){
    Map<String, double> result = storePrices;
    return result;
  }
}

final magazaRepositoryProvider = ChangeNotifierProvider((ref) => MagazaRepository());