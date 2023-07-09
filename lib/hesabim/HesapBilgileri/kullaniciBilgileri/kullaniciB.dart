import 'package:cloud_firestore/cloud_firestore.dart';


class KullaniciBilgileri {
  String userId;
  String adi;
  String soyadi;
  String email;
  String cinsiyet;
  DateTime tarih;
  String il;
  String adres;

  KullaniciBilgileri(
      {required this.userId,
      required this.adi,
      required this.soyadi,
      required this.email,
      required this.cinsiyet,
      required this.tarih,
      required this.il,
      required this.adres});

  factory KullaniciBilgileri.fromSnapshot(DocumentSnapshot snapshot) {
    return KullaniciBilgileri(
        userId: snapshot['userId'],
        adi: snapshot['adi'],
        soyadi: snapshot['soyadi'],
        email: snapshot['email'],
        cinsiyet: snapshot['cinsiyet'],
        tarih: (snapshot['tarih'] as Timestamp).toDate(),
        il: snapshot['il'],
        adres: snapshot['adres']);
  }
}


/*

  KullaniciBilgileri.fromMap(Map<String, dynamic> m)
      : this(
          m['id'],
          m['adi'],
          m['soyadi'],
          m['email'],
          m['cinsiyet'],
          m['tarih'],
          m['il'],
          m['adres'],
        );

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'adi': adi,
      'soyadi': soyadi,
      'email': email,
      'cinsiyet': cinsiyet,
      'tarih': tarih,
      'il': il,
      'adres': adres,
    };
  }*/


