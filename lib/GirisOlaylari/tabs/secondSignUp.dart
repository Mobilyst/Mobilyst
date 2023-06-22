import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilyst/GirisOlaylari/tabs/button/girisButton.dart';
import 'package:mobilyst/GirisOlaylari/tabs/textfield/testField.dart';

class SignUpPage extends StatefulWidget {
  final TabController? tabController;

  const SignUpPage({Key? key, this.tabController}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //giris kulanici method
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signUserUp() async {
    // Yukleniyor
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Hata',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Lütfen tüm alanları doldurun.',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // yukleniyordan cikis
                  Navigator.pop(context);
                },
                child: Text(
                  "Tamam",
                  style: TextStyle(
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
    // yukleniyordan cikis
    Navigator.pop(context);

    if (passwordController.text == confirmPasswordController.text) {
      try {
        // Firebase kullanıcı oluşturma işlemi
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        // Yukleniyordan çıkış
        Navigator.pop(context);

        // Tabbar'a geçiş yap
        widget.tabController?.animateTo(0);
      } catch (error) {
        // Yukleniyordan çıkış
        Navigator.pop(context);

        // Hata durumuna göre mesaj göster
        String errorMessage = 'Bilinmeyen bir hata oluştu.';

        if (error is FirebaseAuthException) {
          switch (error.code) {
            case 'email-already-in-use':
              errorMessage = 'Bu e-posta adresi zaten kullanımda.';
              break;
            case 'invalid-email':
              errorMessage = 'Geçersiz e-posta formatı.';
              break;
            case 'weak-password':
              errorMessage = 'Şifre çok zayıf. Daha güçlü bir şifre deneyin.';
              break;
          }
        }

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Hata',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {});
                },
                child: Text(
                  "Tamam",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    } else {
      // Yukleniyordan çıkış
      Navigator.pop(context);
      // Şifreler uyuşmuyor diye hata mesajı göster
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Hata',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              "Şifreler aynı değil, lütfen kontrol ediniz.",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {});
                },
                child: Text(
                  "Tamam",
                  style: TextStyle(
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
              MyTextField(
                controller: emailController, //??
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
              MyTextField(
                controller: passwordController, //??
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
              MyTextField(
                controller: confirmPasswordController, //??
                hintText: 'Lütfen parolanızı tekrar giriniz',
                obscureText: true, // gizliyor yazilan seyleri
              ),

              const SizedBox(
                height: 15,
              ),

              //kayit olma button
              MyButton(
                onTap: signUserUp, //??
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
                      widget.tabController
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
