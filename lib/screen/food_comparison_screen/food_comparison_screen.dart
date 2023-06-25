import 'package:flutter/material.dart';

class FoodComparisonScreen extends StatefulWidget {
  @override
  State<FoodComparisonScreen> createState() => _FoodComparisonScreenState();
}

class _FoodComparisonScreenState extends State<FoodComparisonScreen> {
  bool isView = false;
  bool isSelected = false;
  int selectedIndex = -1;

  String imagePath =
      'https://www.wallpaperup.com/uploads/wallpapers/2018/08/26/1288779/ddf7bc5e8fb7d58f862ac9c7f08ad9d3-1400.jpg';
  int selectedOption = 0;
  List<String> titles = [
    "En Popüler Ürünler",
    "En Düşük Fiyat",
    "En Yüksek Fiyat",
    "Fiyatı Düşenler",
    "En Yeni Ürünler"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                setState(() {
                  isView = !isView;
                  print(isView);
                });
              },
              child: InkWell(
                onTap: () {
                  setState(() {
                    isView = !isView;
                    print(isView);
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.format_list_bulleted,
                      size: 40,
                      color: Colors.black,
                    ),
                    Text(
                      "Sırala",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
            for (int i = 0; i < 5; i++)
              isView == true
                  ? RadioListTile(
                      title: Text(titles[i]),
                      value: i,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value as int;
                        });
                      },
                    )
                  : const Center(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                ),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("basıldı");
                        }, //ilgili kartın detayına gidecek onTap
                        child: Container(
                          color: Colors.grey[300],
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: NetworkImage(imagePath),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add_alert_outlined),
                            color: Colors.white,
                            onPressed: () {
                              // Alarm butonuna tıklandığında yapılacak işlemler
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
