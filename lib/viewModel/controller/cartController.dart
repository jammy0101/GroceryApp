import 'package:get/get.dart';
import '../../models/cartModel.dart';
import '../../resources/items/items2.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product.name == product.name);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.product.name == product.name);
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    cartItems.refresh();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      cartItems.refresh();
    } else {
      removeFromCart(item.product);
    }
  }

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  int get totalCartQuantity => cartItems.fold(0, (sum, item) => sum + item.quantity);

}
