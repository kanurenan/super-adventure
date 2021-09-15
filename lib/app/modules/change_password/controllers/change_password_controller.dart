import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/mega_commons.dart';
import 'package:mega_features/app/data/providers/change_password_provider.dart';

class ChangePasswordController extends GetxController {
  final ChangePasswordProvider _changePasswordProvider;

  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ChangePasswordController(
      {required ChangePasswordProvider changePasswordProvider})
      : _changePasswordProvider = changePasswordProvider;

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      _isLoading.value = true;
      BlocUtils.load(
        action: () async {
          final megaResponse = await _changePasswordProvider.onSubmitRequest(
            ChangePasswordParams(
              currentPassword: currentPassword.text,
              newPassword: newPassword.text,
            ),
          );
          MegaSnackbar.showSuccessSnackBar(megaResponse.message!);
          Get.back();
        },
      );
      _isLoading.value = false;
    }
  }
}
