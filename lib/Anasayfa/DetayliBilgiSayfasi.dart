

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'KampanyaRepository.dart';
import 'Urun.dart';

class DetayliBilgiSayfasi extends ConsumerWidget{
  final int id;

  const DetayliBilgiSayfasi({Key? key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final Urun urun;
  var kampanyaRepository=ref.watch(kampanyaProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text("Detaylı Bilgi"),
        ),
        body: Center(
          child: Column(
            children: <Widget> [
              const SizedBox(height:20),
              Image.network(
                  kampanyaRepository.urunler[id].urunFotoAddress
              ),
              const SizedBox(height: 20),
              Text(kampanyaRepository.urunler[id].urunAdi),
              const SizedBox(height: 20),
              FilledButton(onPressed: () {
              },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.black)
                ), child: const Text("Fırsata Git!",style: TextStyle(color: Colors.white)),
              )


            ],
          ),
        ),
    );
  }

}