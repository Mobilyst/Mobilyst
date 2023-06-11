import 'package:flutter/material.dart';
import 'package:mobilyst/hesabim/tabs/button/girisButton.dart';
import 'package:mobilyst/hesabim/tabs/secondSignUp.dart';
import 'package:mobilyst/hesabim/tabs/sifreUnuttumPage.dart';
import 'package:mobilyst/hesabim/textfield/testField.dart';

class SignInPage extends StatelessWidget {
  final TabController? tabController;
  const SignInPage({Key? key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 88,
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
            //ad textfield
            const MyTextField(
              hintText: 'Lütfen e-posta adresi giriniz',
              obscureText: false,
              controller: null, // ??
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
              height: 10,
            ),

            // sifreyi unutma
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: null, //??
                    child: const Text(
                      'Şifremi Unuttum',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //kayit olma button
            const MyButton(
              text: 'Giriş Yap',
              onTap: null, //??
            ),

            const SizedBox(
              height: 25,
            ),

            // uye degilmisin kayit ol
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Henüz üye değil misiniz?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  //birseyleri butona cevirmeye yariyor
                  onTap: () {
                    tabController
                        ?.animateTo(1); // Tab bar'da ikinci sekmeye geçiş yap
                  }, //??
                  child: const Text(
                    'Üye ol',
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
    );
  }
}
