import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/oktay/yemek_ekrani/yemekBilgileri.dart';


class YemekRepository extends ChangeNotifier{
  List<Yemek> meals = [
    Yemek("Hamburger", 25.99, 4,
        'https://cdn-icons-png.flaticon.com/128/706/706918.png', false),
    Yemek("Pizza", 12.99, 2,
        'https://cdn-icons-png.flaticon.com/128/6127/6127889.png', false),
    Yemek("Adana Kebap", 8.99, 5,
        'https://cdn-icons-png.flaticon.com/128/10614/10614469.png', false),
    Yemek("Lahmacun", 19.99, 3,
        'https://cdn-icons-png.flaticon.com/128/10614/10614469.png', false),
  ];

  List<Yemek> getMEals(){
    List<Yemek> result = [];

    for(var meal in meals){
      result.add(meal);
    }

    return result;
  }


}
final yemekRepositoryProvider = ChangeNotifierProvider((ref) => YemekRepository());