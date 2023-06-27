class Yemek {
  String name;
  double price;
  int popularity;
  String resimUrl;
  bool isSelected; // Yeni özellik

  Yemek(this.name, this.price, this.popularity, this.resimUrl, this.isSelected);
}

enum SiralamaSecenekleri {
  Sirala,
  PriceDescending,
  PriceAscending,
  MostPopular,
  Popular,
  NewArrivals,
  Discounted,
}