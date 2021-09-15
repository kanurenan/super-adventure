import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/mega_commons.dart';
import 'package:mega_commons/shared/utils/bloc_utils.dart';
import 'package:mega_features/mega_features.dart';

class ForgotPasswordController extends GetxController {
  final ForgotPasswordProvider _forgotPasswordProvider;

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool _isLoading = false.obs;

  ForgotPasswordController(
      {required ForgotPasswordProvider forgotPasswordProvider})
      : _forgotPasswordProvider = forgotPasswordProvider;

  bool get isLoading => _isLoading.value;

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      _isLoading.value = true;
      BlocUtils.load(
        action: () async {
          final megaResponse = await _forgotPasswordProvider.onSubmitRequest(
            emailController.text,
          );
          MegaSnackbar.showSuccessSnackBar(megaResponse.message!);
          Get.back();
        },
      );
      _isLoading.value = false;
    }
  }
}
