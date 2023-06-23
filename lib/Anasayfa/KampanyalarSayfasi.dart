import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        appBar: AppBar(title: const Text("Kampanyalı Ürünler")),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                const SizedBox(height: 10),
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
                ),
                const SizedBox(height: 10),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Stack(
                                  children: [
                                    Material(
                                      elevation: 8,
                                      borderRadius: BorderRadius.circular(28),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: ListView(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          children: [
                                            Image.network(
                                              kampanyaliUrunler[index]
                                                  .urunFotoAddress,
                                              height: 150,
                                              width: 150,
                                            ),
                                            Text(kampanyaliUrunler[index]
                                                .urunAdi),
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
                                                child:
                                                    const Text("Detaylı Bilgi >"))
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
        ));
  }
}

/*
for (var urun in kampanyaliUrunler)


 */
