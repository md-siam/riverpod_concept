import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product_model.dart';

final cartStateNotifierProvider =
    StateNotifierProvider.autoDispose<CartStateNotifier, List<ProductModel>>(
        (ref) {
  return CartStateNotifier();
});

class CartStateNotifier extends StateNotifier<List<ProductModel>> {
  CartStateNotifier() : super([]);

  void addProduct(ProductModel product) {
    state = [...state, product];
  }

  void clearCart() {
    state = [];
  }
}
