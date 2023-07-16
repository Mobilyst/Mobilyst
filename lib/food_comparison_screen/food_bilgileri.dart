class products {
  String productsId;
  String category;
  String image_url;
  String name;
  dynamic price;
  String product_url;
  products(
    this.productsId,
    this.category,
    this.image_url,
    this.name,
    this.price,
    this.product_url,
  );
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
