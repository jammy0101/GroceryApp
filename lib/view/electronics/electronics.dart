import 'package:flutter/material.dart';

import '../../resources/color/colors.dart';

class Electronics extends StatefulWidget {
  const Electronics({super.key});

  @override
  State<Electronics> createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronics'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
