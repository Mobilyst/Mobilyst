import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/GirisOlaylari/tabs/button/girisButton.dart';
import 'package:mobilyst/GirisOlaylari/tabs/textfield/testField.dart';

class MyForgetPasswordPage extends StatefulWidget {
  MyForgetPasswordPage({super.key});

  @override
  State<MyForgetPasswordPage> createState() => _MyForgetPasswordPageState();
}

class _MyForgetPasswordPageState extends State<MyForgetPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    String email = emailController.text;
    if (email.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Hata',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            content: Text(
              'Lütfen tüm alanları doldurun.',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Tamam",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.uc,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    await FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: emailController.text,
    )
        .then((userCredential) {
      // Oturum açma başarılı olduğunda yönlendirme işlemini gerçekleştir
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: LineIcon(Icons.email_rounded),
            title: Text(
              "Şifre Yenileme",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            content: Text(
                " $email adresine şifre yenileme linkiniz gönderildi.",
                textAlign: TextAlign.center),
            actions: [
              TextButton(
                onPressed: () {
                  context.go('/hesabim'); // İletişim kutusunu kapat
                },
                child: Text(
                  "Tamam",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.uc,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      // Hata durumuna göre mesaj göster
      String errorMessage = 'Bir hata oluştu.';

      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'user-not-found':
            errorMessage = 'Böyle bir kullanıcı bulunamadı.';
            break;
          case 'invalid-email':
            errorMessage = 'Geçersiz e-posta adresi.';
            break;
          // Diğer hata durumları için gerekli case'leri ekleyebilirsiniz.
        }
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Hata',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // İletişim kutusunu kapat
              },
              child: Text(
                "Tamam",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.uc,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Şifremi Unuttum",
          style: TextStyle(
            color: AppColors.bir,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: AppColors.uc,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 30,
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
                      fontSize: 16, // Metin boyutunu 18 olarak ayarlar
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

            //kayit olma button
            MyButton(
              onTap: passwordReset,
              text: 'Şifreyi Sıfırla', //??
            ),
          ]),
        ),
      ),
    );
  }
}
