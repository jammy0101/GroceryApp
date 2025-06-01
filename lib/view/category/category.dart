import 'package:cart/view/Machines/machinies.dart';
import 'package:cart/view/Medicine/medicine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/bottumNavigationBar/bottumnavigationbar.dart';
import '../../resources/color/colors.dart';
import '../../resources/top_products/top_product2.dart';
import '../../resources/top_products/top_products.dart';
import '../../viewModel/controller/cartController.dart';
import '../babykids/babykids.dart';
import '../electronics/electronics.dart';
import '../myCart/myCart.dart';
import 'category.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}



class _CategoryState extends State<Category> {
  void navigateToCategory(String title) {
    switch (title) {
      case 'Baby Kids':
        Get.to(BabyKids());
        break;
      case 'Electronics':
        Get.to(Electronics());
        break;
      case 'Medicine':
        Get.to(Medicine());
        break;
      default:
      // Optional: show a toast/snackbar for unhandled categories
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Coming soon: $title')),
        );

    }
  }
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: Text(
          'Janatar hat',
          style: TextStyle(
            color: AppColor.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              width: 225,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.black),
                      Text('Search item here ',),
                    ]
                ),
              ),
            ),
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
      bottomNavigationBar: BottomNavigation(index: 1,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 18),
              child: Row(
                children: [
                  TextButton(
                      onPressed: (){
                        Get.to(() => Category());
                      },
                      child: Text('Grocery',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  TextButton(
                    onPressed: (){
                      //Get.to(() => Electronics());
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Coming soon: '),
                          )
                      );
                    },
                    child: Text('Electronic',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  TextButton(
                    onPressed: (){
                      //Get.to(() => BabyKids());
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Coming soon: '),
                          )
                      );
                    },
                    child: Text('Babykid',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  TextButton(
                    onPressed: (){
                      //Get.to(() => Medicine());
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Coming soon: '),
                          )
                      );
                    },
                    child:  Text('Medicine',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),

                ],
              ),
            ),
            TopProductsSection(),
            TopProductsSection2(),
            TopProductsSection(),
            TopProductsSection2(),
          ],
        ),
      ),
    );
  }
}
