import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ColorAndType/color.dart';
import 'KampanyaRepository.dart';
import 'Urun.dart';

class DetayliBilgiSayfasi extends ConsumerWidget {
  final int id;

  const DetayliBilgiSayfasi({Key? key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var kampanyaRepository = ref.watch(kampanyaProvider);
    final urun = kampanyaRepository.urunler.expand((list) => list).toList()[id];

    void launchURL()  {
         launch(urun.SayfaUrl);
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
                onPressed: launchURL, // Güncellenen satır
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.dort),
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(350, 50)), // Genişlik ve yükseklik ayarı
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Kenar yarıçapı ayarı
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
