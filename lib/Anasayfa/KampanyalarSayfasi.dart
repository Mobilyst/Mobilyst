import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'DetayliBilgiSayfasi.dart';
import 'KampanyaRepository.dart';
import 'Urun.dart';

class KampanyalarSayfasi extends ConsumerWidget {
  const KampanyalarSayfasi({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    final kampanyaRepository = ref.watch(kampanyaProvider);
    final List<List<kampanyalar>> kampanyaliUrunler =
        kampanyaRepository.urunler;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kampanyalı Ürünler",
          style: TextStyle(
            color: AppColors.bir,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: AppColors.uc,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 15,
              childAspectRatio: 0.62,
            ),
            itemCount: kampanyaliUrunler.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: kampanyaliUrunler[index]
                    .map((urun) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetayliBilgiSayfasi(
                                  id: index,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 295,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Image.network(
                                    urun.ResimUrl,
                                    height: 190,
                                    width: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    urun.Baslik,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: EdgeInsets.only(bottom: 0.1),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetayliBilgiSayfasi(
                                            id: index,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Detaylı Bilgi >",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.yedi,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
