import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'food_bilgileri.dart';

class UrunRepository with ChangeNotifier {
  List<List<products>> urunler = [];
  bool isFetching = false;

  UrunRepository() {
    _fetchUrunler();
  }

  Future<void> _fetchUrunler() async {
    isFetching = true;
    notifyListeners();

    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      final groupedUrunler = Map<String, List<products>>();

      snapshot.docs.forEach((doc) {
        final data = doc.data();
        final id = doc.id;
        final yemekler = products(
          id,
          data['category'] ??
              '', 
          data['image_url'] ??
              '', 
          data['name'] ?? '',
          data['price'] ?? 0, 
          data['product_url'] ??
              '', 
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
    } catch (error) {
      print('Veri çekme hatası: $error');
    } finally {
      isFetching = false;
      notifyListeners();
    }
  }
}

final urunProvider = ChangeNotifierProvider((ref) {
  return UrunRepository();
});
