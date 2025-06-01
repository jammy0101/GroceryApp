import 'package:carousel_slider/carousel_slider.dart';
import 'package:cart/resources/color/colors.dart';
import 'package:cart/view/babykids/babykids.dart';
import 'package:cart/view/myCart/myCart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../resources/bottumNavigationBar/bottumnavigationbar.dart';
import '../../resources/items/items.dart';
import '../../resources/top_products/top_product2.dart';
import '../../resources/top_products/top_products.dart';
import '../../resources/utils/utils.dart';
import '../../viewModel/controller/cartController.dart';
import '../electronics/electronics.dart';
import '../signin/signIn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  final FirebaseAuth auth = FirebaseAuth.instance;
  void navigateToCategory(String title) {
    switch (title) {
      case 'Baby Kids':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const BabyKids()));
        break;
      case 'Electronics':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Electronics()));
        break;
    // Add more cases as you build more screens.
      default:
      // Optional: show a toast/snackbar for unhandled categories
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Coming soon: $title'),
          ),
        );

    }
  }


  final CartController cartController = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.purple,
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
      bottomNavigationBar: BottomNavigation(index: 0,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 135.0, autoPlay: true),
              items:
                  banners.map((banner) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          banner,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    );
                  }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    mainAxisExtent: 100,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context,index){
                  final category = categories[index];
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: InkWell(
                              onTap: (){
                                navigateToCategory(category['title']);
                              },
                              child: Icon(category['icon'],color: Colors.purple,)),
                        ),
                        SizedBox(height: 10,),
                        Text(category['title']),
                    ],
                    );
                  },
              ),
            ),
            const TopProductsSection(),
            const TopProductsSection2(),
          ],
        ),
      ),
    );
  }


}
