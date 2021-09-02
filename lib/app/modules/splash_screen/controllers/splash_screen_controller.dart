import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/main.dart';
import 'package:mega_commons_dependencies/main.dart';

class SplashScreenController extends GetxController {
  final _bodyContainer = Rx<Widget>(Container());

  late final Box accessTokenBox;

  final String? loginRoute;
  final String? homeRoute;
  final Widget? body;

  Widget get bodyContainer => _bodyContainer.value;

  SplashScreenController({
    this.loginRoute,
    this.homeRoute,
    this.body,
  });

  @override
  void onInit() {
    _bodyContainer.value = body ??
        Container(
          child: Text(
            'SplashScreen',
          ),
        );
    startTimer();
    super.onInit();
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  void navigate() {
    final accessTokenData = AuthToken.fromCache();
    if (accessTokenData == null) {
      Get.offAllNamed(loginRoute!);
    } else {
      Get.offAllNamed(homeRoute!);
    }
  }
}
