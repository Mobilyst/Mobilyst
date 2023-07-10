import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/GirisOlaylari/tabs/button/girisButton.dart';
import 'package:mobilyst/GirisOlaylari/tabs/textfield/testField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SifreDegisikligiPage extends StatefulWidget {
  SifreDegisikligiPage({super.key});

  @override
  State<SifreDegisikligiPage> createState() => _SifreDegisikligiPageState();
}

class _SifreDegisikligiPageState extends State<SifreDegisikligiPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  void _changePassword(BuildContext context) async {
    final User? user = _auth.currentUser;
    if (user != null) {
      final String email = user.email!;
      final String currentPassword = _currentPasswordController.text;
      final String newPassword = _newPasswordController.text;
      final String confirmNewPassword = _confirmNewPasswordController.text;

      if (currentPassword.isEmpty ||
          newPassword.isEmpty ||
          confirmNewPassword.isEmpty) {
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

      if (newPassword == confirmNewPassword) {
        try {
          AuthCredential credential = EmailAuthProvider.credential(
              email: email, password: currentPassword);
          await user.reauthenticateWithCredential(credential);
          await user.updatePassword(newPassword);

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Şifre Değiştirildi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              content: Text('Şifreniz başarıyla değiştirildi.'),
              actions: [
                TextButton(
                  child: Text(
                    "Tamam",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.uc,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    _currentPasswordController.clear();
                    _newPasswordController.clear();
                    _confirmNewPasswordController.clear();
                    Navigator.of(context).pop();
                    context.go(
                        '/hesabim/hesapbilgi'); // Hesap bilgileri sayfasına geri dön
                  },
                ),
              ],
            ),
          );
        } catch (error) {
          // Hata durumuna göre mesaj göster
          String errorMessage = 'Bilinmeyen bir hata oluştu.';

          if (error is FirebaseAuthException) {
            switch (error.code) {
              case 'wrong-password':
                errorMessage = 'Mevcut şifre hatalı.';
                break;
              case 'weak-password':
                errorMessage =
                    'Yeni şifre zayıf. Daha güçlü bir şifre deneyin.';
                break;
              case 'requires-recent-login':
                errorMessage =
                    'Yeniden giriş yapmanız gerekiyor. Lütfen çıkış yapın ve tekrar giriş yapın.';
                break;
            }
          }
          //showModalBottomSheet

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
        }
      } else {
        // Şifreler uyuşmuyor diye hata mesajı göster
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Hata',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              content: Text(
                "Şifreler aynı değil, lütfen kontrol ediniz.",
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Şifre Değişikliği",
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
              controller: _currentPasswordController, //??
              hintText: 'Mevcut şifrenizi giriniz',
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
              controller: _newPasswordController, //??
              hintText: 'Yeni şifrenizi giriniz',
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
              controller: _confirmNewPasswordController, //??
              hintText: 'Yeni şifrenizi tekrar giriniz',
              obscureText: true, // gizliyor yazilan seyleri
            ),

            const SizedBox(
              height: 25,
            ),

            //kayit olma button
            MyButton(
              onTap: () => _changePassword(context), //??
              text: 'Şifreyi Güncelle', //??
            ),
          ],
        ),
      )),
    );
  }
}
