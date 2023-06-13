import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobilyst/hesabim/hesabimPage.dart';
import 'package:mobilyst/hesabim/tabs/button/girisButton.dart';
import 'package:mobilyst/hesabim/tabs/secondSignUp.dart';
import 'package:mobilyst/hesabim/tabs/sifreUnuttumPage.dart';
import 'package:mobilyst/hesabim/tabs/textfield/testField.dart';
import 'package:mobilyst/homePage.dart';
import 'package:mobilyst/navigationBar.dart';
import '../girisPage.dart';

class SignInPage extends StatefulWidget {
  final TabController? tabController;
  const SignInPage({Key? key, this.tabController}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // text duzenleme kontrolleri
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //giris kulanici method
  Future<void> signUserIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((userCredential) {
      // Oturum açma başarılı olduğunda yönlendirme işlemini gerçekleştir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HesabimPage()),
      );
    }).catchError((error) {
      // Oturum açma işlemi başarısız olduğunda hata mesajı göster
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Hata'),
                content: Text('Oturum açma işlemi başarısız.'),
              ));
    });
  }

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
            //email textfield
            MyTextField(
              controller: emailController,
              hintText: 'Lütfen e-posta adresi giriniz',
              obscureText: false,
              // ??
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
            MyTextField(
              controller: passwordController, //??
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
            MyButton(
              onTap: signUserIn,
              text: 'Giriş Yap', //??
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
                    widget.tabController
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
