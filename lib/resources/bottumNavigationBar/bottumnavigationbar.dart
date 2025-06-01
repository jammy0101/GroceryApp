
import 'package:cart/view/category/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../view/account/account.dart';
import '../../view/home_screen/home_screen.dart';
import '../../view/myCart/myCart.dart';



class BottomNavigation extends StatefulWidget {
  final int index ;
  const BottomNavigation({super.key,required this.index});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  late int myIndex = widget.index;

  List<Widget>  widgetList = const [
    Text('Home',style: TextStyle(fontSize: 40)),
    Text('Music',style: TextStyle(fontSize: 40)),
    Text('News',style: TextStyle(fontSize: 40)),
  ];

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      //showSelectedLabels: true,
      //showUnselectedLabels: false,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.indigo,
      type: BottomNavigationBarType.shifting,
      onTap: (index){
        switch (index) {
          case 0:
            Get.to(() => const HomeScreen()); // Correct home navigation
            break;
          case 1:
            Get.to(() => const Category()); // Correct home navigation
            break;
          case 2:
            Get.to(() => MyCart()); // Correct home navigation
            break;
          case 3:
            Get.to(() => const Account()); // Correct home navigation
            break;
        }
        setState(() {
          myIndex = index;
        });

      },
      currentIndex: myIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.category_rounded),label: 'Category',backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart',backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account',backgroundColor: Colors.white),
      ],
    );
  }
}