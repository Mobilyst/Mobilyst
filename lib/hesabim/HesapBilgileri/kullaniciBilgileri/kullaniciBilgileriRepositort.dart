import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/kullaniciBilgileri/kullaniciB.dart';

class KullaniciBilgileriService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// veri ekleme fonskiyonu
  Future<KullaniciBilgileri> addStatus(
    String adi,
    String soyadi,
    String email,
    String cinsiyet,
    DateTime tarih,
    String il,
    String adres,
  ) async {
    await Firebase.initializeApp();
    var ref = _firestore.collection('KullaniciBilgileri');

    var documentRef = await ref.add({
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'adi': adi,
      'soyadi': soyadi,
      'email': email,
      'cinsiyet': cinsiyet,
      'tarih': Timestamp.fromDate(tarih),
      'il': il,
      'adres': adres,
    });
    return KullaniciBilgileri(
        userId: FirebaseAuth.instance.currentUser!.uid,
        adi: adi,
        soyadi: soyadi,
        email: email,
        cinsiyet: cinsiyet,
        tarih: tarih,
        il: il,
        adres: adres);
  }

  Future<KullaniciBilgileri?> getUserData() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    if (userId.isEmpty) {
      return null;
    }

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('KullaniciBilgileri')
        .where('userId', isEqualTo: userId)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = snapshot.docs.first;
      KullaniciBilgileri kullaniciBilgileri =
          KullaniciBilgileri.fromSnapshot(documentSnapshot);
      return kullaniciBilgileri;
    } else {
      return null;
    }
  }
}
