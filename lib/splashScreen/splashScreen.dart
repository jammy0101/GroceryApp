//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../splashServices/splashServices.dart';
//
// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});
//
//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }
//
// SplashService  splashService = SplashService();
//
// class _SplashscreenState extends State<Splashscreen> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     splashService.isLogin(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  const Scaffold(
//       body: Column(
//
//         children: [
//           Image(
//             fit: BoxFit.fill,
//               image: ExactAssetImage('assets/images/super2.jpg')),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../splashServices/splashServices.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();
    splashService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          'assets/images/super.jpg',
          fit: BoxFit.cover, // covers full screen
        ),
      ),
    );
  }
}
