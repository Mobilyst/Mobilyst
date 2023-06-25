import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilyst/GirisOlaylari/tabs/button/girisButton.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/kullaniciBilgileri/citySecimPage.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/kullaniciBilgileri/kullaniciB.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/kullaniciBilgileri/kullaniciBilgileriRepositort.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/kullaniciBilgileri/tarihSecimPage.dart';

import '../../../GirisOlaylari/tabs/textfield/testField.dart';

class KullaniciBilgileriPage extends StatefulWidget {
  const KullaniciBilgileriPage({super.key});

  @override
  State<KullaniciBilgileriPage> createState() => _KullaniciBilgileriPageState();
}

class _KullaniciBilgileriPageState extends State<KullaniciBilgileriPage> {
  String? _selectedCinsiyet;
  DateTime? _selectedDateTime;
  String? _selectedIl;
  bool _isExpanded = false;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController adiController = TextEditingController();
  TextEditingController soyadiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adresController = TextEditingController();
  final KullaniciBilgileriService kullaniciBilgileriService =
      KullaniciBilgileriService();

  String _hideEmail(String email) {
    if (email.isNotEmpty) {
      List<String> parts = email.split('@');
      String hiddenEmail = parts[0].substring(0, 2);
      hiddenEmail += '****@';
      hiddenEmail += parts[1];
      return hiddenEmail;
    }
    return '';
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> fetchUserData() async {
    try {
      String email = FirebaseAuth.instance.currentUser?.email ?? '';
      emailController.text = _hideEmail(email);
      KullaniciBilgileriService kullaniciBilgileriService =
          KullaniciBilgileriService();
      KullaniciBilgileri? kullaniciBilgileri =
          await kullaniciBilgileriService.getUserData();

      if (kullaniciBilgileri != null) {
        setState(() {
          adiController.text = kullaniciBilgileri.adi ?? '';
          soyadiController.text = kullaniciBilgileri.soyadi ?? '';
          _selectedCinsiyet = kullaniciBilgileri.cinsiyet;
          _selectedDateTime = kullaniciBilgileri.tarih;
          _selectedIl = kullaniciBilgileri.il;
          adresController.text = kullaniciBilgileri.adres ?? '';
        });
      }
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata mesajını kullanıcıya göstermek için bir SnackBar veya AlertDialog gibi bir mekanizma kullanabilirsiniz.
    }
  }

  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      fetchUserData();
    }
  }

  void _handleExpansionChanged(bool expanded) {
    setState(() {
      _isExpanded = expanded;
    });
  }

  Future<void> _onSaveButtonPressed() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // Kullanıcı verilerini al
    String adi = adiController.text; // Adınızı burada alın
    String soyadi = soyadiController.text;
    String email = emailController.text;
    String? cinsiyet = _selectedCinsiyet; // Soyadınızı burada alın
    DateTime tarih = _selectedDateTime ?? DateTime.now(); // Tarihi burada alın
    String? il = _selectedIl; // İli burada alın
    String adres = adresController.text; // Adresi burada alın

    // Verileri Firebase Firestore'a ekleyin
    KullaniciBilgileriService kullaniciBilgileriService =
        KullaniciBilgileriService();
    await kullaniciBilgileriService.addStatus(
        adi, soyadi, email, cinsiyet!, tarih, il!, adres);

    await fetchUserData();

    // Verileri ekledikten sonra yapılacak işlemler (örneğin yönlendirme)

    // yukleniyordan cikis
    Navigator.pop(context);
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
                height: 10,
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
                height: 5,
              ),

              //sifre textfield
              MyTextField(
                controller: adiController, //??
                hintText: 'Adınızı giriniz',
                obscureText: false, // gizliyor yazilan seyleri
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
                height: 5,
              ),
              //sifre textfield
              MyTextField(
                controller: soyadiController, //??
                hintText: 'Soyadınızı giriniz',
                obscureText: false, // gizliyor yazilan seyleri
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
                height: 5,
              ),

              //sifre textfield
              MyTextField(
                controller: emailController, //??
                hintText: 'E-postanızı giriniz',
                obscureText: false, // gizliyor yazilan seyleri
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
                height: 5,
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButtonFormField<String>(
                        value: _selectedCinsiyet,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedCinsiyet = value;
                          });
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: 'Erkek',
                            child: const Text('Erkek'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Kadın',
                            child: const Text('Kadın'),
                          ),
                        ],
                        decoration: InputDecoration(
                          hintText: 'Cinsiyet seçiniz',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade900),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade900),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
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
                height: 5,
              ),

              //sifre textfield
              Row(
                children: [
                  Expanded(
                    child: TarihSelectPage(
                      onDateSelected: (selectedDate) {
                        setState(() {
                          _selectedDateTime = selectedDate;
                        });
                      },
                    ),
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
                height: 5,
              ),

              //burası degısecek ??
              Row(
                children: [
                  Expanded(
                    child: CitySelectPage(
                      onChange: (selectedCity) {
                        setState(() {
                          _selectedIl = selectedCity;
                        });
                      },
                    ),
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
                height: 5,
              ),

              //burası degısecek ??
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: TextField(
                    controller: adresController,
                    decoration: InputDecoration(
                      hintText: 'Adresinizi giriniz',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade900),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade900),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              MyButton(
                onTap: _onSaveButtonPressed,
                text: ' Değişiklikleri Kaydet', //??
              ),

              const SizedBox(
                height: 20,
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
                        ' Hesabımı Sil',
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
