import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/oktay/yemek_ekrani/yemekBilgileri.dart';
import 'package:mobilyst/oktay/yemek_ekrani/yemekRepository.dart';

import '../../ColorAndType/color.dart';

class MyYemekKategoriPage extends ConsumerStatefulWidget {
  final String kategoriAdi;
  const MyYemekKategoriPage({super.key,required this.kategoriAdi});

  @override
  _MyYemekKategoriPageState createState() => _MyYemekKategoriPageState();
}

class _MyYemekKategoriPageState extends ConsumerState<MyYemekKategoriPage> {
  TextEditingController editingController = TextEditingController();
  List<Yemek> filterMeals = [];
  List<Yemek> meals = [];

  late String seciliFiltre = filtreList[0];

  List<String> filtreList = [
    'Tümü',
    '20 TL - 100 TL',
    '100 TL - 200 TL',
    '200 TL - 300 TL'
  ];

  SiralamaSecenekleri selectedSortOption = SiralamaSecenekleri.Sirala;


  @override
  void initState() {
    super.initState();
    setState(() {
      meals = ref.read(yemekRepositoryProvider).getMEals(widget.kategoriAdi);
      filterMeals.addAll(meals);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              )),
          title: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 8),
              child: TextField(
                onChanged: (text) {
                  yemekAra(text);
                },
                controller: editingController,
                decoration: InputDecoration(
                  hintText: 'Ara...',
                  suffixIcon: IconButton(
                    color: AppColors.yedi,
                    onPressed: () => {
                      setState(() {
                        editingController.clear();
                      }),
                      // Perform the search here
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.yedi,
                    ),
                    onPressed: () {},
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.grey, // Normal durumda kenar çizgi rengi
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color:
                          Colors.grey, // Tiklandiktan sonra kenar çizgi rengi
                      width: 2.0,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<SiralamaSecenekleri>(
                  value: selectedSortOption,
                  onChanged: (SiralamaSecenekleri? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedSortOption = newValue;
                      });
                    }
                    sortMeals();
                  },
                  items: const [
                    DropdownMenuItem(
                      value: SiralamaSecenekleri.Sirala,
                      child: Text("Önerilen Sıralama"),
                    ),
                    DropdownMenuItem(
                      value: SiralamaSecenekleri.PriceDescending,
                      child: Text("Fiyata Göre Azalan"),
                    ),
                    DropdownMenuItem(
                      value: SiralamaSecenekleri.PriceAscending,
                      child: Text("Fiyata Göre Artan"),
                    ),
                    DropdownMenuItem(
                      value: SiralamaSecenekleri.MostPopular,
                      child: Text("En Çok Değerlendirilen"),
                    ),
                    DropdownMenuItem(
                      value: SiralamaSecenekleri.Popular,
                      child: Text("Popüler Olan"),
                    ),
                    DropdownMenuItem(
                      value: SiralamaSecenekleri.NewArrivals,
                      child: Text("Yeni Ürünler"),
                    ),
                    DropdownMenuItem(
                      value: SiralamaSecenekleri.Discounted,
                      child: Text("İndirimli Ürünler"),
                    ),
                  ],
                ),
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) => SimpleDialog(
                              title: const Text('Filtrele'),
                              children: [
                                ListTile(
                                    title: Text(filtreList[0]),
                                    leading: Radio(
                                      value: filtreList[0],
                                      groupValue: seciliFiltre,
                                      onChanged: (value) => setState(() =>
                                          seciliFiltre = value.toString()),
                                    )),
                                ListTile(
                                    title: Text(filtreList[1]),
                                    leading: Radio(
                                      value: filtreList[1],
                                      groupValue: seciliFiltre,
                                      onChanged: (value) => setState(() =>
                                          seciliFiltre = value.toString()),
                                    )),
                                ListTile(
                                    title: Text(filtreList[2]),
                                    leading: Radio(
                                      value: filtreList[2],
                                      groupValue: seciliFiltre,
                                      onChanged: (value) => setState(() =>
                                          seciliFiltre = value.toString()),
                                    )),
                                ListTile(
                                    title: Text(filtreList[3]),
                                    leading: Radio(
                                      value: filtreList[3],
                                      groupValue: seciliFiltre,
                                      onChanged: (value) => setState(() =>
                                          seciliFiltre = value.toString()),
                                    )),
                              ],
                            ),
                          );
                        },
                      ).then((_) {
                        if (seciliFiltre == filtreList[0]) {
                          filterMeals.clear();
                          filterMeals.addAll(meals);
                        } else if (seciliFiltre == filtreList[1]) {
                          filterMeals.clear();
                          for (var i = 0; i < meals.length; i++) {
                            if (meals[i].price >= 20 && meals[i].price <= 100) {
                              filterMeals.add(meals[i]);
                            }
                          }
                        } else if (seciliFiltre == filtreList[2]) {
                          filterMeals.clear();
                          for (var i = 0; i < meals.length; i++) {
                            if (meals[i].price >= 100 &&
                                meals[i].price <= 200) {
                              filterMeals.add(meals[i]);
                            }
                          }
                        } else if (seciliFiltre == filtreList[3]) {
                          filterMeals.clear();
                          for (var i = 0; i < meals.length; i++) {
                            if (meals[i].price >= 200 &&
                                meals[i].price <= 300) {
                              filterMeals.add(meals[i]);
                            }
                          }
                        }
                        setState(() {});
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Fitrele'),
                        Padding(padding: EdgeInsets.all(8)),
                        Icon(Icons.filter_list_outlined)
                      ],
                    ))
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 0.7, // Oranı ayarlayabilirsiniz
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          filterMeals[index].isSelected =
                              !filterMeals[index].isSelected;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.notifications,
                            color: filterMeals[index].isSelected
                                ? Colors.red
                                : Colors.green,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 100,
                      child: Image.network(filterMeals[index].resimUrl),
                    ),
                    Text(filterMeals[index].name),
                    Text(
                        "Fiyat: ${filterMeals[index].price.toStringAsFixed(2)}"),

                  ],
                ),
              );
            },
            itemCount: filterMeals.length,
          ),
        ],
      ),
    );
  }


  void yemekAra(String text) {
    if (text.isEmpty) {
      filterMeals.clear();
      meals.forEach((element) {
        filterMeals.add(element);
      });
      setState(() {});
      return;
    }
    filterMeals.clear();
    for (var i = 0; i < meals.length; i++) {
      if (meals[i].name.toLowerCase().contains(text.toLowerCase())) {
        filterMeals.add(meals[i]);
      }
    }
    setState(() {});
  }

  void sortMeals() {
    switch (selectedSortOption) {
      case SiralamaSecenekleri.PriceDescending:
        filterMeals.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SiralamaSecenekleri.PriceAscending:
        filterMeals.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SiralamaSecenekleri.Popular:
        // Sıralama işlemleri
        break;
      case SiralamaSecenekleri.NewArrivals:
        // Sıralama işlemleri
        break;
      case SiralamaSecenekleri.Discounted:
        // Sıralama işlemleri
        break;
      case SiralamaSecenekleri.Sirala:
        // Sıralama işlemleri
        break;
    }
  }
}
