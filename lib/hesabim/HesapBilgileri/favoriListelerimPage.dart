import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../oktay/OktayKarsilastirma/favoriRepository.dart';
import '../../oktay/OktayKarsilastirma/karsilastirma_ekrani/favoriModel.dart';

final favoriteStateProvider = StateProvider<bool>((ref) => false);

class FavorilerSayfasi extends ConsumerWidget {
  const FavorilerSayfasi({Key? key});
  void removeFromFavorites(FavoriteProduct product, WidgetRef ref) async {
    final favoriteRepository = ref.read(favoriteRepositoryProvider);

    try {
      await favoriteRepository.removeProductFromFavorites(product.productId);
    } catch (e) {
      // Handle any errors that may occur during removal (e.g., network errors).
      print("Error removing product from favorites: $e");
    }

    // Refresh the favorite products list after removal
    ref.refresh(favoriteRepositoryProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isProductInFavorites = false;
    final TextEditingController searchController = TextEditingController();
    final favoriteRepository = ref.read(favoriteRepositoryProvider);
    final favoriteState = ref.watch(favoriteStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favori Listelerim",
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
          padding: const EdgeInsets.all(10),
          child: FutureBuilder<List<FavoriteProduct>>(
            future: favoriteRepository.getFavorites(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                final List<FavoriteProduct>? favoriteProducts = snapshot.data;
                if (favoriteProducts == null || favoriteProducts.isEmpty) {
                  return Center(child: Text("No favorites found."));
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.62,
                  ),
                  itemCount: favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final FavoriteProduct product = favoriteProducts[index];
                    return Align(
                      alignment:
                          Alignment.topRight, // Align to the top-right corner.
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width:
                              180, // Set the width to control the column width.
                          height: 295,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColors.bes,
                                    ),
                                    onPressed: () {
                                      removeFromFavorites(product, ref);
                                    },
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Image.network(
                                  product.productImageUrl,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                child: Text(
                                  product.productName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                '${product.productPrice} TL',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: AppColors.bes,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                margin: EdgeInsets.only(bottom: 0.1),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Ürüne Git >",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.yedi,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
