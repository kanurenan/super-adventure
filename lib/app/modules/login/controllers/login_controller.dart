import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/mega_commons.dart';
import 'package:mega_commons_dependencies/mega_commons_dependencies.dart';
import 'package:mega_features/mega_features.dart';

class LoginController extends GetxController {
  final LoginProvider _loginProvider;
  final String _homeRoute;

  late final Box accessTokenBox;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool _isLoading = false.obs;

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

  Future<void> save() async {
    if (formKey.currentState!.validate()) {
      _isLoading.value = true;
      formKey.currentState!.save();
      final ProfileToken profileToken = ProfileToken(
        email: emailController.text,
        password: passwordController.text,
      );
      BlocUtils.load(
        action: () async {
          final AuthToken response =
              await _loginProvider.authenticateUserByEmail(profileToken);
          await accessTokenBox.put(
            AuthToken.cacheBoxKey,
            response,
          );
          Get.offAllNamed(_homeRoute);
        },
      );
      _isLoading.value = false;
    }
  }
}
