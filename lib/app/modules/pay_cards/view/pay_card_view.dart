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
              cardHolderName: 'Renan Santos',
              cardNumber: '4111 1111 1111 1111',
              cvvCode: '111',
              showBackView: controller.isCvvFocused.value,
              expiryDate: '12/2021',
              height: 175,
              isHolderNameVisible: true,
              cardBgColor: Colors.red,
              textStyle: TextStyle(color: Get.theme.canvasColor),
              width: MediaQuery.of(context).size.width,
              animationDuration: const Duration(milliseconds: 1000),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      formKey: controller.formKey,
                      expiryDate: '',
                      cvvCode: '',
                      cardHolderName: '',
                      themeColor: Colors.blue,
                      cardNumber: '',
                      onCreditCardModelChange:
                          controller.onCreditCardModelChange,
                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Número',
                        hintText: 'XXXX XXXX XXXX XXXX',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Glassmorphism',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Obx(
                          () => Switch(
                            value: controller.useGlassMorphism.value,
                            inactiveTrackColor: Colors.grey,
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            onChanged: (bool value) {
                              controller.useGlassMorphism.value = value;
                            },
                          ),
                        )
                      ],
                    ),
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
