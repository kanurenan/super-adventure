import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/main.dart';
import 'package:mega_commons_dependencies/main.dart';
import 'package:mega_features/mega_features.dart';

class LoginController extends GetxController {
  final LoginProvider _loginProvider;
  final String _homeRoute;

  late final Box accessTokenBox;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  LoginController({
    required LoginProvider loginProvider,
    required String homeRoute,
  })  : _loginProvider = loginProvider,
        _homeRoute = homeRoute;

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
      _isLoading.value = true;
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
        Get.offAllNamed(_homeRoute);
      } on MegaResponse catch (e) {
        MegaSnackbar.showErroSnackBar(
          'Login',
          e.message!,
        );
      } finally {
        _isLoading.value = false;
      }
    }
  }
}
