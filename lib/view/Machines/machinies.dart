import 'package:flutter/material.dart';

class Machines extends StatefulWidget {
  const Machines({super.key});

  @override
  State<Machines> createState() => _MachinesState();
}

class _MachinesState extends State<Machines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machines'),
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
