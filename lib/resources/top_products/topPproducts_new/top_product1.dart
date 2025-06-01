import 'package:cart/view/myCart/myCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../view/productDetails/productDetails.dart';
import '../../../viewModel/controller/cartController.dart';
import '../../items/items2.dart';



class TopProduct1 extends StatelessWidget {
  const TopProduct1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topProducts.length,
            itemBuilder: (context, index) {
              final product = topProducts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProductCard(product: product),
              );
            },
          ),
        ),
      ],
    );
  }
}
//
// class ProductCard extends StatelessWidget {
//   final Product product;
//
//   const ProductCard({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 130,
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(color: Colors.grey.shade200, blurRadius: 6, offset: Offset(2, 2)),
//         ],
//       ),
//       child: Column(
//         children: [
//           Expanded(
//             child: Image.asset(product.image, fit: BoxFit.cover,width: 200,),
//           ),
//           const SizedBox(height: 8),
//           FittedBox(child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.w500))),
//           const SizedBox(height: 4),
//           ElevatedButton(
//             onPressed: () {
//               final cartController = Get.find<CartController>();
//               cartController.addToCart(product);
//               Get.snackbar("Cart Updated", "${product.name} added to cart");
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.deepPurple,
//               minimumSize: const Size.fromHeight(30),
//             ),
//             child: const Center(
//               child: FittedBox(child: Text("Add to cart", style: TextStyle(fontSize: 12, color: Colors.white))),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text('৳${product.price.toStringAsFixed(2)}'),
//         ],
//       ),
//     );
//   }
// }
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailsScreen(product: product));
              },
              child: Image.asset(product.image, fit: BoxFit.cover, width: 200),
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.w500))),
          const SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {
              final cartController = Get.find<CartController>();
              cartController.addToCart(product);
              Get.snackbar("Cart Updated", "${product.name} added to cart");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              minimumSize: const Size.fromHeight(30),
            ),
            child: const Center(
              child: FittedBox(child: Text("Add to cart", style: TextStyle(fontSize: 12, color: Colors.white))),
            ),
          ),
          const SizedBox(height: 4),
          Text('৳${product.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}