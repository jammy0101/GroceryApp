
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../splashServices/splashServices.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

SplashService  splashService = SplashService();

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('My project',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),)),
        ],
      ),
    );
  }
}
