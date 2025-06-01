import 'package:cart/resources/color/colors.dart';
import 'package:flutter/material.dart';

class BabyKids extends StatefulWidget {
  const BabyKids({super.key});

  @override
  State<BabyKids> createState() => _BabyKidsState();
}

class _BabyKidsState extends State<BabyKids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BAby Kids'),
        centerTitle: true,
        backgroundColor: AppColor.blueColor,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
