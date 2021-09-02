import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  final String? loginRoute;
  final String? homeRoute;
  final Widget? body;

  SplashScreenBinding({
    this.loginRoute,
    this.homeRoute,
    this.body,
  });
  @override
  void dependencies() {
    Get.put<SplashScreenController>(
      SplashScreenController(
        loginRoute: loginRoute,
        homeRoute: homeRoute,
        body: body,
      ),
    );
  }
}
