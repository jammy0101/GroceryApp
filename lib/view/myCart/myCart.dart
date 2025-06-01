import 'package:cart/view/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/bottumNavigationBar/bottumnavigationbar.dart';
import '../../resources/color/colors.dart';
import '../../viewModel/controller/cartController.dart';

class MyCart extends StatefulWidget {
  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final CartController cartController = Get.find<CartController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("My Cart"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        centerTitle: true,
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
      bottomNavigationBar: BottomNavigation(index: 2),
      body: Obx(
        () => ListView(
          children: [
            ...cartController.cartItems.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                child: Card(
                  child: ListTile(
                    leading: Image.asset(item.product.image, width: 50),
                    title: Text(item.product.name),
                    subtitle: Text(
                      "৳${item.product.price.toStringAsFixed(2)} x ${item.quantity}",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed:
                              () => cartController.decreaseQuantity(item),
                        ),
                        Text('${item.quantity}'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed:
                              () => cartController.increaseQuantity(item),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Total: ৳${cartController.totalPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                    Get.to(Payment());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                 child: Text("Pay Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
