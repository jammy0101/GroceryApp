import 'package:flutter/material.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
