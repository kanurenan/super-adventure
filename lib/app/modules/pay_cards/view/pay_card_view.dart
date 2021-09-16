import 'package:flutter/material.dart';
import 'package:mega_commons/mega_commons.dart';
import 'package:mega_commons_dependencies/mega_commons_dependencies.dart';

import '../controllers/pay_cards_controller.dart';

class PayCardView extends GetView<PayCardsController> {
  const PayCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartões'),
      ),
      body: Obx(
        () => Column(
          children: [
            CreditCardWidget(
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              cardHolderName: controller.cardHolderName.value,
              cardNumber: controller.cardNumber.value,
              cvvCode: controller.cvvCode.value,
              showBackView: controller.isCvvFocused.value,
              expiryDate: controller.expiryDate.value,
              height: 175,
              cardBgColor: Get.theme.primaryColor,
              textStyle: TextStyle(color: Get.theme.canvasColor),
              textStyleCvv: TextStyle(color: Get.theme.errorColor),
              width: MediaQuery.of(context).size.width,
              animationDuration: const Duration(milliseconds: 1000),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      formKey: controller.formKey,
                      expiryDate: controller.expiryDate.value,
                      cvvCode: controller.cvvCode.value,
                      cardHolderName: controller.cardHolderName.value,
                      cardNumber: controller.cardNumber.value,
                      themeColor: Get.theme.primaryColor,
                      onCreditCardModelChange:
                          controller.onCreditCardModelChange,
                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Número',
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Data de Expiração',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: MegaBaseButton(
                        'Cadastrar Cartão',
                        onButtonPress: () {
                          if (controller.formKey.currentState!.validate()) {
                            print('valid!');
                          } else {
                            print('invalid!');
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
