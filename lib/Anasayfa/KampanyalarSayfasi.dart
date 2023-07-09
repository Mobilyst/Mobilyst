import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'DetayliBilgiSayfasi.dart';
import 'KampanyaRepository.dart';
import 'Urun.dart';

class KampanyalarSayfasi extends ConsumerWidget {
  const KampanyalarSayfasi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    var kampanyaRepository = ref.watch(kampanyaProvider);
    List<Urun> kampanyaliUrunler = kampanyaRepository.urunler;

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
          child: Column(
            children: [
              const SizedBox(height: 10),
              /*
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Ara...',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: FaIcon(FontAwesomeIcons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),*/
              const SizedBox(height: 10),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: kampanyaliUrunler.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, // Kenar çizgisi rengi
                                width: 1, // Kenar çizgisi kalınlığı
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  Material(
                                    elevation: 8,
                                    borderRadius: BorderRadius.circular(5),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: ListView(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Image.network(
                                              kampanyaliUrunler[index]
                                                  .urunFotoAddress,
                                              height: 200,
                                              width: 160),
                                          const SizedBox(height: 3),
                                          Center(
                                            child: Text(
                                              kampanyaliUrunler[index].urunAdi,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 0.1),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetayliBilgiSayfasi(
                                                            id: index),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                "Detaylı Bilgi >",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.yedi),
                                              )),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

/*
for (var urun in kampanyaliUrunler)


 */
