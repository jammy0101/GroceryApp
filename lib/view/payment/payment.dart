import 'package:cart/resources/components/roundButton.dart';
import 'package:cart/resources/components/roundButton2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../resources/color/colors.dart';
import '../../viewModel/controller/cartController.dart';
import '../myCart/myCart.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}
final CartController cartController = Get.find<CartController>();
String _selectedpayment = 'cod';

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
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
      body:  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
          ),
          title: Text('Select Payment Method', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: Text('Cash on Delivery'),
          leading: Radio<String>(
            value: 'cod',
            groupValue: _selectedpayment,
            onChanged: (value) {
              setState(() {
                _selectedpayment = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Online Payment'),
          leading: Radio<String>(
            value: 'online',
            groupValue: _selectedpayment,
            onChanged: (value) {
              setState(() {
                _selectedpayment = value!;
              });
            },
          ),
        ),
        Obx(
              () => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total: ৳${cartController.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ),
        SizedBox(height: 100,),
        RoundButton2(
          width: 325,
            height: 40,
            title: 'Confirm',
            onPress: (){

            },
            buttonColor2: AppColor.blueColor,
        ),
      ],
    ),
    );
  }
}
