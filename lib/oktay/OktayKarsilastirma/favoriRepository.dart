import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'karsilastirma_ekrani/favoriModel.dart';

final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) {
  return FavoriteRepository();
});

class FavoriteRepository {
    final CollectionReference favoritesCollection =
      FirebaseFirestore.instance.collection("favorites");

  Future<void> addProductToFavorites(FavoriteProduct product) async {
    await favoritesCollection.add(product.toMap());
  }

  Future<void> removeProductFromFavorites(String productId) async {
    await favoritesCollection.doc(productId).delete();
  }

  Future<bool> isProductInFavorites(String productName) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return false;
    }

    final querySnapshot = await favoritesCollection
        .where('productName', isEqualTo: productName)
        .where('userId', isEqualTo: currentUser.uid)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<List<FavoriteProduct>> getFavorites() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }

    final querySnapshot = await favoritesCollection
        .where('userId', isEqualTo: currentUser.uid)
        .get();

    return querySnapshot.docs
        .map((doc) => FavoriteProduct.fromFirestore(doc))
        .toList();
  }
}
