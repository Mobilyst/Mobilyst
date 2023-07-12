import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Urun.dart';

class KampanyaRepository extends ChangeNotifier {
  List<List<kampanyalar>> urunler = [];

  KampanyaRepository() {
    _fetchUrunler();
  }

  Future<void> _fetchUrunler() async {
    final snapshot = await FirebaseFirestore.instance.collection('kampanyalar').get();
    final groupedUrunler = Map<String, List<kampanyalar>>();

    snapshot.docs.forEach((doc) {
      final data = doc.data();
      final id = doc.id;
      final kampanya = kampanyalar(
        id,
        data['Baslik'],
        data['ResimUrl'],
        data['SayfaUrl'],
      );

      if (groupedUrunler.containsKey(id)) {
        groupedUrunler[id]!.add(kampanya);
      } else {
        groupedUrunler[id] = [kampanya];
      }
    });

    groupedUrunler.values.forEach((urunList) {
      urunList.sort((a, b) => a.Baslik.compareTo(b.Baslik));
    });

    urunler = groupedUrunler.values.toList();
    notifyListeners();
  }
}

final kampanyaProvider = ChangeNotifierProvider((ref) {
  return KampanyaRepository();
});
