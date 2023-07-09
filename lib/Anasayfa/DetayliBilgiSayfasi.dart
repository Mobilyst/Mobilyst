import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../ColorAndType/color.dart';
import 'KampanyaRepository.dart';
import 'Urun.dart';

class DetayliBilgiSayfasi extends ConsumerWidget {
  final int id;

  const DetayliBilgiSayfasi({Key? key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Urun urun;
    var kampanyaRepository = ref.watch(kampanyaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detayli Bilgi",
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
            //const SizedBox(height: 2),
            Image.network(kampanyaRepository.urunler[id].urunFotoAddress),
            const SizedBox(height: 20),
            Text(
              kampanyaRepository.urunler[id].urunAdi,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            //const SizedBox(height: 40),
            const Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: FilledButton(
                onPressed: () {},
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
                child: const Text("Fırsata Git!",
                    style: TextStyle(
                        color: AppColors.bir,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
