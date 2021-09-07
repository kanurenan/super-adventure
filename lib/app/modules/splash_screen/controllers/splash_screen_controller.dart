import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/main.dart';
import 'package:mega_commons_dependencies/main.dart';

class SplashScreenController extends GetxController {
  final Rx<Widget> _bodyContainer = Rx<Widget>(Container());

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
        const Text(
          'SplashScreen',
        );
    startTimer();
    super.onInit();
  }

  Timer startTimer() {
    const Duration _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  void navigate() {
    final AuthToken? accessTokenData = AuthToken.fromCache();
    if (accessTokenData == null) {
      Get.offAllNamed(loginRoute!);
    } else {
      Get.offAllNamed(homeRoute!);
    }
  }
}
