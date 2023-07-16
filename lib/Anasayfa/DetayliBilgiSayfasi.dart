import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ColorAndType/color.dart';
import '../GirisOlaylari/tabs/firstSignIn.dart';
import 'KampanyaRepository.dart';
import 'Urun.dart';

class DetayliBilgiSayfasi extends ConsumerWidget {
  final int id;
  const DetayliBilgiSayfasi({Key? key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var kampanyaRepository = ref.watch(kampanyaProvider);
    final urun = kampanyaRepository.urunler.expand((list) => list).toList()[id];

    void launchURL() async {
      if (FirebaseAuth.instance.currentUser != null) {
        // Kullanıcı girişi yapıldıysa direkt olarak web sitesine yönlendir.
        await launch(urun.SayfaUrl);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Uyarı",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              content: Text(
                  textAlign: TextAlign.start,
                  "Fırsata gitmek için giriş yapmanız gerekiyor. Lütfen giriş yapınız."),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.uc,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    context.go('/hesabim');
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    "İptal",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.uc,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detaylı Bilgi",
          style: TextStyle(
            color: AppColors.bir,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: AppColors.uc,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 2),
            Image.network(urun.ResimUrl),
            const SizedBox(height: 20),
            Text(
              urun.Baslik,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: FilledButton(
                onPressed: launchURL,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.dort),
                  minimumSize: MaterialStateProperty.all<Size>(Size(350, 50)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Fırsata Git!",
                  style: TextStyle(
                    color: AppColors.bir,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
