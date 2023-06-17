import 'package:flutter/material.dart';
import 'package:mobilyst/GirisOlaylari/tabs/button/girisButton.dart';
import 'package:mobilyst/GirisOlaylari/tabs/textfield/testField.dart';

class SifreDegisikligiPage extends StatelessWidget {
  const SifreDegisikligiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Şifre Değişikliği',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                      left: 25), // Başlangıçtan sağa boşluk ekleyin
                  child: Text(
                    'Mevcut Şifreniz',
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
              hintText: 'Mevcut şifrenizi giriniz',
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
            MyTextField(
              controller: null, //??
              hintText: 'Yeni şifrenizi giriniz',
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

            //sifre textfield
            MyTextField(
              controller: null, //??
              hintText: 'Yeni şifrenizi tekrar giriniz',
              obscureText: true, // gizliyor yazilan seyleri
            ),

            const SizedBox(
              height: 30,
            ),

            //kayit olma button
            MyButton(
              onTap: null, //??
              text: 'Şifreyi Güncelle', //??
            ),
          ],
        ),
      )),
    );
  }
}
