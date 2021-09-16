import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/mega_commons.dart';

class PayCardsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isCvvFocused = false.obs;
  RxString cardNumber = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString cvvCode = ''.obs;

  void changeCvvFocused() {
    isCvvFocused.value = !isCvvFocused.value;
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    isCvvFocused.value = creditCardModel!.isCvvFocused;
    cardNumber.value = creditCardModel.cardNumber;
    cardHolderName.value = creditCardModel.cardHolderName;
    expiryDate.value = creditCardModel.expiryDate;
    cvvCode.value = creditCardModel.cvvCode;
  }
}
