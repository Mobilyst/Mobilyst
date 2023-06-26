import 'package:flutter/material.dart';
import 'package:mobilyst/screen/food_comparison_screen/food_bilgileri.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Yemek> meals = [
    Yemek("Hamburger", 25.99, 4,
        'https://cdn-icons-png.flaticon.com/128/706/706918.png', false),
    Yemek("Pizza", 12.99, 2,
        'https://cdn-icons-png.flaticon.com/128/6127/6127889.png', false),
    Yemek("Adana Kebap", 8.99, 5,
        'https://cdn-icons-png.flaticon.com/128/10614/10614469.png', false),
    Yemek("Lahmacun", 19.99, 3,
        'https://cdn-icons-png.flaticon.com/128/10614/10614469.png', false),
  ];

  SiralamaSecenekleri selectedSortOption = SiralamaSecenekleri.Sirala;

  void sortMeals() {
    switch (selectedSortOption) {
      case SiralamaSecenekleri.PriceDescending:
        meals.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SiralamaSecenekleri.PriceAscending:
        meals.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SiralamaSecenekleri.MostPopular:
        meals.sort((a, b) => b.popularity.compareTo(a.popularity));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  icon: const Icon(Icons.sort_rounded),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          meals[index].isSelected = !meals[index].isSelected;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.notifications,
                            color: meals[index].isSelected
                                ? Colors.red
                                : Colors.green,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 100,
                      child: Image.network(meals[index].resimUrl),
                    ),
                    Text(meals[index].name),
                    Text("Fiyat: ${meals[index].price.toStringAsFixed(2)}"),
                    Text("Popülerlik: ${meals[index].popularity}"),
                  ],
                ),
              );
            },
            itemCount: meals.length,
          ),
        ],
      ),
    );
  }
}
