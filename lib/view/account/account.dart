import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../resources/bottumNavigationBar/bottumnavigationbar.dart';
import '../../resources/color/colors.dart';
import '../../resources/utils/utils.dart';
import '../../viewModel/controller/cartController.dart';
import '../myCart/myCart.dart';
import '../signin/signIn.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}
final CartController cartController = Get.find<CartController>();
final FirebaseAuth auth = FirebaseAuth.instance;
void _signOut() async {
  try {
    await auth.signOut();
    Utils.toastMessage('Signed out successfully');
    Get.offAll(() => const SignIn());
  } catch (e) {
    Utils.toastMessage('Error signing out: ${e.toString()}');
  }
}
class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        automaticallyImplyLeading: false,
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
      bottomNavigationBar: BottomNavigation(index: 3,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
           Center(
             child:  CircleAvatar(
               radius: 60,
               backgroundColor: Colors.red,
               backgroundImage: AssetImage('assets/images/perrier.jpeg'),
             ),
           ),
            SizedBox(height: 7,),
            Text('RASHID KHAN',style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.edit),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    child: Text('Edit profile'),
                  ),
                ),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.shopping_cart),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){
                    Get.to(() => MyCart());
                  },
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    child: Text('My order'),
                  ),
                ),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.favorite),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    child: Text('Wishlist'),
                  ),
                ),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.notifications),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    child: Text('Notification'),
                  ),
                ),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.shopping_cart),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    child: Text('shipping address'),
                  ),
                ),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.help_center),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    child: Text('Help Centre'),
                  ),
                ),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.feedback_sharp),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    child: Text('Feedback'),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){
                    _signOut();
                  },
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    child: Text('Logout',style: TextStyle(color: Colors.red),),
                  ),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
