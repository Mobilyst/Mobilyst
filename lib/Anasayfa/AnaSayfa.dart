import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/Anasayfa/DetayliBilgiSayfasi.dart';

import 'KampanyaRepository.dart';

class AnaSayfa extends ConsumerWidget {
  const AnaSayfa({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    var ScreenHeight = MediaQuery.of(context).size.height;
    var kampanyaRepository=ref.watch(kampanyaProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Ana Sayfa"),
        ),
        body: Center(
          child: Column(
              // Add padding around the search bar
              // Use a Material design search bar
              children: <Widget>[
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
                      icon: Icon(Icons.search),
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
                Row(
                  children: [
                    const SizedBox(width: 5),
                    const Icon(Icons.fastfood),
                    const SizedBox(width: 5),
                    const Text("Öğünleri kıyasla", textAlign: TextAlign.start),
                    const SizedBox(width: 190),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: Colors.black, // Text Color
                        ),
                        child: const Text("Tümü"))
                  ],
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      const SizedBox(width: 15),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 6),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://cdn.yeniakit.com.tr/images/news/940/hangi-sehirde-hangi-yemek-yenir-2h1580033203-e7124c.jpg'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'All',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 6),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://potatorolls.com/wp-content/uploads/Lumberjack-Breakfast3-686x640.jpg'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Breakfast',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 6),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://images.deliveryhero.io/image/fd-tr/LH/kowe-hero.jpg'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Fast Food',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 6),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://images.deliveryhero.io/image/fd-tr/LH/cx3m-hero.jpg'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Traditional',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Ink.image(
                                image: const NetworkImage(
                                    'https://images.immediate.co.uk/production/volatile/sites/2/2021/11/Croquembouche-profiterole-tower-ceb1da8.jpg?quality=90&resize=556,505'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Desserts',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ])),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    SizedBox(width: 5),
                    Icon(Icons.card_giftcard),
                    SizedBox(width: 5),
                    Text("Öne çıkan kampanyalar", textAlign: TextAlign.start),
                  ],
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      const SizedBox(width: 15),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 6),
                              Ink.image(
                                image: NetworkImage(
                                    "${kampanyaRepository.urunler[0].urunFotoAddress}"),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                               Text(
                                kampanyaRepository.urunler[0].urunAdi,
                                style: TextStyle(color: Colors.black),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const DetayliBilgiSayfasi(id: 0),
                                      ),
                                    );
                                  },
                                  child: Text("Detaylı bilgi için tıklayınız"))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {},
                          child: Column(
                            children: [
                              const SizedBox(height: 6),
                              Ink.image(
                                image: NetworkImage(
                                    "${kampanyaRepository.urunler[1].urunFotoAddress}"),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                               Text(
                                kampanyaRepository.urunler[1].urunAdi,
                                style: TextStyle(color: Colors.black),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const DetayliBilgiSayfasi(id: 1),
                                      ),
                                    );
                                  },
                                  child: Text("Detaylı bilgi için tıklayınız."))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                    ]
                    )
                ),
              ]
          ),
        )
    );
  }




}
