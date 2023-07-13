import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../oktay/yemek_ekrani/yemekBilgileri.dart';


class UrunRepository extends ChangeNotifier {
  List<List<Yemek>> urunler = [];

  UrunRepository() {
    _fetchUrunler();
  }

  Future<void> _fetchUrunler() async {
    final snapshot = await FirebaseFirestore.instance.collection('products').get();
    final groupedUrunler = Map<String, List<Yemek>>();

    snapshot.docs.forEach((doc) {
      final data = doc.data();
      final id = doc.id;
      final yemekler = Yemek(
        id,
        data['Baslik'],
        data['ResimUrl'],
        data['SayfaUrl'],
        data['Popularity'],
      );

      if (groupedUrunler.containsKey(id)) {
        groupedUrunler[id]!.add(yemekler);
      } else {
        groupedUrunler[id] = [yemekler];
      }
    });

    groupedUrunler.values.forEach((urunList) {
      urunList.sort((a, b) => a.price.compareTo(b.price));
    });

    urunler = groupedUrunler.values.toList();
    notifyListeners();
  }
}

final urunProvider = ChangeNotifierProvider((ref) {
  return UrunRepository();
});
