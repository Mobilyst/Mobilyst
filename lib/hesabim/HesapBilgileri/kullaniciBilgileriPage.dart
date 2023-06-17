import 'package:flutter/material.dart';
import 'package:mobilyst/GirisOlaylari/tabs/button/girisButton.dart';

import '../../GirisOlaylari/tabs/textfield/testField.dart';

class KullaniciBilgileriPage extends StatefulWidget {
  const KullaniciBilgileriPage({super.key});

  @override
  State<KullaniciBilgileriPage> createState() => _KullaniciBilgileriPageState();
}

class _KullaniciBilgileriPageState extends State<KullaniciBilgileriPage> {
  String? cinsiyet;
  bool _isExpanded = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _handleExpansionChanged(bool expanded) {
    setState(() {
      _isExpanded = expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ' Kullanıcı Bilgilerim',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.black12,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25), // Başlangıçtan sağa boşluk ekleyin
                    child: Text(
                      'Adınız',
                      style: TextStyle(
                        fontSize: 15, // Metin boyutunu 18 olarak ayarlar
                        fontWeight: FontWeight.normal, // Metni kalınlaştırır
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              //sifre textfield
              MyTextField(
                controller: null, //??
                hintText: 'Adınızı giriniz',
                obscureText: true, // gizliyor yazilan seyleri
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25), // Başlangıçtan sağa boşluk ekleyin
                    child: Text(
                      'Soyadınız',
                      style: TextStyle(
                        fontSize: 15, // Metin boyutunu 18 olarak ayarlar
                        fontWeight: FontWeight.normal, // Metni kalınlaştırır
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              //sifre textfield
              MyTextField(
                controller: null, //??
                hintText: 'Soyadınızı giriniz',
                obscureText: true, // gizliyor yazilan seyleri
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25), // Başlangıçtan sağa boşluk ekleyin
                    child: Text(
                      'E-posta',
                      style: TextStyle(
                        fontSize: 15, // Metin boyutunu 18 olarak ayarlar
                        fontWeight: FontWeight.normal, // Metni kalınlaştırır
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              //sifre textfield
              MyTextField(
                controller: null, //??
                hintText: 'E-postanızı giriniz',
                obscureText: true, // gizliyor yazilan seyleri
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25), // Başlangıçtan sağa boşluk ekleyin
                    child: Text(
                      'Cinsiyet',
                      style: TextStyle(
                        fontSize: 15, // Metin boyutunu 18 olarak ayarlar
                        fontWeight: FontWeight.normal, // Metni kalınlaştırır
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 2,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Radio(
                    value: 'Erkek',
                    groupValue: cinsiyet, //??
                    onChanged: (value) {
                      setState(() {
                        cinsiyet = value.toString();
                      });
                    },
                  ),
                  const SizedBox(
                    width: 0.01,
                  ),
                  const Text('Erkek'),
                  const SizedBox(
                    width: 10,
                  ),
                  Radio(
                    value: 'Kadın',
                    groupValue: cinsiyet, //??
                    onChanged: (value) {
                      setState(() {
                        cinsiyet = value.toString();
                      });
                    }, //??
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 0.01,
                  ),
                  const Text('Kadın'),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25), // Başlangıçtan sağa boşluk ekleyin
                    child: Text(
                      'Doğum Tarihi',
                      style: TextStyle(
                        fontSize: 15, // Metin boyutunu 18 olarak ayarlar
                        fontWeight: FontWeight.normal, // Metni kalınlaştırır
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              //sifre textfield
              MyTextField(
                controller: null, //??
                hintText: 'Doğum tarihinizi giriniz',
                obscureText: true, // gizliyor yazilan seyleri
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25), // Başlangıçtan sağa boşluk ekleyin
                    child: Text(
                      'İl',
                      style: TextStyle(
                        fontSize: 15, // Metin boyutunu 18 olarak ayarlar
                        fontWeight: FontWeight.normal, // Metni kalınlaştırır
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              //burası degısecek ??
              MyTextField(
                controller: null, //??
                hintText: 'İl giriniz',
                obscureText: true, // gizliyor yazilan seyleri
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25), // Başlangıçtan sağa boşluk ekleyin
                    child: Text(
                      'Adres',
                      style: TextStyle(
                        fontSize: 15, // Metin boyutunu 18 olarak ayarlar
                        fontWeight: FontWeight.normal, // Metni kalınlaştırır
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              //burası degısecek ??
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade900),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade900),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              MyButton(
                onTap: null, //??
                text: ' Değişiklikleri Kaydet', //??
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap:
                          null, //?? cıkıs yaptıgında sıgn ın sayfasına donmelı
                      child: const Text(
                        ' Çıkış Yap',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ));
  }
}
