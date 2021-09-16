import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/mega_commons.dart';

class PayCardsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool useGlassMorphism = false.obs;
  RxBool isCvvFocused = false.obs;

  void changeGlassMorphism() {
    useGlassMorphism.value = !useGlassMorphism.value;
  }

  void changeCvvFocused() {
    isCvvFocused.value = !isCvvFocused.value;
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    isCvvFocused.value = creditCardModel!.isCvvFocused;
  }
}
