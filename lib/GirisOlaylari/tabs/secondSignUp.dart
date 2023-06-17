import 'package:flutter/material.dart';
import 'package:mobilyst/GirisOlaylari/tabs/button/girisButton.dart';
import 'package:mobilyst/GirisOlaylari/tabs/textfield/testField.dart';

class SignUpPage extends StatelessWidget {
  final TabController? tabController;

  const SignUpPage({Key? key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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

              // email textfield
              const MyTextField(
                controller: null, //??
                hintText: 'Lütfen e-posta adresinizi giriniz',
                obscureText: false,
              ),

              const SizedBox(
                height: 5,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25), // Başlangıçtan sağa boşluk ekleyin
                    child: Text(
                      'Şifre',
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
              const MyTextField(
                controller: null, //??
                hintText: 'Lütfen parola giriniz',
                obscureText: true, // gizliyor yazilan seyleri
              ),

              const SizedBox(
                height: 5,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25), // Başlangıçtan sağa boşluk ekleyin
                    child: Text(
                      'Şifreyi Onayla',
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
              // sifre onaylama
              const MyTextField(
                controller: null, //??
                hintText: 'Lütfen parolanızı tekrar giriniz',
                obscureText: true, // gizliyor yazilan seyleri
              ),

              const SizedBox(
                height: 15,
              ),

              //kayit olma button
              MyButton(
                onTap: null, //??
                text: 'Kayıt Ol',
              ),
              const SizedBox(
                height: 25,
              ),

              const SizedBox(
                height: 5,
              ),

              // hazırda hesabın var mı
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hazırda zaten hesabın var mı?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    //birseyleri butona cevirmeye yariyor
                    onTap: () {
                      tabController
                          ?.animateTo(0); // Tab bar'da ikinci sekmeye geçiş yap
                    }, //??
                    child: const Text(
                      'Oturum Aç',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
