import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';

class MagazaRepository extends ChangeNotifier{
  List<String> storeNames = ['Firma A', 'Firma B', 'Firma C', 'Firma D','Firma E'];

  List<Map<String, String>> multiStorePrices = [
    {
      "storeName": "Firma A",
      "price": "10.0",
      "kategoriAdi": "Hamburger" ,
    },
    {
      "storeName": "Firma B",
      "price": "12.0",
      "kategoriAdi": "Hamburger" ,
    },
    {
      "storeName": "Firma C",
      "price": "8.0",
      "kategoriAdi": "Hamburger" ,
    },
    {
      "storeName": "Firma D",
      "price": "11.0",
      "kategoriAdi": "Hamburger" ,
    },

  ];




  String getCheapestStoreName(String kategoriAdi) {
    double cheapestPrice = double.infinity;
    String cheapestStoreName = '';
    var liste = [];
    for(var mt in multiStorePrices){
      if(mt["kategoriAdi"]==kategoriAdi){
        liste.add(mt);
      }
    }
    liste.forEach((e) {
      if (double.parse(e["price"]??"0")  < cheapestPrice) {
        cheapestPrice = double.parse(e["price"]??"0");
        cheapestStoreName = e["storeName"]??"-";
      }
    });

    return cheapestStoreName;
  }

  double getCheapestPrice(String kategoriAdi) {
    double cheapestPrice = double.infinity;
    var liste = [];
    for(var mt in multiStorePrices){
      if(mt["kategoriAdi"]==kategoriAdi){
        liste.add(mt);
      }
    }
    liste.forEach((e) {
      if (double.parse(e["price"]??"0")  < cheapestPrice) {
        cheapestPrice = double.parse(e["price"]??"0");
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

  List<Map<String, String>> getStore(String kategoriAdi){
    List<Map<String, String>> result = [];
    for(var sp in multiStorePrices){
      if(sp["kategoriAdi"]==kategoriAdi){
        result.add(sp);
      }
    }
    return result;
  }


  List<Map<String, String>> getStorePricdes(){
    List<Map<String, String>> result = multiStorePrices;
    return result;
  }
}

final magazaRepositoryProvider = ChangeNotifierProvider((ref) => MagazaRepository());