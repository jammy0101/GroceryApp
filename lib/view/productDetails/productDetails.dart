import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../resources/color/colors.dart';
import '../../resources/items/items2.dart';
import '../account/account.dart';
import '../myCart/myCart.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(product.name),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.search_sharp,color: Colors.white,),
          ),
          Obx(() => Stack(
            children: [
              IconButton(
                onPressed: () {
                  Get.to(MyCart());
                },
                icon: Icon(
                  Icons.notifications,
                  color: AppColor.whiteColor,
                  size: 27,
                ),
              ),
              if (cartController.totalCartQuantity > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cartController.totalCartQuantity}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Image.asset(product.image, height: 300,width: 200,)),
            const SizedBox(height: 16),
            Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('৳${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
