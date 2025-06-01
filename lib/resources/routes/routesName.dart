

import 'package:cart/resources/routes/routes.dart';
import 'package:cart/view/Medicine/medicine.dart';
import 'package:cart/view/electronics/electronics.dart';
import 'package:cart/view/resgistration/registration.dart';
import 'package:cart/view/signin/signIn.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../splashScreen/splashScreen.dart';
import '../../view/babykids/babykids.dart';

class AppRoutes {

  static appRoutes() => [

    GetPage(
      name: RoutesName.splashscreen,
      page: () => const Splashscreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),

    GetPage(
        name: RoutesName.signIn,
        page: () => SignIn(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RoutesName.signUp,
      page: () => Registration(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RoutesName.babyKid,
      page: () => BabyKids(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RoutesName.electronics,
      page: () => Electronics(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RoutesName.medicine,
      page: () => Medicine(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
  ];
}