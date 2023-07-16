import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteProduct {
  final String productId;
  final String productName;
  final String productImageUrl;
  final dynamic productPrice;
  final String productPageUrl;
  final String productCategory;
  final String userId;

  FavoriteProduct({
    required this.productId,
    required this.productName,
    required this.productImageUrl,
    required this.productPrice,
    required this.productPageUrl,
    required this.productCategory,
    required this.userId,
  });

  // Firestore'dan veri almak için kullanılacak fabrika metodu
  factory FavoriteProduct.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FavoriteProduct(
      productId: doc.id,
      productName: data['productName'],
      productImageUrl: data['productImageUrl'],
      productPrice: data['productPrice'],
      productPageUrl: data['productPageUrl'],
      productCategory: data['productCategory'],
      userId: data['userId'],
    );
  }

  // Firestore'a veri eklemek için kullanılacak yöntem
  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productImageUrl': productImageUrl,
      'productPrice': productPrice,
      'productPageUrl': productPageUrl,
      'productCategory': productCategory,
      'userId': userId,
    };
  }
}
