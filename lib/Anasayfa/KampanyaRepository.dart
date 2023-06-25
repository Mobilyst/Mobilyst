import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Urun.dart';

class KampanyaRepository extends ChangeNotifier {
  List<Urun> urunler = [
    Urun("Taraftar Menü",
        "https://www.popeyes.com.tr/cmsfiles/campaigns/takimina-kazandirmanin-en-lezzetli-yolu-popeyes-taraftar-menusu.jpg?v=143"),
    Urun("2'li Beef'n Cheddar Menü",
        "https://www.arbys.com.tr/cmsfiles/campaigns/2-li-beef-n-kampanyasi.jpg?v=95")
  ];
}

final kampanyaProvider = ChangeNotifierProvider((ref) {
  return KampanyaRepository();
});
