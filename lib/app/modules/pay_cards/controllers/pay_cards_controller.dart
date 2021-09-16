import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_commons/mega_commons.dart';
import 'package:mega_commons/shared/models/credit_card.dart';

import '../../../../mega_features.dart';

class PayCardsController extends GetxController {
  final PayCardsProvider _payCardsProvider;

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController =
      MaskedTextController(mask: '0000 0000 0000 0000');
  final TextEditingController expiryDateController =
      MaskedTextController(mask: '00/00');
  final TextEditingController cvvController =
      MaskedTextController(mask: '0000');

  FocusNode cvvFocusNode = FocusNode();
  FocusNode cardNumberNode = FocusNode();
  FocusNode expiryDateNode = FocusNode();
  FocusNode cardHolderNode = FocusNode();

  RxBool isCvvFocused = false.obs;
  RxString cardNumber = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString cvvCode = ''.obs;

  PayCardsController({required PayCardsProvider payCardsProvider})
      : _payCardsProvider = payCardsProvider;

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      final CreditCard creditCard = CreditCard(
        name: nameController.text,
        number: numberController.text,
        expMonth: int.parse(expiryDateController.text.split('/')[0]),
        expYear: int.parse('20${expiryDateController.text.split('/')[1]}'),
        cvv: cvvController.text,
      );
      BlocUtils.load(action: () async {
        await _payCardsProvider.onSubmitRequest(creditCard);
      });
    }
  }
}
