import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/main.dart';
import 'package:mega_commons/shared/helpers/custom_dio/mega_response.dart';
import 'package:mega_commons/shared/models/auth_token.dart';
import 'package:mega_commons/shared/models/profile_token.dart';
import 'package:mega_commons_dependencies/main.dart';
import 'package:mega_features/app/data/providers/login_provider.dart';

class LoginController extends GetxController {
  final LoginProvider _loginProvider;

  late final Box accessTokenBox;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginController({required LoginProvider loginProvider})
      : _loginProvider = loginProvider;

  @override
  void onInit() {
    super.onInit();
    accessTokenBox = MegaDataCache.box<AuthToken>();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void save() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final profileToken = ProfileToken(
        email: emailController.text,
        password: passwordController.text,
      );
      try {
        final response =
            await _loginProvider.authenticateUserByEmail(profileToken);
        await accessTokenBox.put(
          AuthToken.cacheBoxKey,
          response,
        );
        Get.offAllNamed('');
      } on MegaResponse catch (e) {
        Get.snackbar(
          'MegaExample',
          e.message!,
          backgroundColor: Get.theme.errorColor.withOpacity(0.7),
        );
      }
    }
  }
}
